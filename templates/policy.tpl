<table width="990" border="0" align="center" cellpadding="15" cellspacing="0">
  <tr>
    <td bgcolor="#FFFFFF"><p>


<div class="step-content">
        <div data-step="1" class="step-pane active">
                <div class="form-group">
                        <form action="/update_policy" method="post">

                        <!-- heading -->
                        <div class="col-sm-12">
                        <b>Online Application and Waiver Form - Payment & Cancellation Policy (Step {$step} of {$max})</b><br><br>
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

			{include file="_POLICY.html"}

			</div>
			</div>

<div class="col-sm-12">
&nbsp;&nbsp;<br><br>
</div>

<div class="col-sm-1">&nbsp;&nbsp;</div>
<div class="col-sm-10">

{if $readonly eq "readonly"}
You have completed the policy.<br><br>
{else}
<input type="checkbox" name="agree" value="checked" required> <b>I have read and understand the Payment and Cancellation Policies of Aggressor Fleet.</b>
<br><br>
<input type="submit" value="Save" class="btn btn-success"><br><br>
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

