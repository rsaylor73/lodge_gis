<style>
.top-buffer { margin-top:10px; margin-left:10px; margin-right:10px; }
</style>

<table width="990" border="0" align="center" cellpadding="15" cellspacing="0">
  <tr>
    <td bgcolor="#FFFFFF"><p>


<div class="step-content">
        <div data-step="1" class="step-pane active">
                <div class="form-group">
                        <form action="/update_trip_insurance" method="post">

                        <!-- heading -->
                        <div class="row top-buffer">
                                <div class="col-sm-12">
                                        <b>Online Application and Waiver Form - Trip Insurance (Step {$step} of {$max})</b><br>
                                </div>
                        </div>





			<div class="row top-buffer">
				<div class="col-sm-12">
					Aggressor Fleet Fleet strongly recommend that each guest purchase comprehensive dive, accident, medical, baggage, trip cancellation and interruption insurance.
					<br><br>
					Please research and understand the details of the policies you purchase. It is important you understand the coverages your policy offers and any limitations 
					that may exist on claims made. 
					<br>
				</div>
			</div>

			<div class="row top-buffer">
				<div class="col-sm-6">
					<div class="row">
						<div class="top-buffer">
							<div class="col-sm-12">
								<input type="radio" name="insurance" value="yes"
								{if $insurance eq "yes"} checked {/if}
								 required> <b>I have purchased Trip Insurance</b>
							</div>
						</div>
						<br>
						<div class="top-buffer">
							<div class="col-sm-6">
								<b>If yes from what company:</b>
							</div>
							<div class="col-sm-6">
								 <select name="trip_company" class="form-control" {$readonly}>
									{if $trip_company eq ""}
									<option value="">Choose One</option>
									{else}
									<option selected>{$trip_company}</option>
									{/if}
									<option>DAN</option>
									<option>Dive Assure</option>
									<option>Other</option>
								</select>
							</div>
						</div>
						<br><br>
						<div class="top-buffer">
							<div class="col-sm-6">
								<b>Policy Number:</b>
							</div>
							<div class="col-sm-6">
								<input type="text" name="trip_policy" value="{$trip_policy}" class="form-control" {$readonly}>
							</div>
						</div>

						<br><br>
						<div class="top-buffer">
							<div class="col-sm-6">
								<b>Date Issued:</b>
							</div>
							<div class="col-sm-6">
								<input type="text" name="date_issued" id="date_issued" value="{$date_issued}" class="form-control" 
								placeholder="purchase date" {$readonly}>
							</div>
						</div>

						<br><br>
						<div class="top-buffer">
							<div class="col-sm-12">
                                                                <input type="radio" name="insurance" value="no"
								{if $insurance ne "yes"} checked {/if}
								 required> <b> I hereby decline the opportunity to purchase Trip Insurance and personally accept financial responsibility for any incidents that may cause my trip to be cancelled or not completed in its entirety.</b>
							</div>
						</div>



					</div>
				</div>
				<div class="col-sm-6">
					<div class="row">
						<div class="col-sm-12">
							<a href="http://www.aggressor.com/insurance.php" target=_blank><img src="images/GIS-InsuranceLogos.jpg"></a>
						</div>
					</div>
				</div>
			</div>






                        <!-- submit -->
                        <div class="row top-buffer">
                                <div class="col-sm-12">
                                        {if $readonly eq "readonly"}
                                                <h3>This form has already been submitted.</h3>
                                        {else}
                                                <input type="submit" value="Save" id="save" {$disabled} class="btn btn-success">
                                        {/if}
                                </div>
                        </div>

                        </form>
                </div>
        </div>
</div>
</p></td></tr></table>

