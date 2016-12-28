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

