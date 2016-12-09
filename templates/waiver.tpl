<table width="990" border="0" align="center" cellpadding="15" cellspacing="0">
  <tr>
    <td bgcolor="#FFFFFF"><p>


<div class="step-content">
        <div data-step="1" class="step-pane active">
                <div class="form-group">
                        <form action="/update_waiver" method="post">

                        <!-- heading -->
                        <div class="col-sm-12">
                        <b>Online Application and Waiver Form - Waiver (Step {$step} of {$max})</b><br>
                        <h3>Guest who fail to complete this form prior to departure *WILL BE* denied lodging.</h3>
                        </div>

			<style>
			.nav {
			    max-height:300px;
			    overflow-y:auto;  
			}
			</style>

			<div class="col-sm-1">&nbsp;&nbsp;</div>

			<div class="col-sm-10 nav">
			<div class="well">

			{include file="_WAIVER.html"}

			</div>
			</div>

<div class="col-sm-12">
&nbsp;&nbsp;<br><br>
</div>

<div class="col-sm-1">&nbsp;&nbsp;</div>
<div class="col-sm-10">

{if $readonly eq "readonly"}
You have completed the waiver.<br>
<input type="button" value="Download Waiver" onclick="window.open('/download_waiver');return false;" class="btn btn-success"><br><br>
{else}
<input type="checkbox" name="agree" value="checked" required> I affirm that I am the person named below on this page and that I am an adult with full legal authority to enter into this Release of Liability and Assumption of Risk agreement by myself. I agree that I have viewed and have had the opportunity to read all the terms and conditions as stated in the agreement and that I understand and accept all such terms and conditions. I agree that my checking the box presented and saving this form page will constitute my electronic signature binding me to this contract.
<br><br>
<div class="well">
<table border=0 width="600">
<tr><td align="right"><b>First Name:&nbsp;&nbsp;</b></td><td>{$first}</td></tr>
<tr><td align="right"><b>Middle Name:&nbsp;&nbsp;</b></td><td>{$middle}</td></tr>
<tr><td align="right"><b>Last Name:&nbsp;&nbsp;</b></td><td>{$last}</td></tr>
<tr><td align="right"><b>Email:&nbsp;&nbsp;</b></td><td>{$email}</td></tr>
<tr><td align="right"><b>Passport Number:&nbsp;&nbsp;</b></td><td>{$passport_number}</td></tr>
<tr><td align="right"><b>Citizenship:&nbsp;&nbsp;</b></td><td>{$country}</td></tr>
<tr><td align="right"><b>IP Address:&nbsp;&nbsp;</b></td><td>{$ip_address}</td></tr>
<tr><td align="right"><b>Date/Time:&nbsp;&nbsp;</b></td><td>{$date} EST</td></tr>
</table>
<input type="submit" value="Save" class="btn btn-success">
{/if}
</form>
</div>
</div>

<br><br><br>


<!-- end -->
		</div>
	</div>
</div>

</td>
  </tr>
</table>

