<style>
.top-buffer { margin-top:10px; margin-left:10px; margin-right:10px; }
</style>

<table width="990" border="0" align="center" cellpadding="15" cellspacing="0">
  <tr>
    <td bgcolor="#FFFFFF"><p>


<div class="step-content">
        <div data-step="1" class="step-pane active">
                <div class="form-group">
                        <form action="/process_payment" method="post">

                        <!-- heading -->
                        <div class="col-sm-6">
                        <b>Online Application and Waiver Form - Payment</b><br>
                        <h2>Online Payment</h2>
                        </div>

			<div class="col-sm-6">
			<br><h2>Payment Form</h2>
			</div>

			<div class="row top-buffer">
				<div class="col-sm-3"><b>Reservation Rate:</b></div>
				<div class="col-sm-3">$ {$rate|number_format:2:".":","}</div>

				<div class="col-sm-3"><input type="text" name="fname" placeholder="First Name" required class="form-control"></div>
                                <div class="col-sm-3"><input type="text" name="lname" placeholder="Last Name" required class="form-control"></div>

			</div>
			
                        <div class="row top-buffer">
				<div class="col-sm-3"><b>Total Transfers: (All Guests)</b></div>
				<div class="col-sm-3">$ {$line|number_format:2:".":","}</div>

                                <div class="col-sm-6"><input type="text" name="address" placeholder="Address" required class="form-control"></div>

			</div>

                        <div class="row top-buffer">
				<div class="col-sm-3"><b>Payments:</b></div>
				<div class="col-sm-3">$ {$payments|number_format:2:".":","}</div>

                                <div class="col-sm-6"><input type="text" name="city" placeholder="City" required class="form-control"></div>

			</div>

                        <div class="row top-buffer">
				<div class="col-sm-3"><b>Amount Due:</b></div>
				<div class="col-sm-3">$ {$amount_due|number_format:2:".":","}</div>

                                <div class="col-sm-6"><input type="text" name="state_province" placeholder="State or Province" required class="form-control"></div>

			</div>


			<div class="row top-buffer">
				<div class="col-sm-6">&nbsp;</div>

				<div class="col-sm-6"><input type="text" name="zip" placeholder="Postal Code" required class="form-control"></div>
			</div>

                        <div class="row top-buffer">
                                <div class="col-sm-6">&nbsp;</div>

                                <div class="col-sm-6"><input type="text" name="email" placeholder="Email" required class="form-control"></div>
                        </div>

			<div class="row top-buffer">
				<div class="col-sm-6">&nbsp;</div>
				<div class="col-sm-2"><h4>Payment Type:</h4></div>
                                <div class="col-sm-1"><input type="radio" name="cc_type" value="visa" required class="form-control"></div>
				<div class="col-sm-1"><i class="fa fa-cc-visa fa-4x" aria-hidden="true"></i></div>
                                <div class="col-sm-1"><input type="radio" name="cc_type" value="mastercard" required class="form-control"></div>
                                <div class="col-sm-1"><i class="fa fa-cc-mastercard fa-4x" aria-hidden="true"></i></div>
				</div>
			</div>

                        <div class="row top-buffer">
                                <div class="col-sm-6">&nbsp;</div>
                                <div class="col-sm-6">
					<input type="text" name="cc_num" id="cc_num" required class="form-control" placeholder="Credit Card Number" 
					onkeypress="return isNumberKey(event)">
				</div>
			</div>

                        <div class="row top-buffer">
                                <div class="col-sm-6">&nbsp;</div>
                                <div class="col-sm-6">
                                        <input type="text" name="cvv" id="cvv" required class="form-control" placeholder="3 Digit Security Code on Back" 
                                        onkeypress="return isNumberKey(event)">
                                </div>
			</div>

                        <div class="row top-buffer">
                                <div class="col-sm-6">&nbsp;</div>
                                <div class="col-sm-3">
					<select name="exp_month" class="form-control" required>
					<option value="">Expiration Month</option>
					<option value="01">January</option>
					<option value="02">Feburary</option>
					<option value="03">March</option>
					<option value="04">April</option>
					<option value="05">May</option>
					<option value="06">June</option>
					<option value="07">July</option>
					<option value="08">August</option>
					<option value="09">September</option>
					<option value="10">October</option>
					<option value="11">November</option>
					<option value="12">December</option>
					</select>
				</div>
                                <div class="col-sm-3">
					<select name="exp_year" class="form-control" required>
					<option value="">Expiration Year</option>
					{$exp_year}
					</select>
				</div>
			</div>

                        <div class="row top-buffer">
                                <div class="col-sm-6">&nbsp;</div>
                                <div class="col-sm-3"><h4>Payment Amount: $</h4></div>
				<div class="col-sm-3"><input type="text" name="amount" required value="{$amount_due}" class="form-control"
				onkeypress="return isNumberKey(event)"></div>
			</div>

                        <div class="row top-buffer">
                                <div class="col-sm-6">&nbsp;</div>
				{if $amount_due > 1}
	                                <div class="col-sm-6"><input type="submit" value="Preview Payment" class="btn btn-success btn-lg"></div>
				{else}
                                        <div class="col-sm-6"><input type="button" value="No Payment Due" class="btn btn-warning btn-lg" disabled onclick="return false;"></div>
				{/if}
			</div>

                        <div class="row top-buffer">
                                <div class="col-sm-6">&nbsp;</div>
                                <div class="col-sm-6">&nbsp;</div>
			</div>

			</form>
		</div>
	</div>
</div>
</td></tr></table>

{literal}
<script>
function isNumberKey(evt)
{
   var charCode = (evt.which) ? evt.which : evt.keyCode;
   if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
      return false;
   return true;
}

</script>
{/literal}
