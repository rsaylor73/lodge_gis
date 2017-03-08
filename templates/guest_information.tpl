<style>
.top-buffer { margin-top:10px; margin-left:10px; margin-right:10px; }
</style>

<table width="990" border="0" align="center" cellpadding="15" cellspacing="0">
  <tr>
    <td bgcolor="#FFFFFF"><p>


<div class="step-content">
	<div data-step="1" class="step-pane active">
		<div class="form-group">
			<form action="/update_guest_information" method="post">

			<!-- heading -->
			<div class="col-sm-12">
			<b>Online Application and Waiver Form - Guest Information (Step {$step} of {$max})</b><br>
			<h2>General Contact Information</h2>
			</div>


			<!-- row 1 -->
			<div class="row top-buffer">
				<div class="col-sm-3">
					<label for="title">Title:</label>
				</div>
				<div class="col-sm-3">
					<select name="title" id="title" class="form-control" {$readonly}>{$title}
					{if $title ne ""}
						<option value="{$title}">{$title} (Default)</option>
					{/if}
		                        <option>Mr.</option>
	        	                <option>Ms.</option>
	                	        <option>Mrs.</option>
	                        	<option>Dr.</option>
		                        <option>Miss</option>
		                        <option>Prof.</option>
	        	                <option>Capt.</option>
	                	        <option>Rev.</option></select>
				</div>

				<div class="col-sm-3">
			                <label for="occupation">Occupation:</label>
				</div>
		                <div class="col-sm-3">
					<input type="text" name="occupation" id="occupation" value="{$occupation}" class="form-control" {$readonly}>
				</div>
			</div>

			<!-- rows 2 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
		                        <label for="first">First Name:</label>
				</div>
	                        <div class="col-sm-3">
					<input type="text" name="first" id="first" value="{$first}" required class="form-control" readonly>
                	        </div>

				<div class="col-sm-3">
		                        <label for="phone1_type">{$phone1_type} Phone:<br>Country Code and your number</label>
				</div>
	                        <div class="col-sm-3">
					<input type="hidden" name="phone1_type" value="{$phone1_type}">
					<input type="text" name="phone1" id="phone1" value="{$phone1}" placeholder="44xxxxxxxxxx" required class="form-control" {$readonly}>
                        	</div>
			</div>


			<!-- row 3 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
		                        <label for="middle">Middle Name:</label>
				</div>
	                        <div class="col-sm-3">
        	                        <input type="text" name="middle" id="middle" value="{$middle}" class="form-control" readonly {$readonly}>
				</div>

				<div class="col-sm-3">
		                        <label for="phone2">{$phone2_type} Phone:<br>Country Code and your number</label>
				</div>
	                        <div class="col-sm-3">
        	                        <input type="hidden" name="phone2_type" value="{$phone2_type}">
                	                <input type="text" name="phone2" id="phone2" value="{$phone2}" placeholder="17069932531" class="form-control" {$readonly}>
				</div>
			</div>

			<!-- row 4 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
		                        <label for="last">Last Name:</label>
				</div>
	                        <div class="col-sm-3">
        	                        <input type="text" name="last" id="last" value="{$last}" required class="form-control" readonly>
				</div>

				<div class="col-sm-3">
		                        <label for="phone3">{$phone3_type} Phone:<br>Country Code and your number</label>
				</div>
	                        <div class="col-sm-3">
				<input type="hidden" name="phone3_type" value="{$phone3_type}">
	                                <input type="text" name="phone3" id="phone3" value="{$phone3}" placeholder="49xxxxxxxxxx" class="form-control" {$readonly}>
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
        	                        <input type="text" name="preferred_name" id="preferred_name" value="{$preferred_name}" class="form-control" {$readonly}>
				</div>

				<div class="col-sm-3">
		                        <label for="donottext" class="control-label">Text Notifications:</label>
				</div>
	                        <div class="col-sm-3">
					<input type="checkbox" name="donottext" id="donottext" {$donottext} value="checked" {$readonly}> Check if you <b>DO NOT</b> wish to 
					receive text notifications about your vacation.
				</div>
			</div>

			<!-- row 7-->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
		                        <label for="gender">Gender:</label>
				</div>
	                        <div class="col-sm-3">
					<select name="gender" id="gender" class="form-control" required {$readonly}>
					{if $gender eq ""}
						<option selected value="">--Select--</option>
						<option>male</option>
						<option>female</option>
					{else}
						<option selected>{$gender}</option>
					{/if}
					</select>
				</div>

				<div class="col-sm-3">
					<label for="email">Email:</label>
				</div>
				<div class="col-sm-3">
					<input type="email" name="email" id="email" value="{$email}" class="form-control" required {$readonly}>
				</div>
			</div>

			<!-- row 8-->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
		                        <label for="dob">Date Of Birth:</label>
				</div>
	                        <div class="col-sm-3">
					<input type="text" name="dob" id="dob" value="{$dob}" class="form-control" {$readonly}>
				</div>

				<div class="col-sm-6">&nbsp;</div>
			</div>


			<!-- row 9 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
		                        <label for="address1">Street Address:</label>
				</div>
	                        <div class="col-sm-3">
					<input type="text" name="address1" id="address1" value="{$address1}" required class="form-control" {$readonly}>
				</div>

				<div class="col-sm-3">
		                        <label for="address2">Apartment/Building:</label>
				</div>
	                        <div class="col-sm-3">
					<input type="text" name="address2" id="address2" value="{$address2}" class="form-control" {$readonly}>
				</div>
			</div>

			<!-- row 11 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
		                        <label for="city">City:</label>
				</div>
	                        <div class="col-sm-3">
					<input type="text" name="city" id="city" value="{$city}" class="form-control" {$readonly}>
				</div>

				<div class="col-sm-3">
		                        <label for="province">Province/Territory:</label>
				</div>
				<div class="col-sm-3">
					<input type="text" name="province" id="province" value="{$province}" class="form-control" {$readonly}>
				</div>
			</div>

			<!-- row 13 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
					<label for="state">State:</label>
				</div>
				<div class="col-sm-3">
					<select name="state" id="state" class="form-control" {$readonly}>
					{$state}
					</select>
				</div>

				<div class="col-sm-3">		
		                        <label for="zip">Zip:</label>
				</div>
	                        <div class="col-sm-3">
					<input type="text" name="zip" value="{$zip}" id="zip" class="form-control" {$readonly}>
				</div>
			</div>

			<!-- row 15 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
		                        <label for="country">Country:</label>
				</div>
	                        <div class="col-sm-3">
					<select name="country" id="country" required class="form-control" {$readonly}>
					{$country}
					</select>
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
					<select name="nationality_countryID" id="nationality_countryID" required class="form-control" {$readonly}>
					{$nationality_country}
					</select>
				</div>

				<div class="col-sm-3">        
			                <label for="passport_number">Passport #:</label>
				</div>
	                        <div class="col-sm-3">
					<input type="text" name="passport_number" id="passport_number" value="{$passport_number}" class="form-control" {$readonly}>
				</div>
			</div>

			<!-- row 17 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
		                        <label for="passport_exp">Passport Expiration:</label>
				</div>
				<div class="col-sm-3">
					<input type="text" name="passport_exp" id="passport_exp" value="{$passport_exp}" class="form-control" {$readonly}>
				</div>

				<div class="col-sm-6">&nbsp;</div>
			</div>
			<!-- row 18 -->
			<div class="row top-buffer">
				<div class="col-sm-12">
				 I understand my passport must be valid for at least 6 months beyond the period of my stay. It is my responsibility to ensure I have the proper passport and visa to travel into each country on my itinerary as well as the return. I understand I should check with a consulate in my country of citizenship to ensure proper passport and visa requirements are met. <br><input type="checkbox" name="agree" value="checked" required {$readonly}> <b>I Agree</b>
				</div>
			</div>

			<!-- submit -->
			<div class="row top-buffer">
				<div class="col-sm-12">
					{if $readonly eq "readonly"}
						<h3>This form has already been submitted.</h3>
					{else}
						<input type="submit" value="Save" class="btn btn-success">
					{/if}
				</div>
			</div>

			</form>

		</div>
	</div>
</div>


</p></td>
  </tr>
</table>
