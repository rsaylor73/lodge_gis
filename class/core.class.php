<?php

class Core {
        public $linkID;
        function __construct($linkID){ $this->linkID = $linkID; }

	public function new_mysql($sql) {
		$result = $this->linkID->query($sql) or die($this->linkID->error.__LINE__);
		return $result;
        }

        public function error() {
                // Generic error message
        	$template = "error.tpl";
        	$data = array();
        	$this->load_smarty($data,$template);
                die;
        }

        public function load_module($module) {

                if (method_exists('Core',$module)) {
                        $this->$module();
		} else {
                        print "<br><font color=red>The $module method does not exist.</font><br>";
                        die;
                }
        }

        public function load_smarty($vars,$template) {
                // loads the PHP Smarty class
                require_once(PATH.'/libs/Smarty.class.php');
                $smarty=new Smarty();
                $smarty->setTemplateDir(PATH.'/templates/');
                $smarty->setCompileDir(PATH.'/templates_c/');
                $smarty->setConfigDir(PATH.'/configs/');
                $smarty->setCacheDir(PATH.'/cache/');
                if (is_array($vars)) {
                        foreach ($vars as $key=>$value) {
                                $smarty->assign($key,$value);
                        }
                }
                $smarty->display($template);
        }

	public function check_gis() {
		//print "Section: $_GET[section]<br>ContactID: $_GET[contactID]<br>ReservationID: $_GET[reservationID]<br>
		//BedID: $_GET[bedID]<br>GIS Password: $_GET[gisPW]<br>";
		$sql = "
		SELECT	
			`b`.`reservationID`,
			`c`.`contactID`,
			`c`.`first`,
			`c`.`last`,
			`c`.`email`

		FROM
			`beds` b,
			`reserve`.`contacts` c

		WHERE
			`b`.`bedID` = '$_SESSION[bedID]'
			AND `b`.`gis_pw` = '$_SESSION[gisPW]'
			AND `b`.`contactID` = '$_SESSION[contactID]'
			AND `b`.`contactID` = `c`.`contactID`
		";
		$result = $this->new_mysql($sql);
		while ($row = $result->fetch_assoc()) {
			$logged = "1";
		}
		if ($logged != "1") {
			// try again with GET data
	                $sql = "
        	        SELECT  
                	        `b`.`reservationID`,
				`b`.`inventoryID`,
                        	`c`.`contactID`,
	                        `c`.`first`,
        	                `c`.`last`,
                	        `c`.`email`

	                FROM
        	                `beds` b,
                	        `reserve`.`contacts` c

	                WHERE
        	                `b`.`bedID` = '$_GET[bedID]'
                	        AND `b`.`gis_pw` = '$_GET[gisPW]'
	                        AND `b`.`contactID` = '$_GET[contactID]'
        	                AND `b`.`contactID` = `c`.`contactID`
	                ";
	                $result = $this->new_mysql($sql);
	                while ($row = $result->fetch_assoc()) {
				$logged = "1";
				$_SESSION['bedID'] = $_GET['bedID'];
				$_SESSION['gisPW'] = $_GET['gisPW'];
				$_SESSION['contactID'] = $_GET['contactID'];
				$_SESSION['reservationID'] = $row['reservationID'];
				$_SESSION['first'] = $row['first'];
				$_SESSION['last'] = $row['last'];
				$_SESSION['email'] = $row['email'];

				// get lodge name
				$_SESSION['lodge'] = $this->get_lodge_name($row['inventoryID']);
			
				// get starting night date
				$_SESSION['start_date'] = $this->get_reservation_dates($row['reservationID'],'ASC');

				// get number of nights
				$_SESSION['nights'] = $this->get_reservation_nights($row['reservationID']);

				// check GIS status
				$sql2 = "SELECT * FROM `gis_action` WHERE `contactID` = '$_SESSION[contactID]' AND `reservationID` = '$_SESSION[reservationID]' AND 
				`bedID` = '$_SESSION[bedID]'";
				$result2 = $this->new_mysql($sql2);
				while ($row2 = $result2->fetch_assoc()) {
					$found_gis = "1";
				}
				if ($found_gis != "1") {
					$sql2 = "INSERT INTO `gis_action` (`contactID`,`reservationID`,`bedID`,`gis_guest_info`,`gis_waiver`,`gis_policy`,
					`gis_emergency_contact`,`gis_requests`,`gis_transfers`,`gis_trip_insurance`,`gis_travel_info`,`gis_confirmation`
					) VALUES
					('$_SESSION[contactID]','$_SESSION[reservationID]','$_SESSION[bedID]','pending','pending','pending',
					'pending','pending','pending','pending','pending','pending')";
					$result2 = $this->new_mysql($sql2);
				}

				
			}
		}
		// time for error
		if ($logged != "1") {
			$this->load_smarty($null,'header.tpl');
			$data['error'] = "<br><br><font color=red>Your GIS session is no longer valid or your GIS link has expired.</font><br><br>";
			$this->load_smarty($data,'error.tpl');
			$this->load_smarty($null,'footer.tpl');
			die;
		}
	}

	public function emergency_contact() {
		$template = "emergency_contact.tpl";
		$data['step'] = "4";
                $data['max'] = MAXSTEPS; // GIS max page number

		$sql = "
		SELECT
			`c`.`emergency_first` AS 'firstA',
			`c`.`emergency_last` AS 'lastA',
			`c`.`emergency_relationship` AS 'relationshipA',
			`c`.`emergency_ph_home` AS 'phone_homeA',
			`c`.`emergency_ph_work` AS 'phone_workA',
			`c`.`emergency_ph_mobile` AS 'phone_mobileA',
			`c`.`emergency_email` AS 'emailA',
			`c`.`emergency_address1` AS 'address1A',
			`c`.`emergency_address2` AS 'address2A',
			`c`.`emergency_city` AS 'cityA',
			`c`.`emergency_state` AS 'stateA',
			`c`.`emergency_zip` AS 'zipA',
			`c`.`emergency_countryID` AS 'countryA',

                        `c`.`emergency2_first` AS 'firstB',
                        `c`.`emergency2_last` AS 'lastB',
                        `c`.`emergency2_relationship` AS 'relationshipB',
                        `c`.`emergency2_ph_home` AS 'phone_homeB',
                        `c`.`emergency2_ph_work` AS 'phone_workB',
                        `c`.`emergency2_ph_mobile` AS 'phone_mobileB',
                        `c`.`emergency2_email` AS 'emailB',
                        `c`.`emergency2_address1` AS 'address1B',
                        `c`.`emergency2_address2` AS 'address2B',
                        `c`.`emergency2_city` AS 'cityB',
                        `c`.`emergency2_state` AS 'stateB',
                        `c`.`emergency2_zip` AS 'zipB',
                        `c`.`emergency2_countryID` AS 'countryB'

		FROM
			`reserve`.`contacts` c

		WHERE
			`c`.`contactID` = '$_SESSION[contactID]'
		";	
		$result = $this->new_mysql($sql);
		while ($row = $result->fetch_assoc()) {
			foreach ($row as $key=>$value) {
				$data[$key] = $value;
			}
			$data['stateA'] = $this->get_states($row['stateA']);
			$data['stateB'] = $this->get_states($row['stateB']);
			$data['countryA'] = $this->get_countries($row['countryA']);
                        $data['countryB'] = $this->get_countries($row['countryB']);

		}

                $status = $this->get_gis_status('gis_emergency_contact');
                if ($status != "pending") {
                        $data['readonly'] = "readonly";
                }


		$this->load_smarty($data,$template);
	}

	public function update_emergency_contact() {
                $status = $this->get_gis_status('gis_emergency_contact');
                if ($status == "pending") {
			// do update the direct

                        $p = $_POST;

                        foreach ($p as $key=>$value) {
                                $p[$key] = $this->linkID->real_escape_string($value);
                        }

			$sql = "UPDATE `reserve`.`contacts` SET 

			`emergency_first` = '$p[firstA]', `emergency_last` = '$p[lastA]', `emergency_relationship` = '$p[relationshipA]',
			`emergency_ph_home` = '$p[phone_homeA]', `emergency_ph_work` = '$p[phone_workA]', `emergency_ph_mobile` = '$p[phone_mobileA]', `emergency_email` = '$p[emailA]',
			`emergency_address1` = '$p[address1A]', `emergency_address2` = '$p[address2A]', `emergency_city` = '$p[cityA]', `emergency_state` = '$p[stateA]',
			`emergency_zip` = '$p[zipA]', `emergency_countryID` = '$p[countryA]',

                        `emergency2_first` = '$p[firstB]', `emergency2_last` = '$p[lastB]', `emergency2_relationship` = '$p[relationshipB]',
                        `emergency2_ph_home` = '$p[phone_homeB]', `emergency2_ph_work` = '$p[phone_workB]', `emergency2_ph_mobile` = '$p[phone_mobileB]', `emergency2_email` = '$p[emailB]',
                        `emergency2_address1` = '$p[address1B]', `emergency2_address2` = '$p[address2B]', `emergency2_city` = '$p[cityB]', `emergency2_state` = '$p[stateB]',
                        `emergency2_zip` = '$p[zipB]', `emergency2_countryID` = '$p[countryB]'

			WHERE `contactID` = '$_SESSION[contactID]'
			";

                        $result = $this->new_mysql($sql);
                        if ($result == "TRUE") {
                                $sql2 = "UPDATE `gis_action` SET `gis_emergency_contact` = 'complete' WHERE `contactID` = '$_SESSION[contactID]' 
				AND `reservationID` = '$_SESSION[reservationID]' AND `bedID` = '$_SESSION[bedID]'";
                                $result2 = $this->new_mysql($sql2);
                                ?>
                                <script>
                                setTimeout(function() {
                                      window.location.replace('/requests')
                                }
                                ,0);
                                </script>
                                <?php
                        }

                } else {
                        // goto next page
                        ?>
                        <script>
                        setTimeout(function() {
                              window.location.replace('/requests')
                        }
                        ,0);
                        </script>
                        <?php
                }

	}

	public function requests() {
                $template = "requests.tpl";
                $data['step'] = "5";
                $data['max'] = MAXSTEPS; // GIS max page number

                $status = $this->get_gis_status('gis_requests');
                if ($status != "pending") {
                        $data['readonly'] = "readonly";
			$data['agree'] = "checked";
                }

		$sql = "SELECT `special_passenger_details` FROM `reserve`.`contacts` WHERE `contactID` = '$_SESSION[contactID]'";
		$result = $this->new_mysql($sql);
		while ($row = $result->fetch_assoc()) {
			$data['request'] = $row['special_passenger_details'];
		}


		$this->load_smarty($data,$template);
	}

	public function update_requests() {
                $status = $this->get_gis_status('gis_requests');
                if ($status == "pending") {

                        $p = $_POST;

                        foreach ($p as $key=>$value) {
                                $p[$key] = $this->linkID->real_escape_string($value);
                        }

			$sql = "UPDATE `reserve`.`contacts` SET `special_passenger_details` = '$p[request]' WHERE `contactID` = '$_SESSION[contactID]'";

                        $result = $this->new_mysql($sql);
                        if ($result == "TRUE") {
                                $sql2 = "UPDATE `gis_action` SET `gis_requests` = 'complete' WHERE `contactID` = '$_SESSION[contactID]' 
                                AND `reservationID` = '$_SESSION[reservationID]' AND `bedID` = '$_SESSION[bedID]'";
                                $result2 = $this->new_mysql($sql2);
                                ?>
                                <script>
                                setTimeout(function() {
                                      window.location.replace('/transfers')
                                }
                                ,0);
                                </script>
                                <?php
                        }

                } else {
                        // goto next page
                        ?>
                        <script>
                        setTimeout(function() {
                              window.location.replace('/transfers')
                        }
                        ,0);
                        </script>
                        <?php
                }

	}


	public function transfers() {
                $template = "transfers.tpl";
                $data['step'] = "6";
                $data['max'] = MAXSTEPS; // GIS max page number

                $status = $this->get_gis_status('gis_transfers');
                if ($status != "pending") {
                        $data['readonly'] = "readonly";
                }


		// list transfers
		$sql = "
		SELECT
			`l`.`title`,
			`l`.`description`,
			`l`.`price`

		FROM
			`line_item_billing` b,
			`line_items` l

		WHERE
			`b`.`contactID` = '$_SESSION[contactID]'
			AND `b`.`reservationID` = '$_SESSION[reservationID]'
			AND `b`.`line_item_id` = `l`.`id`
		";

		$result = $this->new_mysql($sql);
		while ($row = $result->fetch_assoc()) {
			$html .= '
			<div class="row top-buffer">
				<div class="col-sm-4">'.$row['title'].'</div>
				<div class="col-sm-4">'.$row['description'].'</div>
				<div class="col-sm-4">$'.
					number_format($row['price'],2,'.',',')
				.' USD</div>
			</div>
			';
			$found = "1";
		}
		if ($found != "1") {
			$html .= '
			<div class="row top-buffer">
				<div class="col-sm-12"><i class="fa fa-exclamation-triangle" aria-hidden="true" style="color:red"></i> 
				<font color="#C0400"><b>You do not have any transfers. Please select at least one to continue.</b></font>
				</div>
			</div>
			';
			$data['disabled'] = 'disabled';
		}

		// get avilable transfers
		$html .= '
		<div class="row top-buffer">
			<div class="col-sm-12">
				<font color="blue"><b>The following transfers are available:</b></font>
			</div>
		</div>
		';

		$sql = "SELECT `id`,`title`,`description`,`price` FROM `line_items` ORDER BY `title` ASC";
		$result = $this->new_mysql($sql);
		while ($row = $result->fetch_assoc()) {
                        $html .= '
                        <div class="row top-buffer">
                                <div class="col-sm-4">'.$row['title'].'</div>
                                <div class="col-sm-4">'.$row['description'].'</div>
                                <div class="col-sm-4">$'.
                                        number_format($row['price'],2,'.',',')
                                .' USD <input type="checkbox" name="line_item_'.$row['id'].'" value="checked"
				onclick="document.getElementById(\'save\').disabled=false;"
				> (Click to add)</div>
                        </div>
                        ';
		}

                $data['html'] = $html;

                $this->load_smarty($data,$template);
	}


	public function update_transfers() {
                $status = $this->get_gis_status('gis_transfers');
                if ($status == "pending") {

        	        $sql = "SELECT `id`,`title`,`description`,`price` FROM `line_items` ORDER BY `title` ASC";
	                $result = $this->new_mysql($sql);
                	while ($row = $result->fetch_assoc()) {
				$i = "line_item_";
				$i .= $row['id'];
				$line_item = $_POST[$i];
				if ($line_item == "checked") {
					// insert into line items
					// userID 15 is a system user
					$today = date("Ymd");
					$sql2 = "INSERT INTO `line_item_billing` (`reservationID`,`contactID`,`line_item_id`,`date_added`,`date_updated`,`userID`) VALUES
					('$_SESSION[reservationID]','$_SESSION[contactID]','$row[id]','$today','$today','15')";
					$result2 = $this->new_mysql($sql2);
				}
			}

                        $sql = "UPDATE `gis_action` SET `gis_transfers` = 'complete' WHERE `contactID` = '$_SESSION[contactID]' 
                        AND `reservationID` = '$_SESSION[reservationID]' AND `bedID` = '$_SESSION[bedID]'";
                        $result = $this->new_mysql($sql);
                        ?>
                        <script>
                        setTimeout(function() {
                              window.location.replace('/trip_insurance')
                        }
                        ,0);
                        </script>
                        <?php
                } else {
                        // goto next page
                        ?>
                        <script>
                        setTimeout(function() {
                              window.location.replace('/trip_insurance')
                        }
                        ,0);
                        </script>
                        <?php
                }

	}

	public function trip_insurance() {
                $template = "trip_insurance.tpl";
                $data['step'] = "7";
                $data['max'] = MAXSTEPS; // GIS max page number


		$sql = "SELECT `insurance`,`trip_company`,`trip_policy`,`date_issued` FROM `beds` WHERE `bedID` = '$_SESSION[bedID]'";
		$result = $this->new_mysql($sql);
		while ($row = $result->fetch_assoc()) {
			foreach ($row as $key=>$value) {
				$data[$key] = $value;
			}
		}

                $status = $this->get_gis_status('gis_trip_insurance');
                if ($status != "pending") {
                        $data['readonly'] = "readonly";
                }


		// load data


		$this->load_smarty($data,$template);
	}


	public function update_trip_insurance() {

                $status = $this->get_gis_status('gis_trip_insurance');
                if ($status == "pending") {

                        $p = $_POST;

                        foreach ($p as $key=>$value) {
                                $p[$key] = $this->linkID->real_escape_string($value);
                        }

			$sql = "UPDATE `beds` SET `insurance` = '$p[insurance]', `trip_company` = '$p[trip_company]', `trip_policy` = '$p[trip_policy]',
			`date_issued` = '$p[date_issued]' WHERE `bedID` = '$_SESSION[bedID]'";

                        $result = $this->new_mysql($sql);
                        if ($result == "TRUE") {
                                $sql2 = "UPDATE `gis_action` SET `gis_trip_insurance` = 'complete' WHERE `contactID` = '$_SESSION[contactID]' 
                                AND `reservationID` = '$_SESSION[reservationID]' AND `bedID` = '$_SESSION[bedID]'";
                                $result2 = $this->new_mysql($sql2);
                                ?>
                                <script>
                                setTimeout(function() {
                                      window.location.replace('/gis_confirmation')
                                }
                                ,0);
                                </script>
                                <?php
                        }

                } else {
                        // goto next page
                        ?>
                        <script>
                        setTimeout(function() {
                              window.location.replace('/gis_confirmation')
                        }
                        ,0);
                        </script>
                        <?php
                }

	}

	public function travel_info() {
                $template = "travel_info.tpl";
                $data['step'] = "9";
                $data['max'] = MAXSTEPS; // GIS max page number

                $status = $this->get_gis_status('gis_travel_info');
                if ($status != "pending") {
                        $data['readonly'] = "readonly";
                }

		$sql = "SELECT * FROM `gis_travel_info` WHERE `contactID` = '$_SESSION[contactID]' AND `reservationID` = '$_SESSION[reservationID]' AND `bedID` = '$_SESSION[bedID]'";
                $result = $this->new_mysql($sql);
                while ($row = $result->fetch_assoc()) {
                        foreach ($row as $key=>$value) {
                                $data[$key] = $value;
                        }
                }



		$this->load_smarty($data,$template);

	}

	public function update_travel_info() {
                $status = $this->get_gis_status('gis_travel_info');
                if ($status == "pending") {

		$p = $_POST;
	        foreach ($p as $key=>$value) {
		        $p[$key] = $this->linkID->real_escape_string($value);
	        }

		$found = "0";
		$sql = "SELECT `id` FROM `gis_travel_info` WHERE `contactID` = '$_SESSION[contactID]' AND `reservationID` = '$_SESSION[reservationID]' AND `bedID` = '$_SESSION[bedID]'";
		$result = $this->new_mysql($sql);
		while ($row = $result->fetch_assoc()) {
			$found = "1";
		}
		if ($found == "1") {
			// update
			$sql = "UPDATE `gis_travel_info` SET `arrival_airport1` = '$p[arrival_airport1]', `arrival_airport2` = '$p[arrival_airport2]', `arrival_airport3` = 
			'$p[arrival_airport3]', `arrival_airport4` = '$p[arrival_airport4]', `arrival_airport5` = '$p[arrival_airport5]', `arrival_airline1` = '$p[arrival_airline1]',
			`arrival_airline2` = '$p[arrival_airline2]', `arrival_airline3` = '$p[arrival_airline3]', `arrival_airline4` = '$p[arrival_airline4]',
			`arrival_airline5` = '$p[arrival_airline5]', `arrival_flight1` = '$p[arrival_flight1]', `arrival_flight2` = '$p[arrival_flight2]', `arrival_flight3` = 
			'$p[arrival_flight3]', `arrival_flight4` = '$p[arrival_flight4]', `arrival_flight5` = '$p[arrival_flight5]', `arrival_date_time1` = '$p[arrival_date_time1]',
			`arrival_date_time2` = '$p[arrival_date_time2]', `arrival_date_time3` = '$p[arrival_date_time3]', `arrival_date_time4` = '$p[arrival_date_time4]',
			`arrival_date_time5` = '$p[arrival_date_time5]', `departure_airport1` = '$p[departure_airport1]', `departure_airport2` = '$p[departure_airport2]',
			`departure_airport3` = '$p[departure_airport3]', `departure_airport4` = '$p[departure_airport4]', `departure_airport5` = '$p[departure_airport5]',
			`departure_airline1` = '$p[departure_airline1]', `departure_airline2` = '$p[departure_airline2]', `departure_airline3` = '$p[departure_airline3]',
			`departure_airline4` = '$p[departure_airline4]', `departure_airline5` = '$p[departure_airline5]', `departure_flight1` = '$p[departure_flight1]',
			`departure_flight2` = '$p[departure_flight2]', `departure_flight3` = '$p[departure_flight3]', `departure_flight4` = '$p[departure_flight4]',
			`departure_flight5` = '$p[departure_flight5]', `departure_date_time1` = '$p[departure_date_time1]', `departure_date_time2` = '$p[departure_date_time2]',
			`departure_date_time3` = '$p[departure_date_time3]', `departure_date_time4` = '$p[departure_date_time4]', `departure_date_time5` = '$p[departure_date_time5]',
			`hotel_arrival` = '$p[hotel_arrival]', `hotel_departure` = '$p[hotel_departure]' WHERE
			`contactID` = '$_SESSION[contactID]' AND `reservationID` = '$_SESSION[reservationID]' AND `bedID` = '$_SESSION[bedID]'";
		} else {
			// insert
			$sql = "INSERT INTO `gis_travel_info`
			(`contactID`,`reservationID`,`bedID`,`arrival_airport1`,`arrival_airport2`,`arrival_airport3`,`arrival_airport4`,`arrival_airport5`,
			`arrival_airline1`,`arrival_airline2`,`arrival_airline3`,`arrival_airline4`,`arrival_airline5`,
			`arrival_flight1`,`arrival_flight2`,`arrival_flight3`,`arrival_flight4`,`arrival_flight5`,
			`arrival_date_time1`,`arrival_date_time2`,`arrival_date_time3`,`arrival_date_time4`,`arrival_date_time5`,
			`departure_airport1`,`departure_airport2`,`departure_airport3`,`departure_airport4`,`departure_airport5`,
			`departure_airline1`,`departure_airline2`,`departure_airline3`,`departure_airline4`,`departure_airline5`,
			`departure_flight1`,`departure_flight2`,`departure_flight3`,`departure_flight4`,`departure_flight5`,
			`departure_date_time1`,`departure_date_time2`,`departure_date_time3`,`departure_date_time4`,`departure_date_time5`,
			`hotel_arrival`,`hotel_departure`)
			VALUES
			('$_SESSION[contactID]','$_SESSION[reservationID]','$_SESSION[bedID]','$p[arrival_airport1]','$p[arrival_airport2]','$p[arrival_airport3]',
			'$p[arrival_airport4]','$p[arrival_airport5]',
                        '$p[arrival_airline1]','$p[arrival_airline2]','$p[arrival_airline3]','$p[arrival_airline4]','$p[arrival_airline5]',
                        '$p[arrival_flight1]','$p[arrival_flight2]','$p[arrival_flight3]','$p[arrival_flight4]','$p[arrival_flight5]',
                        '$p[arrival_date_time1]','$p[arrival_date_time2]','$p[arrival_date_time3]','$p[arrival_date_time4]','$p[arrival_date_time5]',
                        '$p[departure_airport1]','$p[departure_airport2]','$p[departure_airport3]','$p[departure_airport4]','$p[departure_airport5]',
                        '$p[departure_airline1]','$p[departure_airline2]','$p[departure_airline3]','$p[departure_airline4]','$p[departure_airline5]',
                        '$p[departure_flight1]','$p[departure_flight2]','$p[departure_flight3]','$p[departure_flight4]','$p[departure_flight5]',
                        '$p[departure_date_time1]','$p[departure_date_time2]','$p[departure_date_time3]','$p[departure_date_time4]','$p[departure_date_time5]',
                        '$p[hotel_arrival]','$p[hotel_departure]')
			";
		}
                $result = $this->new_mysql($sql);
                if ($result == "TRUE") {
                       $sql2 = "UPDATE `gis_action` SET `gis_travel_info` = 'complete' WHERE `contactID` = '$_SESSION[contactID]' 
                        AND `reservationID` = '$_SESSION[reservationID]' AND `bedID` = '$_SESSION[bedID]'";
                        $result2 = $this->new_mysql($sql2);
                        ?>
                        <script>
                        setTimeout(function() {
                              window.location.replace('/travel_info')
                        }
                        ,0);
                        </script>
                        <?php
                        }

                } else {
                        ?>
                        <script>
                        setTimeout(function() {
                              window.location.replace('/travel_info')
                        }
                        ,0);
                        </script>
                        <?php
		}

	}

	public function confirmation() {

                $template = "confirmation.tpl";
                $data['step'] = "8";
                $data['max'] = MAXSTEPS; // GIS max page number

                $status = $this->get_gis_status('gis_confirmation');
                if ($status != "pending") {
                        $data['readonly'] = "readonly";
                }

		// guest info
                $sql = "
                SELECT
                        `c`.`contactID`,
                        `c`.`title`,
                        `c`.`preferred_name`,
                        `c`.`first`,
                        `c`.`middle`,
                        `c`.`last`,
                        `c`.`address1`,
                        `c`.`address2`,
                        `c`.`city`,
                        `c`.`state`,
                        `c`.`province`,
                        `c`.`zip`,
                        `c`.`countryID`,
                        `c`.`email`,
                        `c`.`phone1`,
                        `c`.`phone1_type`,
                        `c`.`phone2`,
                        `c`.`phone2_type`,
                        `c`.`phone3`,
                        `c`.`phone3_type`,
                        `c`.`phone4`,
                        `c`.`phone4_type`,
                        `c`.`sex` AS 'gender',
                        `c`.`occupation`,
                        `c`.`passport_number`,
                        DATE_FORMAT(`c`.`passport_exp`, '%m/%d/%Y') AS 'passport_exp',
                        `c`.`donottext`,
                        `c`.`nationality_countryID`,
                        DATE_FORMAT(`c`.`date_of_birth`, '%m/%d/%Y') AS 'dob'
                FROM
                        `reserve`.`contacts` c

                WHERE
                        `c`.`contactID` = '$_SESSION[contactID]'

                ";

                $result = $this->new_mysql($sql);
                while ($row = $result->fetch_assoc()) {
                        foreach ($row as $key=>$value) {
                                $data[$key] = $value;
                        }
		}

		// get travel info
                $sql = "SELECT * FROM `gis_travel_info` WHERE `contactID` = '$_SESSION[contactID]' AND `reservationID` = '$_SESSION[reservationID]' AND `bedID` = '$_SESSION[bedID]'";
                $result = $this->new_mysql($sql);
                while ($row = $result->fetch_assoc()) {
                        foreach ($row as $key=>$value) {
                                $data[$key] = $value;
                        }
                }



                $this->load_smarty($data,$template);


	}

	// display the header buttons
	public function button_action() {
		$sql = "SELECT * FROM `gis_action` WHERE `contactID` = '$_SESSION[contactID]' AND `reservationID` = '$_SESSION[reservationID]' AND `bedID` = '$_SESSION[bedID]'";
		$result = $this->new_mysql($sql);
		while ($row = $result->fetch_assoc()) {
			// button order

			// Guest Information
			if ($row['gis_guest_info'] == "pending") {
				$html .= "<td width=\"99\" height=\"50\" align=\"center\" valign=\"top\">
				<a href=\"/guest_information\"><img src=\"/images/GIS-bt-start.gif\" border=\"0\" width=\"25\" height=\"25\" /></a><br />
		                <a href=\"/guest_information\">Guest Information</a></td>";
			}
                        if (($row['gis_guest_info'] == "complete") or ($row['gis_guest_info'] == "verified")) {
                                $html .= "<td width=\"99\" height=\"50\" align=\"center\" valign=\"top\">
                                <a href=\"/guest_information\"><img src=\"/images/GIS-bt-done.gif\" border=\"0\" width=\"25\" height=\"25\" /></a><br />
                                <a href=\"/guest_information\">Guest Information</a></td>";
                        }

			// Waiver
			$html .= $this->paint_button($row['gis_guest_info'],$row['gis_waiver'],'waiver','Waiver');

			// Policy
                        $html .= $this->paint_button($row['gis_waiver'],$row['gis_policy'],'policy','Policy');

			// Emergency Contact
			$html .= $this->paint_button($row['gis_policy'],$row['gis_emergency_contact'],'emergency_contact','Emergency Contact');

			// Requests
			$html .= $this->paint_button($row['gis_emergency_contact'],$row['gis_requests'],'requests','Requests');

			// Transfers
			$html .= $this->paint_button($row['gis_requests'],$row['gis_transfers'],'transfers','Transfers');

			// Trip Insurance
			$html .= $this->paint_button($row['gis_transfers'],$row['gis_trip_insurance'],'trip_insurance','Trip Insurance');

			// Confirmation
			$html .= $this->paint_button($row['gis_trip_insurance'],$row['gis_confirmation'],'confirmation','Confirmation');

			// Travel Info
			$html .= $this->paint_button($row['gis_guest_info'],$row['gis_travel_info'],'travel_info','Travel Info');

		}
		return($html);
	}

	public function paint_button($prior_action,$this_action,$link,$title) {
		$html = "";
	        if (($prior_action == "complete") or ($action == "verified")) {
        	        if ($this_action == "pending") {
                	        $html .= "<td width=\"99\" height=\"50\" align=\"center\" valign=\"top\">
                                <a href=\"/$link\"><img src=\"/images/GIS-bt-start.gif\" border=\"0\" width=\"25\" height=\"25\" /></a><br />
                                <a href=\"/$link\">$title</a></td>";
                        } else {
                                $html .= "<td width=\"99\" height=\"50\" align=\"center\" valign=\"top\">
                                <a href=\"/$link\"><img src=\"/images/GIS-bt-done.gif\" border=\"0\" width=\"25\" height=\"25\" /></a><br />
                                <a href=\"/$link\">$title</a></td>";
                        }
                } else {
                        $html .= "<td width=\"99\" height=\"50\" align=\"center\" valign=\"top\">
                        <img src=\"/images/GIS-bt-inactive.gif\" border=\"0\" width=\"25\" height=\"25\" /><br />
                        $title</td>";
                }
		return($html);
	}


	public function guest_information() {
		$template = "guest_information.tpl";

		$sql = "
		SELECT
			`c`.`contactID`,
			`c`.`title`,
			`c`.`preferred_name`,
			`c`.`first`,
			`c`.`middle`,
			`c`.`last`,
			`c`.`address1`,
			`c`.`address2`,
			`c`.`city`,
			`c`.`state`,
			`c`.`province`,
			`c`.`zip`,
			`c`.`countryID`,
			`c`.`email`,
			`c`.`phone1`,
			`c`.`phone1_type`,
			`c`.`phone2`,
			`c`.`phone2_type`,
			`c`.`phone3`,
			`c`.`phone3_type`,
			`c`.`phone4`,
			`c`.`phone4_type`,
			`c`.`sex` AS 'gender',
			`c`.`occupation`,
			`c`.`passport_number`,
			DATE_FORMAT(`c`.`passport_exp`, '%m/%d/%Y') AS 'passport_exp',
			`c`.`donottext`,
			`c`.`nationality_countryID`,
			DATE_FORMAT(`c`.`date_of_birth`, '%m/%d/%Y') AS 'dob'
		FROM
			`reserve`.`contacts` c

		WHERE
			`c`.`contactID` = '$_SESSION[contactID]'

		";

		$result = $this->new_mysql($sql);
		while ($row = $result->fetch_assoc()) {

			foreach ($row as $key=>$value) {
				$data[$key] = $value;
			}
			$data['state'] = $this->get_states($row['state']);
			$data['country'] = $this->get_countries($row['countryID']);
			$data['nationality_country'] = $this->get_countries($row['nationality_countryID']);

			if ($row['phone1_type'] == "") {
				$data['phone1_type'] = "Home";
			}
			if ($row['phone2_type'] == "") {
				$data['phone2_type'] = "Mobile";
			}
			if ($row['phone3_type'] == "") {
				$data['phone3_type'] = "Work";
			}
	                $status = $this->get_gis_status('gis_guest_info');
			if ($status != "pending") {
				$data['readonly'] = "readonly";
			}

			$data['step'] = "1"; // GIS page number
			$data['max'] = MAXSTEPS; // GIS max page number

		}

		// load template
		$this->load_smarty($data,$template);
	}

	// update guest info and goto next form
	public function update_guest_information() {
		$status = $this->get_gis_status('gis_guest_info');
		if ($status == "pending") {
			$dob = date("Ymd", strtotime($_POST['dob']));
			$passport_exp = date("Ymd", strtotime($_POST['passport_exp']));

			$p = $_POST;

			foreach ($p as $key=>$value) {
				$p[$key] = $this->linkID->real_escape_string($value);
			}

			$sql = "UPDATE `reserve`.`contacts` SET `title` = '$p[title]', `occupation` = '$p[occupation]', `phone1_type` = '$p[phone1_type]',
			`phone1` = '$p[phone1]', `phone2_type` = '$p[phone2_type]', `phone2` = '$p[phone2]', `phone3_type` = '$p[phone3_type]',
			`phone3` = '$p[phone3]', `preferred_name` = '$p[preferred_name]', `donottext` = '$p[donottext]', `sex` = '$p[gender]',
			`email` = '$p[email]', `date_of_birth` = '$dob', `address1` = '$p[address1]', `address2` = '$p[address2]',
			`city` = '$p[city]', `state` = '$p[state]', `province` = '$p[province]', `zip` = '$p[zip]', `countryID` = '$p[country]',
			`nationality_countryID` = '$p[nationality_countryID]', `passport_number` = '$p[passport_number]', `passport_exp` = '$passport_exp'
			WHERE `contactID` = '$_SESSION[contactID]'";

			$result = $this->new_mysql($sql);
			if ($result == "TRUE") {
				$sql2 = "UPDATE `gis_action` SET `gis_guest_info` = 'complete' WHERE `contactID` = '$_SESSION[contactID]' AND `reservationID` = '$_SESSION[reservationID]'
				AND `bedID` = '$_SESSION[bedID]'";
				$result2 = $this->new_mysql($sql2);
				?>
		                <script>
		                setTimeout(function() {
		                      window.location.replace('/waiver')
		                }
		                ,0);
		                </script>
				<?php				
			}

		} else {
			// goto next page
                        ?>
                        <script>
                        setTimeout(function() {
                              window.location.replace('/waiver')
                        }
                        ,0);
                        </script>
                        <?php 
		}

	}

	public function waiver() {
		$template = "waiver.tpl";
		$data['step'] = "2";
		$data['max'] = MAXSTEPS;

		$sql = "
		SELECT
			`c`.`first`,
			`c`.`middle`,
			`c`.`last`,
			`c`.`email`,
			`c`.`passport_number`,
			`c`.`nationality_countryID`

		FROM
			`reserve`.`contacts` c

		WHERE
			`c`.`contactID` = '$_SESSION[contactID]'
		";
		$result = $this->new_mysql($sql);
		while ($row = $result->fetch_assoc()) {
			foreach ($row as $key=>$value) {
				$data[$key] = $value;
			}
			$sql2 = "SELECT `country` FROM `reserve`.`countries` WHERE `countryID` = '$row[nationality_countryID]'";
			$result2 = $this->new_mysql($sql2);
			while ($row2 = $result2->fetch_assoc()) {
				$data['country'] = $row2['country'];
			}
		}
		$data['ip_address'] = $_SERVER['REMOTE_ADDR'];
		$data['date'] = date("Y-m-d H:i:s");

                $status = $this->get_gis_status('gis_waiver');
                if ($status != "pending") {
                        $data['readonly'] = "readonly";
                }

		$this->load_smarty($data,$template);

	}

	public function download_waiver() {
	        $path = "/home/livenet/atsl_waivers/";
                // contactID _ reservationID _ bedID
                $filename = $_SESSION['contactID'] . "_" . $_SESSION['reservationID'] . "_" . $_SESSION['bedID'] . ".pdf";
                $filename = $path.$filename;

		$pdf = file_get_contents($filename);
                header('Content-type: application/pdf');
                header('Content-Disposition: inline; filename="waiver.pdf"');
		print "$pdf";
	}

	public function update_waiver() {
                $status = $this->get_gis_status('gis_waiver');
                if ($status == "pending") {

	                $sql = "
        	        SELECT
                	        `c`.`first`,
                        	`c`.`middle`,
	                        `c`.`last`,
        	                `c`.`email`,
                	        `c`.`passport_number`,
                        	`c`.`nationality_countryID`

	                FROM
        	                `reserve`.`contacts` c

	                WHERE
        	                `c`.`contactID` = '$_SESSION[contactID]'
	                ";
	                $result = $this->new_mysql($sql);
        	        while ($row = $result->fetch_assoc()) {
				$first = $row['first'];
				$middle = $row['middle'];
				$last = $row['last'];
				$email = $row['email'];
				$passport_number = $row['passport_number'];
	                        $sql2 = "SELECT `country` FROM `reserve`.`countries` WHERE `countryID` = '$row[nationality_countryID]'";
       		                $result2 = $this->new_mysql($sql2);
		                while ($row2 = $result2->fetch_assoc()) {
                	                $country = $row2['country'];
                        	}
				
			}

	                $ip_address = $_SERVER['REMOTE_ADDR'];
        	        $date = date("Y-m-d H:i:s");


			// add external class
			include_once ('fpdf.class.php');
			$pdf=new PDF();

			$pdf->AddPage();
			$pdf->SetFont('Arial','',9);

			$reservation_info = "Reservation #". $_SESSION['reservationID'] . " : " . $_SESSION['lodge'] . " : Starting " . $_SESSION['start_date'] . " : Nights " . $_SESSION['nights'];
			$w=$pdf->GetStringWidth($reservation_info);
			$pdf->SetX((210-$w)/2);
			$pdf->Cell($w,0,$reservation_info,0,2,'C');
			$pdf->Ln(5);

			$pdf->SetFont('Arial','',6);
			$_WAIVER_TEXT = file_get_contents("templates/_WAIVER.html");
			$pdf->WriteHTML($_WAIVER_TEXT);
			$pdf->Ln(10);

                        $applicant = "<b>APPLICANT: </b>".$first.' '.$middle.' '.$last;
                        $email = "<b>EMAIL: </b>".$email;
                        $passport = "<b>PASSPORT NUMBER: </b>".$passport_number;
                        $nationality = "<b>CITIZENSHIP: </b>".$country;
                        $parent = "";
                        $date = "<b>DATE/TIME: </b>".$date;
                        $ipa = "<b>IP ADDRESS: </b>".$ip_address;
                        $pdf->SetFont('Arial','',10);

                        $pdf->SetX(20);
                        $pdf->WriteHTML($applicant);
                        $pdf->SetX(120);
                        $pdf->WriteHTML($email);
                        $pdf->Ln(5);

                        $pdf->SetX(20);
                        $pdf->WriteHTML($passport);
                        $pdf->SetX(120);
                        $pdf->WriteHTML($nationality);
                        $pdf->Ln(5);

                        $pdf->SetX(20);
                        $pdf->WriteHTML($date);
                        $pdf->SetX(120);
                        $pdf->WriteHTML($ipa);
                        $pdf->Ln(5);

			/* will need to program minors before launch - RBD

                        if($data['parent_name']<>'') {
                                $pdf->SetX(20);
                                $pdf->WriteHTML("<b>PARENT/GUARDIAN: </b>".$data['parent_name']);
                                $pdf->SetX(120);
                                $pdf->WriteHTML("<b>PARENT/GUARDIAN PASSPORT #: </b>".$data['parent_passport']);
                                $pdf->Ln(5);
                        }
			*/

			$path = "/home/livenet/atsl_waivers/";
			// contactID _ reservationID _ bedID
			$filename = $_SESSION['contactID'] . "_" . $_SESSION['reservationID'] . "_" . $_SESSION['bedID'] . ".pdf";
			$filename = $path.$filename;

                        if(file_exists($filename)){
				$data['error'] = "<br><font color=red>Error: waiver has already been created. Please contact an agent so we can reset your waiver.</font><br>";
				$this->load_smarty($data,'error.tpl');
                        }
                        else {
                                $pdf->Output($filename);
				//print "<br>Waiver was created.<br>";
                                $sql2 = "UPDATE `gis_action` SET `gis_waiver` = 'complete' WHERE `contactID` = '$_SESSION[contactID]' AND `reservationID` = '$_SESSION[reservationID]'
                                AND `bedID` = '$_SESSION[bedID]'";
                                $result2 = $this->new_mysql($sql2);
                                ?>
                                <script>
                                setTimeout(function() {
                                      window.location.replace('/policy')
                                }
                                ,0);
                                </script>
                                <?php
                        }


		} else {
                        // goto next page
                        ?>
                        <script>
                        setTimeout(function() {
                              window.location.replace('/policy')
                        }
                        ,0);
                        </script>
                        <?php
		}
	}

	public function policy() {
                $template = "policy.tpl";
                $data['step'] = "3";
                $data['max'] = MAXSTEPS;

                $status = $this->get_gis_status('gis_policy');
                if ($status != "pending") {
                        $data['readonly'] = "readonly";
                }

		$this->load_smarty($data,$template);
	}

	public function update_policy() {
                $status = $this->get_gis_status('gis_policy');
                if ($status == "pending") {
	                $sql2 = "UPDATE `gis_action` SET `gis_policy` = 'complete' WHERE `contactID` = '$_SESSION[contactID]' AND 
			`reservationID` = '$_SESSION[reservationID]'
                        AND `bedID` = '$_SESSION[bedID]'";
                        $result2 = $this->new_mysql($sql2);
                        ?>
                        <script>
                        setTimeout(function() {
                              window.location.replace('/emergency_contact')
                        }
                        ,0);
                        </script>
                        <?php
                } else {
                        // goto next page
                        ?>
                        <script>
                        setTimeout(function() {
                              window.location.replace('/emergency_contact')
                        }
                        ,0);
                        </script>
                        <?php
                }


	}

	private function get_gis_status($section) {
                $sql = "SELECT `$section` FROM `gis_action` WHERE `contactID` = '$_SESSION[contactID]' AND `reservationID` = '$_SESSION[reservationID]' AND 
                `bedID` = '$_SESSION[bedID]'";
                $result = $this->new_mysql($sql);
                while ($row = $result->fetch_assoc()) {
                        $status = $row[$section];
                }
		return($status);
	}

	// get list of countries
	private function get_countries($country) {
		$sql = "SELECT `countryID`,`country` FROM `countries` ORDER BY `country` ASC";
                $result = $this->new_mysql($sql);
		if ($country == "") {
			$option .= "<option selected value=\"\">--Select--</option>";
		}
                while ($row = $result->fetch_assoc()) {
			if ($country == $row['countryID']) {
				$option .= "<option selected value=\"$row[countryID]\">$row[country]</option>";
			} else {
				$option .= "<option value=\"$row[countryID]\">$row[country]</option>";
			}
		}
		return($option);
	}

	// get list of US states
	private function get_states($state) {
		$sql = "SELECT * FROM `reserve`.`state` ORDER BY `state_abbr` ASC";
		$result = $this->new_mysql($sql);
		if ($state == "") {
			$option .= "<option selected value=\"\">--Select--</option>";
		}
		while ($row = $result->fetch_assoc()) {
			if ($state == $row['state_abbr']) {
				$option .= "<option selected>$row[state_abbr]</option>";
			} else {
				$option .= "<option>$row[state_abbr]</option>";
			}
		}
		return($option);
	}

	// this code came from the lodge system : reservations.class.php
        private function get_reservation_nights($reservationID) {
                $sql = "
                SELECT
                        `inventory`.`date_code`,
                        DATE_FORMAT(`inventory`.`date_code`, '%m/%d/%Y') AS 'date'

                FROM
                        `beds`,`inventory`

                WHERE
                        `beds`.`reservationID` = '$reservationID'
                        AND `beds`.`inventoryID` = `inventory`.`inventoryID`

                GROUP BY `inventory`.`date_code`
                ";
                $result = $this->new_mysql($sql);
                while ($row = $result->fetch_assoc()) {
                        $counter++;
                }
                return $counter;
        }

	// imported from reservations.class.php from the lodge system
        private function get_reservation_dates($reservationID,$direction,$format="") {
                if ($format == "") {
                        $date_format = "%m/%d/%Y";
                }
                if ($format == "reports") {
                        $date_format = "%Y%m%d";
                }

                if (($direction == "DESC") && ($format == "")) {
                        // add 1 day to result
                        $d = "DATE_FORMAT(DATE_ADD(`inventory`.`date_code`,INTERVAL 1 DAY), '".$date_format."') AS 'date'";
                } else {
                        $d = "DATE_FORMAT(`inventory`.`date_code`, '".$date_format."') AS 'date'";
                }
                $sql = "
                SELECT
                        `inventory`.`date_code`,
                        $d

                FROM
                        `beds`,`inventory`

                WHERE
                        `beds`.`reservationID` = '$reservationID'
                        AND `beds`.`inventoryID` = `inventory`.`inventoryID`

                GROUP BY `beds`.`inventoryID`, `inventory`.`date_code`

                ORDER BY `inventory`.`date_code` $direction LIMIT 1
                ";

                $result = $this->new_mysql($sql);
                while ($row = $result->fetch_assoc()) {
                        $date = $row['date'];
                }
                return $date;
        }

	// get lodge name
	private function get_lodge_name($inventoryID) {
		$sql = "
		SELECT
			`l`.`name`

		FROM
			`inventory` i,
			`locations` l

		WHERE
			`i`.`inventoryID` = '$inventoryID'
			AND `i`.`locationID` = `l`.`id`
		";
		$result = $this->new_mysql($sql);
		while ($row = $result->fetch_assoc()) {
			$name = $row['name'];
		}
		return($name);
	}	

	// logout
	public function logout() {
		session_destroy();
		$template = "logout.tpl";
		$this->load_smarty($null,$template);
	}

// end class
}
?>
