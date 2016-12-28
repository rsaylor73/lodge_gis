<style>
.top-buffer { margin-top:10px; margin-left:10px; margin-right:10px; }
</style>

<table width="990" border="0" align="center" cellpadding="15" cellspacing="0">
  <tr>
    <td bgcolor="#FFFFFF"><p>


<div class="step-content">
        <div data-step="1" class="step-pane active">
                <div class="form-group">
                        <form action="/update_requests" method="post">

                        <!-- heading -->
			<div class="row top-buffer">
	                        <div class="col-sm-12">
        		                <b>Online Application and Waiver Form - Special Requests (Step {$step} of {$max})</b><br>
		                        <h2>Dietary Restrictions:</h2>
	                        </div>
			</div>

			<div class="row top-buffer">
				<div class="col-sm-12">
					<i class="fa fa-asterisk" style="color:red" aria-hidden="true"></i>&nbsp;<input type="checkbox" name="agree" id="agree" onchange="idoagree()" {$agree} {$readonly} required>&nbsp;&nbsp;If you have a severe food allergy or extremely strict dietary regimens such as 'vegetarian', please list it below. I understand and agree that due to unavailability of certain foods, special dietary restrictions or food allergies may not be able to be complied with. These may also incur additional charges. This area is NOT for requests such as 'carbonated water', brand name products or other non health threatening issues. If you would like any special items, please arrive at the destination early and purchase them, if available, at a local shop. 
				</div>
			</div>

			<div class="row top-buffer">
				<div class="col-sm-12">
					<textarea name="request" id="request" class="form-control" disabled placeholder="Click the checkbox above to agree and unlock...">{$request}</textarea>
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
			
{literal}
<script>
function idoagree() {
	var x = document.getElementById("agree").value;
	if (x == "on") {
		document.getElementById("request").disabled = false;
		document.getElementById('agree').readonly = true;
		document.getElementsByName('request')[0].placeholder='You may now enter your dietary restrictions';
	}
}
</script>
{/literal}

