<style>
.top-buffer { margin-top:10px; margin-left:10px; margin-right:10px; }
</style>

<table width="990" border="0" align="center" cellpadding="15" cellspacing="0">
  <tr>
    <td bgcolor="#FFFFFF"><p>


<div class="step-content">
        <div data-step="1" class="step-pane active">
                <div class="form-group">
                        <form action="/update_transfers" method="post">

                        <!-- heading -->
                        <div class="row top-buffer">
                                <div class="col-sm-12">
                                        <b>Online Application and Waiver Form - Transfers (Step {$step} of {$max})</b><br>
                                        <h2>Transfers:</h2>
                                </div>
                        </div>

			<div class="row top-buffer">
				<div class="col-sm-4"><b>Title</b></div>
				<div class="col-sm-4"><b>Description</b></div>
				<div class="col-sm-4"><b>Price</b></div>
			</div>

			{if $html ne ""}
			<div class="row top-buffer">
				<div class="col-sm-12">
					<b><font color="blue">The following transfers are loaded to your reservation:</font></b>
				</div>
			</div>
			{/if}

			{$html}

			{if $html eq ""}
			<div class="row top-buffer">
				<div class="col-sm-12">
					<b><font color="blue">You do not have any transfers listed on your reservation. Please add a 
					transfer to continue or contact an Aggressor Fleet agent if you are unsure what transfer to add.</b></font>
				</div>
			</div>
			{/if}



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

<script>


</script>
