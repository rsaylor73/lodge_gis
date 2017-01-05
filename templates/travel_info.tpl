<style>
.top-buffer { margin-top:10px; margin-left:10px; margin-right:10px; }
</style>

<table width="990" border="0" align="center" cellpadding="15" cellspacing="0">
  <tr>
    <td bgcolor="#FFFFFF"><p>


<div class="step-content">
        <div data-step="1" class="step-pane active">
                <div class="form-group">

                        <!-- heading -->
                        <form action="/update_travel_info" method="post">
                        <div class="row top-buffer">
                                <div class="col-sm-12">
                                        <b>Online Application and Waiver Form - Travel Info (Step {$step} of {$max})</b><br>
                                </div>
                        </div>


			<!-- Arrival -->
                        <div class="row top-buffer">
                                <div class="col-sm-12">
                                        <b>ARRIVAL INFORMATION (before your trip)</b><br>
                                </div>
                        </div>


			<div class="row top-buffer">
				<div class="col-sm-3"><b>Arrival Airport</b></div>
				<div class="col-sm-3"><b>Airline</b></div>
				<div class="col-sm-2"><b>Flight #</b></div>
				<div class="col-sm-3"><b>Arrival Date & Time</b></div>
				<div class="col-sm-1">&nbsp;</div>
			</div>

			<div class="row top-buffer" id="aa1">
				<div class="col-sm-3"><input type="text" name="arrival_airport1" class="form-control"></div>
                                <div class="col-sm-3"><input type="text" name="arrival_airline1" class="form-control"></div>
                                <div class="col-sm-2"><input type="text" name="arrival_flight1" class="form-control"></div>
                                <div class="col-sm-3"><input type="text" name="arrival_date_time1" class="form-control datetimepicker"></div>
				<div class="col-sm-1"><input type="button" 
				{literal}onclick="document.getElementById('aa2').style.display='block';"{/literal} value="Add" class="btn btn-info"></div>
			</div>

                        <div class="row top-buffer" id="aa2" style="display:none">
                                <div class="col-sm-3"><input type="text" name="arrival_airport2" class="form-control"></div>
                                <div class="col-sm-3"><input type="text" name="arrival_airline2" class="form-control"></div>
                                <div class="col-sm-2"><input type="text" name="arrival_flight2" class="form-control"></div>
                                <div class="col-sm-3"><input type="text" name="arrival_date_time2" class="form-control datetimepicker"></div>
                                <div class="col-sm-1"><input type="button" 
                                {literal}onclick="document.getElementById('aa3').style.display='block';"{/literal} value="Add" class="btn btn-info"></div>
                        </div>

                        <div class="row top-buffer" id="aa3" style="display:none">
                                <div class="col-sm-3"><input type="text" name="arrival_airport3" class="form-control"></div>
                                <div class="col-sm-3"><input type="text" name="arrival_airline3" class="form-control"></div>
                                <div class="col-sm-2"><input type="text" name="arrival_flight3" class="form-control"></div>
                                <div class="col-sm-3"><input type="text" name="arrival_date_time3" class="form-control datetimepicker"></div>
                                <div class="col-sm-1"><input type="button" 
                                {literal}onclick="document.getElementById('aa4').style.display='block';"{/literal} value="Add" class="btn btn-info"></div>
                        </div>

                        <div class="row top-buffer" id="aa4" style="display:none">
                                <div class="col-sm-3"><input type="text" name="arrival_airport4" class="form-control"></div>
                                <div class="col-sm-3"><input type="text" name="arrival_airline4" class="form-control"></div>
                                <div class="col-sm-2"><input type="text" name="arrival_flight4" class="form-control"></div>
                                <div class="col-sm-3"><input type="text" name="arrival_date_time4" class="form-control datetimepicker"></div>
                                <div class="col-sm-1"><input type="button" 
                                {literal}onclick="document.getElementById('aa5').style.display='block';"{/literal} value="Add" class="btn btn-info"></div>
                        </div>

                        <div class="row top-buffer" id="aa5" style="display:none">
                                <div class="col-sm-3"><input type="text" name="arrival_airport5" class="form-control"></div>
                                <div class="col-sm-3"><input type="text" name="arrival_airline5" class="form-control"></div>
                                <div class="col-sm-2"><input type="text" name="arrival_flight5" class="form-control"></div>
                                <div class="col-sm-3"><input type="text" name="arrival_date_time5" class="form-control datetimepicker"></div>
                                <div class="col-sm-1">&nbsp;</div>
                        </div>
			<!-- Departure -->
                        <div class="row top-buffer">
                                <div class="col-sm-12">
                                        <b>DEPARTURE INFORMATION (after your trip)</b><br>
                                </div>
                        </div>


                        <div class="row top-buffer">
                                <div class="col-sm-3"><b>Departure Airport</b></div>
                                <div class="col-sm-3"><b>Airline</b></div>
                                <div class="col-sm-2"><b>Flight #</b></div>
                                <div class="col-sm-3"><b>Departure Date & Time</b></div>
                                <div class="col-sm-1">&nbsp;</div>
                        </div>

                        <div class="row top-buffer" id="dd1">
                                <div class="col-sm-3"><input type="text" name="departure_airport1" class="form-control"></div>
                                <div class="col-sm-3"><input type="text" name="departure_airline1" class="form-control"></div>
                                <div class="col-sm-2"><input type="text" name="departure_flight1" class="form-control"></div>
                                <div class="col-sm-3"><input type="text" name="departure_date_time1" class="form-control datetimepicker"></div>
                                <div class="col-sm-1"><input type="button" 
                                {literal}onclick="document.getElementById('dd2').style.display='block';"{/literal} value="Add" class="btn btn-info"></div>
                        </div>

                        <div class="row top-buffer" id="dd2" style="display:none">
                                <div class="col-sm-3"><input type="text" name="departure_airport2" class="form-control"></div>
                                <div class="col-sm-3"><input type="text" name="departure_airline2" class="form-control"></div>
                                <div class="col-sm-2"><input type="text" name="departure_flight2" class="form-control"></div>
                                <div class="col-sm-3"><input type="text" name="departure_date_time2" class="form-control datetimepicker"></div>
                                <div class="col-sm-1"><input type="button" 
                                {literal}onclick="document.getElementById('dd3').style.display='block';"{/literal} value="Add" class="btn btn-info"></div>                        
                        </div>

                        <div class="row top-buffer" id="dd3" style="display:none">
                                <div class="col-sm-3"><input type="text" name="departure_airport3" class="form-control"></div>
                                <div class="col-sm-3"><input type="text" name="departure_airline3" class="form-control"></div>
                                <div class="col-sm-2"><input type="text" name="departure_flight3" class="form-control"></div>
                                <div class="col-sm-3"><input type="text" name="departure_date_time3" class="form-control datetimepicker"></div>
                                <div class="col-sm-1"><input type="button" 
                                {literal}onclick="document.getElementById('dd4').style.display='block';"{/literal} value="Add" class="btn btn-info"></div>                        
                        </div>   

                        <div class="row top-buffer" id="dd4" style="display:none">
                                <div class="col-sm-3"><input type="text" name="departure_airport4" class="form-control"></div>
                                <div class="col-sm-3"><input type="text" name="departure_airline4" class="form-control"></div>
                                <div class="col-sm-2"><input type="text" name="departure_flight4" class="form-control"></div>
                                <div class="col-sm-3"><input type="text" name="departure_date_time4" class="form-control datetimepicker"></div>
                                <div class="col-sm-1"><input type="button" 
                                {literal}onclick="document.getElementById('dd5').style.display='block';"{/literal} value="Add" class="btn btn-info"></div>                        
                        </div>   

                        <div class="row top-buffer" id="dd5" style="display:none">
                                <div class="col-sm-3"><input type="text" name="departure_airport5" class="form-control"></div>
                                <div class="col-sm-3"><input type="text" name="departure_airline5" class="form-control"></div>
                                <div class="col-sm-2"><input type="text" name="departure_flight5" class="form-control"></div>
                                <div class="col-sm-3"><input type="text" name="departure_date_time5" class="form-control datetimepicker"></div>
                                <div class="col-sm-1">&nbsp;</div>
                        </div>   

			<!-- Hotel -->
                        <div class="row top-buffer">
                                <div class="col-sm-12">
                                        <b>Arrival Hotel</b><br>
                                </div>
                        </div>
			<div class="row top-buffer">
				<div class="col-sm-12">
					<input type="text" name="hotel_arrival" class="form-control">
				</div>
			</div>

                        <div class="row top-buffer">
                                <div class="col-sm-12">
                                        <b>Departure Hotel</b><br>
                                </div>
                        </div>  
                        <div class="row top-buffer">
                                <div class="col-sm-12">
                                        <input type="text" name="hotel_departure" class="form-control">
                                </div>
                        </div>

                        <!-- submit -->
                        <div class="row top-buffer">
                                <div class="col-sm-12">
                                        {if $readonly eq "readonly"}
                                                <h3>This form has already been submitted.</h3>
                                        {else}
						<input type="checkbox" name="done" value="checked"> The Information listed above is complete to the best of my knowledge<br>
                                                <input type="submit" value="Save" id="save" {$disabled} class="btn btn-success">
                                        {/if}
                                </div>
                        </div>
                        </form>
                </div>
        </div>
</div>
</p></td></tr></table>



{literal}
<script src="build/jquery.datetimepicker.full.js"></script>

<script>
$.datetimepicker.setLocale('en');



$('.datetimepicker').datetimepicker({
step:15

});



</script>
{/literal}
