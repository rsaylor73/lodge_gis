<style>
.top-buffer { margin-top:10px; margin-left:10px; margin-right:10px; }
</style>

<table width="990" border="0" align="center" cellpadding="15" cellspacing="0">
  <tr>
    <td bgcolor="#FFFFFF"><p>


<div class="step-content">
        <div data-step="1" class="step-pane active">
                <div class="form-group">
                        <form action="/update_emergency_contact" method="post">

                        <!-- heading -->
                        <div class="col-sm-12">
                        <b>Online Application and Waiver Form - Emergency Contact (Step {$step} of {$max})</b><br>
                        <h2>Primary Emergency Contact Information</h2>
			 The following information is intended for use in the unlikely event of an emergency where  the guest is unable to communicate with the crew or medical personnel.
			<br><br>
                        </div>

                        <br><br><br>
                        <!-- row 1 -->
			<div class="row top-buffer">
				<div class="col-sm-3">
		                        <label for="title">First Name:</label>
				</div>
                                <div class="col-sm-3">
					<input type="text" name="firstA" id="firstA" value="{$firstA}" {$readonly} required class="form-control">
				</div>

                                <div class="col-sm-3">
		                        <label for="occupation">Address:</label>
				</div>
                                <div class="col-sm-3">
	                                <input type="text" name="address1A" id="address1A" value="{$address1A}" class="form-control" {$readonly}>
				</div>
                        </div>
                        <!-- row 2 -->
			<div class="row top-buffer">
                                <div class="col-sm-3">
		                        <label for="title">Last Name:</label>
				</div>
	                        <div class="col-sm-3">
        	                        <input type="text" name="lastA" id="lastA" value="{$lastA}" {$readonly} required class="form-control">
                	        </div>
                                <div class="col-sm-3">
		                        <label for="occupation">Appartment/Unit:</label>
				</div>
	                        <div class="col-sm-3">
        	                        <input type="text" name="address2A" id="address2A" value="{$address2A}" class="form-control" {$readonly}>
				</div>
                        </div>
                        <!-- row 3 -->
			<div class="row top-buffer">
                                <div class="col-sm-3">
        		                <label for="title">Relationship:</label>
				</div>
	                        <div class="col-sm-3">
	                                <input type="text" name="relationshipA" id="relationshipA" value="{$relationshipA}" {$readonly} required class="form-control">
				</div>
                                <div class="col-sm-3">
		                        <label for="occupation">City:</label>
				</div>
	                        <div class="col-sm-3">
        	                        <input type="text" name="cityA" id="cityA" value="{$cityA}" class="form-control" {$readonly}>
				</div>
                        </div>
                        <!-- row 4 -->
			<div class="row top-buffer">
                                <div class="col-sm-3">
		                        <label for="title">Phone (Home):</label>
				</div>
	                        <div class="col-sm-3">
        	                        <input type="text" name="phone_homeA" id="phone_homeA" value="{$phone_homeA}" {$readonly} required class="form-control">
                	        </div>
                                <div class="col-sm-3">
		                        <label for="occupation">State (US only):</label>
				</div>
	                        <div class="col-sm-3">
					<select name="stateA" {$readonly} class="form-control">{$stateA}</select>
                	        </div>
			</div>
                        <!-- row 5 -->
			<div class="row top-buffer">
                                <div class="col-sm-3">
		                        <label for="title">Phone (Work):</label>
				</div>
	                        <div class="col-sm-3">
        	                        <input type="text" name="phone_workA" id="phone_workA" value="{$phone_workA}" {$readonly} required class="form-control">
                	        </div>
                                <div class="col-sm-3">
		                        <label for="occupation">Zip:</label>
				</div>
	                        <div class="col-sm-3">
					<input type="text" name="zipA" id="zipA" value="{$zipA}" {$readonly} class="form-control">
                	        </div>
			</div>
                        <!-- row 6 -->
			<div class="row top-buffer">
                                <div class="col-sm-3">
		                        <label for="title">Phone (Mobile):</label>
				</div>
	                        <div class="col-sm-3">
        	                        <input type="text" name="phone_mobileA" id="phone_mobileA" value="{$phone_mobileA}" {$readonly} required class="form-control">
	                        </div>
                                <div class="col-sm-3">
		                        <label for="occupation">Country:</label>
				</div>
	                        <div class="col-sm-3">
        	                        <select name="countryA" {$readonly} class="form-control">{$countryA}</select>
                	        </div> 
			</div>
                        <!-- row 7 -->
			<div class="row top-buffer">
                                <div class="col-sm-3">
		                        <label for="title">Email:</label>
				</div>
	                        <div class="col-sm-3">
        	                        <input type="text" name="emailA" id="emailA" value="{$emailA}" {$readonly} required class="form-control">
                	        </div>
                                <div class="col-sm-3">
		                        <label for="occupation"></label>
				</div>
	                        <div class="col-sm-3">
					<!-- blank -->
	                        </div> 
			</div>

                        <!-- heading 2 -->
                        <div class="col-sm-12">
                        <h2>Secondary Emergency Contact Information</h2>
                         The following information is intended for use in the unlikely event of an emergency where  the guest is unable to communicate with the crew or medical personnel.
                        <br><br>
                        </div>


                        <!-- row 1 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
                                        <label for="title">First Name:</label>
                                </div>
                                <div class="col-sm-3">
                                        <input type="text" name="firstB" id="firstB" value="{$firstB}" {$readonly} required class="form-control">
                                </div>

                                <div class="col-sm-3">
                                        <label for="occupation">Address:</label>
                                </div>
                                <div class="col-sm-3">
                                        <input type="text" name="address1B" id="address1B" value="{$address1B}" class="form-control" {$readonly}>
                                </div>
                        </div>
                        <!-- row 2 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
                                        <label for="title">Last Name:</label>
                                </div>
                                <div class="col-sm-3">
                                        <input type="text" name="lastB" id="lastB" value="{$lastB}" {$readonly} required class="form-control">
                                </div>
                                <div class="col-sm-3">
                                        <label for="occupation">Appartment/Unit:</label>
                                </div>
                                <div class="col-sm-3">
                                        <input type="text" name="address2B" id="address2B" value="{$address2B}" class="form-control" {$readonly}>
                                </div>
                        </div>
                        <!-- row 3 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
                                        <label for="title">Relationship:</label>
                                </div>
                                <div class="col-sm-3">
                                        <input type="text" name="relationshipB" id="relationshipB" value="{$relationshipB}" {$readonly} required class="form-control">
                                </div>
                                <div class="col-sm-3">
                                        <label for="occupation">City:</label>
                                </div>
                                <div class="col-sm-3">
                                        <input type="text" name="cityB" id="cityB" value="{$cityB}" class="form-control" {$readonly}>
                                </div>
                        </div>
                        <!-- row 4 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
                                        <label for="title">Phone (Home):</label>
                                </div>
                                <div class="col-sm-3">
                                        <input type="text" name="phone_homeB" id="phone_homeB" value="{$phone_homeB}" {$readonly} required class="form-control">
                                </div>
                                <div class="col-sm-3">
                                        <label for="occupation">State (US only):</label>
                                </div>
                                <div class="col-sm-3">
                                        <select name="stateB" {$readonly} class="form-control">{$stateB}</select>
                                </div>
                        </div>
                        <!-- row 5 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
                                        <label for="title">Phone (Work):</label>
                                </div>
                                <div class="col-sm-3">
                                        <input type="text" name="phone_workB" id="phone_workB" value="{$phone_workB}" {$readonly} required class="form-control">
                                </div>
                                <div class="col-sm-3">
                                        <label for="occupation">Zip:</label>
                                </div>
                                <div class="col-sm-3">
                                        <input type="text" name="zipA" id="zipA" value="{$zipA}" {$readonly} class="form-control">
                                </div>
                        </div>
                        <!-- row 6 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
                                        <label for="title">Phone (Mobile):</label>
                                </div>
                                <div class="col-sm-3">
                                        <input type="text" name="phone_mobileB" id="phone_mobileB" value="{$phone_mobileB}" {$readonly} required class="form-control">
                                </div>
                                <div class="col-sm-3">
                                        <label for="occupation">Country:</label>
                                </div>
                                <div class="col-sm-3">
                                        <select name="countryB" {$readonly} class="form-control">{$countryB}</select>
                                </div>
                        </div>
                        <!-- row 7 -->
                        <div class="row top-buffer">
                                <div class="col-sm-3">
                                        <label for="title">Email:</label>
                                </div>
                                <div class="col-sm-3">
                                        <input type="text" name="emailB" id="emailB" value="{$emailB}" {$readonly} required class="form-control">
                                </div>
                                <div class="col-sm-3">
                                        <label for="occupation"></label>
                                </div>
                                <div class="col-sm-3">
                                        <!-- blank -->
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
</p></td></tr></table>
