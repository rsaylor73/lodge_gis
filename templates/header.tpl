<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>GIS</title>
<style type="text/css">
body,td,th {
        font-family: Arial, Helvetica, sans-serif;
        font-size: 12px;
}
body {
        margin-top: 0px;
        margin-bottom: 0px;
        background-image: url('/images/bck-content-fill.jpg');
}
a {
        font-size: 13px;
        color: #C00;
}
a:link {
        text-decoration: none;
}
a:visited {
        text-decoration: none;
        color: #C00;
}
a:hover {
        text-decoration: underline;
        color: #C00;
}
a:active {
        text-decoration: none;
        color: #C00;
}

</style>

        <link rel="stylesheet" href="/jquery-ui-1.10.3/themes/base/jquery.ui.all.css">
        <script src="/jquery-ui-1.10.3/jquery-1.9.1.js"></script>
        <script src="/jquery-ui-1.10.3/ui/jquery.ui.core.js"></script>
        <script src="/jquery-ui-1.10.3/ui/jquery.ui.widget.js"></script>
        <script src="/jquery-ui-1.10.3/ui/jquery.ui.datepicker.js"></script>
        <link rel="stylesheet" href="/jquery-ui-1.10.3/demos/demos.css">


<link href="/css/aggr2.css" rel="stylesheet" type="text/css">

<!-- CDN - Bootstrap and font-awsome -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<!-- jquery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script> 

<link rel="stylesheet" type="text/css" href="/jquery.datetimepicker.css"/ >

<script>
$(function() {
	$( "#dob" ).datepicker({ 
		dateFormat: "mm/dd/yy",
		changeMonth: true,
		changeYear: true,
		yearRange: "-100:+0"
	});

        $( "#passport_exp" ).datepicker({ 
                dateFormat: "mm/dd/yy",
                changeMonth: true,
                changeYear: true,
		minDate: +180,
                yearRange: "-0:+30"
        });

        $( "#date_issued" ).datepicker({ 
                dateFormat: "mm/dd/yy",
                changeMonth: true,
                changeYear: true,
                minDate: +0,
                yearRange: "-0:+30"
        });
});
</script>

</head>

<body link="#CC0000" vlink="#CC0000" alink="#CC0000">


<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td background="/images/bck-header.jpg">

        <table width="990" height="125" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="30%" align="center" valign="bottom"><img src="/images/logo-AF.png" alt="Aggressor Fleet" title="Aggressor Fleet" width="115" height="111" vspace="3" align="left" /></td>
                <td width="70%" align="right" valign="bottom"><img src="/images/hdr-tt-GIS.png" width="535" height="74" alt="Guest Information System" title="Guest Information System" /></td>
              </tr>
        </table>


  </td>
  </tr>
  <tr background="/images/bck-nav.gif">
    <td height="36" align="right" background="/images/bck-nav.gif"><table width="520" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="150"><strong>{$travel}</strong></td>
          <td width="150" align="center"><strong>{$kbyg}</strong></td>
          <td width="20%" align="center">&nbsp;</td>
        </tr>
    </table></td>
  </tr>

  <tr background="/images/bck-content.jpg">
    <td background="/images/bck-content.jpg">

    {if $name ne ""}
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15%" align="center"><strong>Name: </strong>{$name}</td>
        <td width="15%" align="center"><strong>Confirmation # </strong>{$reservationID}</td>
        <td width="35%" align="center"><strong>Lodge</strong>: {$lodge}</td>
        <td width="20%" align="center"><strong>Check-In: </strong>{$start_date}</td>
        <td width="15%" height="50" align="center"><strong># Nights: </strong>{$nights}</td>
      </tr>
    </table>
    {/if}
      <br />
      <table border="0" cellpadding="0" cellspacing="0" width="988">
        <tr>
          <td colspan="3"><img name="Formstable1" src="/images/Forms-table-1.png" width="988" height="31" border="0" id="Formstable1" alt="" /></td>
        </tr>
        <tr>
          <td><img name="Formstable2" src="/images/Forms-table-2.gif" width="3" height="76" border="0" id="Formstable2" alt="" /></td>
          <td><table width="980" border="0" align="center" cellpadding="3" cellspacing="0">
            <tr>
		{if $name eq ""} <font color="blue"><center><h2>Your GIS link is inactive or you have logged out.</h2></center></font> {/if}
		{$buttons}
            </tr>
          </table>
         </td>
          <td><img name="Formstable4" src="/images/Forms-table-4.gif" width="3" height="76" border="0" id="Formstable4" alt="" /></td>
        </tr>

        <tr>
          <td colspan="3"><img name="Formstable5" src="/images/Forms-table-5.png" width="988" height="18" border="0" id="Formstable5" alt="" /></td>
        </tr>
        <tr>
          <td colspan="3" valign="top">

	<div class="row">
		<div class="col-sm-4">
			<img src="/images/icons-complete.png" width="244" height="26" class="pull-left">
		</div>
		<div class="col-sm-6">
			{if $resellerID eq "19"}
			<a href="/payment"><img src="/images/visa-mastercard-logo.jpg" height="31" border="0" class="pull-right">&nbsp;
			<img src="/images/bt-payment.png" border="0" class="pull-right"></a>
			{/if}
		</div>
		<div class="col-sm-2">
			<a href="/logout"><img src="/images/bt-logout.png" border="0" class="pull-right"></a>
		</div>
	</div>
	</td>
        </tr>
    </table>



</td>
  </tr>
</table>
