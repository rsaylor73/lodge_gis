<style>
.top-buffer { margin-top:10px; margin-left:10px; margin-right:10px; }
</style>

<table width="990" border="0" align="center" cellpadding="15" cellspacing="0">
  <tr>
    <td bgcolor="#FFFFFF"><p>


<div class="step-content">
        <div data-step="1" class="step-pane active">
                <div class="form-group">
                        <form action="/update_confirmation" method="post">

                        <!-- heading -->
                        <div class="col-sm-12 top-buffer">
                        <b>Online Application and Waiver Form - Confirmation (Step {$step} of {$max})</b><br>
                        <h2>Guest Information</h2>
                        </div>


			<!-- Guest Info -->
                        <!-- row 1 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
                                        <label for="title">Title:</label>
                                </div>
                                <div class="col-sm-3">{$title}</div>

                                <div class="col-sm-3">
                                        <label for="occupation">Occupation:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$occupation}
                                </div>
                        </div>

                        <!-- rows 2 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
                                        <label for="first">First Name:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$first}
                                </div>

                                <div class="col-sm-3">
                                        <label for="phone1_type">{$phone1_type} Phone:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$phone1}
                                </div>
                        </div>

                        <!-- row 3 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
                                        <label for="middle">Middle Name:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$middle}
                                </div>

                                <div class="col-sm-3">
                                        <label for="phone2">{$phone2_type} Phone:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$phone2}
                                </div>
                        </div>

                        <!-- row 4 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
                                        <label for="last">Last Name:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$last}
                                </div>

                                <div class="col-sm-3">
                                        <label for="phone3">{$phone3_type} Phone:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$phone3}
                                </div>
                        </div>

                        <!-- rows 5 -->
                        <div class="row top-buffer">
                                <div class="col-sm-12">
                                        If your name does not match your passport, or if you do not have your passport number available at this time please do not save this page or submit the waiver until your name has been corrected (email <a href="mailto:info@aggressor.com">info@aggressor.com</a>) or until you have your passport number available.
                                </div>
                        </div>
                        <!-- row 6 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
                                        <label for="preferred_name">Preferred Name:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$preferred_name}
                                </div>

                                <div class="col-sm-3">
                                        <label for="donottext">Text Notifications:</label>
                                </div>
                                <div class="col-sm-3">
					{if $donottext eq "checked"}
						No
					{else}
						Yes
					{/if}
                                </div>
                        </div>

                        <!-- row 7-->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
                                        <label for="gender">Gender:</label>
                                </div>
                                <div class="col-sm-3">{$gender}</div>

                                <div class="col-sm-3">
                                        <label for="email">Email:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$email}
                                </div>
                        </div>
                        <!-- row 8-->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
                                        <label for="dob">Date Of Birth:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$dob}
                                </div>

                                <div class="col-sm-6">&nbsp;</div>
                        </div>


                        <!-- row 9 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
                                        <label for="address1">Street Address:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$address1}
                                </div>

                                <div class="col-sm-3">
                                        <label for="address2">Apartment/Building:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$address2}
                                </div>
                        </div>

                        <!-- row 11 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
                                        <label for="city">City:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$city}
                                </div>

                                <div class="col-sm-3">
                                        <label for="province">Province/Territory:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$province}
                                </div>
                        </div>
                        <!-- row 13 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
                                        <label for="state">State:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$state}
                                </div>

                                <div class="col-sm-3">
                                        <label for="zip">Zip:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$zip}
                                </div>
                        </div>

                        <!-- row 15 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
                                        <label for="country">Country:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$country}
                                </div>
                                <div class="col-sm-6">&nbsp;</div>
                        </div>

                        <!-- heading -->
                        <div class="row top-buffer">
                                <div class="col-sm-12">
                                        <hr>
                                        <h2>Passport Information</h2>
                                </div>
                        </div>
                        <!-- row 16 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
                                        <label for="nationality_countryID">Citizenship:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$nationality_country}
                                </div>

                                <div class="col-sm-3">
                                        <label for="passport_number">Passport #:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$passport_number}
                                </div>
                        </div>

                        <!-- row 17 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
                                        <label for="passport_exp">Passport Expiration:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$passport_exp}
                                </div>

                                <div class="col-sm-6">&nbsp;</div>
                        </div>


			<!-- emergency contact -->

                        <!-- heading -->
                        <div class="col-sm-12 top-buffer">
                        <h2>Primary Emergency Contact Information</h2>
                        </div>

                        <br><br><br>
                        <!-- row 1 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
                                        <label for="title">First Name:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$firstA}
                                </div>

                                <div class="col-sm-3">
                                        <label for="occupation">Address:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$address1A}
                                </div>
                        </div>
                        <!-- row 2 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
                                        <label for="title">Last Name:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$lastA}
                                </div>
                                <div class="col-sm-3">
                                        <label for="occupation">Appartment/Unit:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$address2A}
                                </div>
                        </div>
                        <!-- row 3 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
                                        <label for="title">Relationship:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$relationshipA}
                                </div>
                                <div class="col-sm-3">
                                        <label for="occupation">City:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$cityA}
                                </div>
                        </div>
                        <!-- row 4 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
                                        <label for="title">Phone (Home):</label>
                                </div>
                                <div class="col-sm-3">
                                        {$phone_homeA}
                                </div>
                                <div class="col-sm-3">
                                        <label for="occupation">State (US only):</label>
                                </div>
                                <div class="col-sm-3">
                                        {$stateA}
                                </div>
                        </div>
                        <!-- row 5 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
                                        <label for="title">Phone (Work):</label>
                                </div>
                                <div class="col-sm-3">
                                        {$phone_workA}
                                </div>
                                <div class="col-sm-3">
                                        <label for="occupation">Zip:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$zipA}
                                </div>
                        </div>

                        <!-- row 6 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
                                        <label for="title">Phone (Mobile):</label>
                                </div>
                                <div class="col-sm-3">
                                        {$phone_mobileA}
                                </div>
                                <div class="col-sm-3">
                                        <label for="occupation">Country:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$countryA}
                                </div>
                        </div>
                        <!-- row 7 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
                                        <label for="title">Email:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$emailA}
                                </div>
                                <div class="col-sm-3">
                                        <label for="occupation"></label>
                                </div>
                                <div class="col-sm-3">
                                        <!-- blank -->
                                </div>
                        </div>

                        <!-- heading 2 -->
                        <div class="col-sm-12 top-buffer">
                        <h2>Secondary Emergency Contact Information</h2>
                        </div>

                        <!-- row 1 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
                                        <label for="title">First Name:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$firstB}
                                </div>

                                <div class="col-sm-3">
                                        <label for="occupation">Address:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$address1B}
                                </div>
                        </div>
                        <!-- row 2 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
                                        <label for="title">Last Name:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$lastB}
                                </div>
                                <div class="col-sm-3">
                                        <label for="occupation">Appartment/Unit:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$address2B}
                                </div>
                        </div>
                        <!-- row 3 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
                                        <label for="title">Relationship:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$relationshipB}
                                </div>
                                <div class="col-sm-3">
                                        <label for="occupation">City:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$cityB}
                                </div>
                        </div>
                        <!-- row 4 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
                                        <label for="title">Phone (Home):</label>
                                </div>
                                <div class="col-sm-3">
                                        {$phone_homeB}
                                </div>
                                <div class="col-sm-3">
                                        <label for="occupation">State (US only):</label>
                                </div>
                                <div class="col-sm-3">
                                        {$stateB}
                                </div>
                        </div>
                        <!-- row 5 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
                                        <label for="title">Phone (Work):</label>
                                </div>
                                <div class="col-sm-3">
                                        {$phone_workB}
                                </div>
                                <div class="col-sm-3">
                                        <label for="occupation">Zip:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$zipA}
                                </div>
                        </div>
                        <!-- row 6 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
                                        <label for="title">Phone (Mobile):</label>
                                </div>
                                <div class="col-sm-3">
                                        {$phone_mobileB}
                                </div>
                                <div class="col-sm-3">
                                        <label for="occupation">Country:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$countryB}
                                </div>
                        </div>
                        <!-- row 7 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
                                        <label for="title">Email:</label>
                                </div>
                                <div class="col-sm-3">
                                        {$emailB}
                                </div>
                                <div class="col-sm-3">
                                        <label for="occupation"></label>
                                </div>
                                <div class="col-sm-3">
                                        <!-- blank -->
                                </div>
                        </div>

			<!-- diet -->
                        <div class="row top-buffer">
                                <div class="col-sm-12">
                                        <h2>Dietary Restrictions:</h2>
                                </div>
                        </div>

                        <div class="row top-buffer">
                                <div class="col-sm-12">
					{if $request eq ""}
						None
					{else}
						{$request}
					{/if}
                                </div>
                        </div>

			<!-- trip insurance -->
                        <div class="row top-buffer">
                                <div class="col-sm-12">
                                        <h2>Trip Insurance:</h2>
                                </div>
                        </div>

                        {if $trip_company ne ""}
                        <div class="row top-buffer">
				<div class="col-sm-3">
					<label>Insurance Company:</label>
				</div>
				<div class="col-sm-3">
					{$trip_company}
				</div>
				<div class="col-sm-3">
					<label>Policy #</label>
				</div>
				<div class="col-sm-3">
					{$trip_policy}
				</div>
			</div>
                        <div class="row top-buffer">
				<div class="col-sm-3">
					<label>Date Issued:</label>
				</div>
				<div class="col-sm-3">
					{$date_issued}
				</div>
			</div>
			{else}
                        <div class="row top-buffer">
				<div class="col-sm-12">
					Trip insurance was declined.
				</div>
			</div>
			{/if}

			<!-- Travel Info -->
                        <div class="row top-buffer">
                                <div class="col-sm-12">
					<h2>Travel Info</h2>
				</div>
			</div>

                        <!-- Arrival -->
                        <div class="row top-buffer">
                                <div class="col-sm-12">
                                        <b>ARRIVAL INFORMATION (before your trip)</b><br>
                                </div>
                        </div>


                        <div class="row top-buffer">
                                <div class="col-sm-3"><b>Arrival Airport</b></div>
                                <div class="col-sm-3"><b>Airline</b></div>
                                <div class="col-sm-3"><b>Flight #</b></div>
                                <div class="col-sm-3"><b>Arrival Date & Time</b></div>
                        </div>

                        <div class="row top-buffer" id="aa1">
                                <div class="col-sm-3">{$arrival_airport1}</div>
                                <div class="col-sm-3">{$arrival_airline1}</div>
                                <div class="col-sm-3">{$arrival_flight1}</div>
                                <div class="col-sm-3">{$arrival_date_time1}</div>
                        </div>

                        <div class="row top-buffer" id="aa2" {if $arrival_airport2 eq ""}style="display:none"{/if}>
                                <div class="col-sm-3">{$arrival_airport2}</div>
                                <div class="col-sm-3">{$arrival_airline2}</div>
                                <div class="col-sm-3">{$arrival_flight2}</div>
                                <div class="col-sm-3">{$arrival_date_time2}</div>
                        </div>
                        <div class="row top-buffer" id="aa3" {if $arrival_airport3 eq ""}style="display:none"{/if}>
                                <div class="col-sm-3">{$arrival_airport3}</div>
                                <div class="col-sm-3">{$arrival_airline3}</div>
                                <div class="col-sm-3">{$arrival_flight3}</div>
                                <div class="col-sm-3">{$arrival_date_time3}</div>
                        </div>

                        <div class="row top-buffer" id="aa4" {if $arrival_airport4 eq ""}style="display:none"{/if}>
                                <div class="col-sm-3">{$arrival_airport4}</div>
                                <div class="col-sm-3">{$arrival_airline4}</div>
                                <div class="col-sm-3">{$arrival_flight4}</div>
                                <div class="col-sm-3">{$arrival_date_time4}</div>
                        </div>

                        <div class="row top-buffer" id="aa5" {if $arrival_airport5 eq ""}style="display:none"{/if}>
                                <div class="col-sm-3">{$arrival_airport5}</div>
                                <div class="col-sm-3">{$arrival_airline5}</div>
                                <div class="col-sm-3">{$arrival_flight5}</div>
                                <div class="col-sm-3">{$arrival_date_time5}</div>
                        </div>

                        <!-- Departure -->
                        <div class="row top-buffer">
                                <div class="col-sm-12">
                                        <b>DEPARTURE INFORMATION (after your trip)</b><br>
                                </div>
                        </div>
                        <div class="row top-buffer">
                                <div class="col-sm-3"><b>Departure Airport</b></div>
                                <div class="col-sm-3"><b>Airline</b></div>
                                <div class="col-sm-3"><b>Flight #</b></div>
                                <div class="col-sm-3"><b>Departure Date & Time</b></div>
                        </div>

                        <div class="row top-buffer" id="dd1">
                                <div class="col-sm-3">{$departure_airport1}</div>
                                <div class="col-sm-3">{$departure_airline1}</div>
                                <div class="col-sm-3">{$departure_flight1}</div>
                                <div class="col-sm-3">{$departure_date_time1}</div>
                        </div>

                        <div class="row top-buffer" id="dd2" {if $departure_airport2 eq ""}style="display:none"{/if}>
                                <div class="col-sm-3">{$departure_airport2}</div>
                                <div class="col-sm-3">{$departure_airline2}</div>
                                <div class="col-sm-3">{$departure_flight2}</div>
                                <div class="col-sm-3">{$departure_date_time2}</div>
                        </div>

                        <div class="row top-buffer" id="dd3" {if $departure_airport3 eq ""}style="display:none"{/if}>
                                <div class="col-sm-3">{$departure_airport3}</div>
                                <div class="col-sm-3">{$departure_airline3}</div>
                                <div class="col-sm-3">{$departure_flight3}</div>
                                <div class="col-sm-3">{$departure_date_time3}</div>
                        </div>
                        <div class="row top-buffer" id="dd4" {if $departure_airport4 eq ""}style="display:none"{/if}>
                                <div class="col-sm-3">{$departure_airport4}</div>
                                <div class="col-sm-3">{$departure_airline4}</div>
                                <div class="col-sm-3">{$departure_flight4}</div>
                                <div class="col-sm-3">{$departure_date_time4}</div>
                        </div>

                        <div class="row top-buffer" id="dd5" {if $departure_airport5 eq ""}style="display:none"{/if}>
                                <div class="col-sm-3">{$departure_airport5}</div>
                                <div class="col-sm-3">{$departure_airline5}</div>
                                <div class="col-sm-3">{$departure_flight5}</div>
                                <div class="col-sm-3">{$departure_date_time5}</div>
                        </div>

                        <!-- Hotel -->
                        <div class="row top-buffer">
                                <div class="col-sm-12">
                                        <b>Arrival Hotel</b><br>
                                </div>
                        </div>
                        <div class="row top-buffer">
                                <div class="col-sm-12">
                                        {$hotel_arrival}
                                </div>
                        </div>

                        <div class="row top-buffer">
                                <div class="col-sm-12">
                                        <b>Departure Hotel</b><br>
                                </div>
                        </div>
                        <div class="row top-buffer">
                                <div class="col-sm-12">
                                        {$hotel_departure}
                                </div>
                        </div>





			<!-- end -->
                        </form>

                </div>
        </div>
</div>


</p></td>
  </tr>
</table>

