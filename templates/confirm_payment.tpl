<style>
.top-buffer { margin-top:10px; margin-left:10px; margin-right:10px; }
</style>

<table width="990" border="0" align="center" cellpadding="15" cellspacing="0">
  <tr>
    <td bgcolor="#FFFFFF"><p>


<div class="step-content">
        <div data-step="1" class="step-pane active">
                <div class="form-group">
                        <form action="/confirm_payment" method="post">
			<input type="hidden" name="fname" value="{$fname}">
			<input type="hidden" name="lname" value="{$lname}">
			<input type="hidden" name="address" value="{$address}">
			<input type="hidden" name="city" value="{$city}">
			<input type="hidden" name="state_province" value="{$state_province}">
			<input type="hidden" name="zip" value="{$zip}">
			<input type="hidden" name="email" value="{$email}">
			<input type="hidden" name="cc_num" value="{$cc_num}">
			<input type="hidden" name="cvv" value="{$cvv}">
			<input type="hidden" name="exp_month" value="{$exp_month}">
			<input type="hidden" name="exp_year" value="{$exp_year}">
			<input type="hidden" name="amount" value="{$amount}">

                        <!-- heading -->
                        <div class="col-sm-6">
                        <b>Online Application and Waiver Form - Payment</b><br>
                        <h2>Online Payment</h2>
                        </div>

			<div class="col-sm-6">
			<br><h2>Confirm Payment</h2>
			</div>

			<div class="row top-buffer">
				<div class="col-sm-3"><b>Reservation Rate:</b></div>
				<div class="col-sm-3">$ {$rate|number_format:2:".":","}</div>

				<div class="col-sm-6"><h4>{$fname} {$lname}</h4></div>

			</div>
			
                        <div class="row top-buffer">
				<div class="col-sm-3"><b>Total Transfers: (All Guests)</b></div>
				<div class="col-sm-3">$ {$line|number_format:2:".":","}</div>

                                <div class="col-sm-6"><h4>{$address}</h4></div>

			</div>

                        <div class="row top-buffer">
				<div class="col-sm-3"><b>Payments:</b></div>
				<div class="col-sm-3">$ {$payments|number_format:2:".":","}</div>

                                <div class="col-sm-6"><h4>{$city}</h4></div>

			</div>

                        <div class="row top-buffer">
				<div class="col-sm-3"><b>Amount Due:</b></div>
				<div class="col-sm-3">$ {$amount_due|number_format:2:".":","}</div>

                                <div class="col-sm-6"><h4>{$state_province}</h4></div>

			</div>


			<div class="row top-buffer">
				<div class="col-sm-6">&nbsp;</div>

				<div class="col-sm-6"><h4>{$zip}</h4></div>
			</div>

                        <div class="row top-buffer">
                                <div class="col-sm-6">&nbsp;</div>

                                <div class="col-sm-6"><h4>{$email}</h4></div>
                        </div>

			<div class="row top-buffer">
				<div class="col-sm-6">&nbsp;</div>
				<div class="col-sm-3"><h4>Credit Card:</h4></div>
				<div class="col-sm-3"><h4>{$cc_mask}</h4></div>
				</div>
			</div>

                        <div class="row top-buffer">
                                <div class="col-sm-6">&nbsp;</div>
                                <div class="col-sm-3"><h4>Expiration Date:</h4></div>
				<div class="col-sm-3"><h4>
					{if $exp_month eq "01"}
						January
					{/if}
                                        {if $exp_month eq "02"}
						Feburary
					{/if}
                                        {if $exp_month eq "03"}
						March
					{/if}
                                        {if $exp_month eq "04"}
						April
					{/if}
                                        {if $exp_month eq "05"}
						May
					{/if}
                                        {if $exp_month eq "06"}
						June
					{/if}
                                        {if $exp_month eq "07"}
						July
					{/if}
                                        {if $exp_month eq "08"}
						August
					{/if}
                                        {if $exp_month eq "09"}
						September
					{/if}
                                        {if $exp_month eq "10"}
						October
					{/if}
                                        {if $exp_month eq "11"}
						November
					{/if}
                                        {if $exp_month eq "12"}
						December
					{/if}
					&nbsp;/&nbsp;
					{$exp_year}
					</h4>
				</div>
			</div>

                        <div class="row top-buffer">
                                <div class="col-sm-6">&nbsp;</div>
                                <div class="col-sm-3"><h4>Payment Amount:</h4></div>
				<div class="col-sm-3"><h4>$ {$amount}</h4></div>
			</div>

                        <div class="row top-buffer">
                                <div class="col-sm-6">&nbsp;</div>
				{if $amount_due > 1}
	                                <div class="col-sm-6"><font color=blue><h4>Your payment is not complete until you press <b>Submit Payment</b> below.</h4></font><br>
					<input type="submit" value="Submit Payment" class="btn btn-success btn-lg"></div>
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
