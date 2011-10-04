<!--<div class="componentheading"><?= @text('Details of Work')?></div>-->
<?php
// Declare vars needed for form
$search_state = KRequest::get('get.search_state', 'string') ? KRequest::get('get.search_state') : @text('State');
$search_district = KRequest::get('get.search_district', 'string') ? KRequest::get('get.search_district') : @text('District');
$search_block = KRequest::get('get.search_block', 'string') ? KRequest::get('get.search_block') : @text('Block');
$search_panchayat = KRequest::get('get.search_panchayat', 'string') ? KRequest::get('get.search_panchayat') : @text('Panchayat');

$showyear = KRequest::get('session.year', 'string');
$thisyear = (int) KRequest::get('session.year', 'int');

$lastyear 		= $thisyear -1;
$show_lastyear	= $lastyear . '-' . ($lastyear+1);

$nextyear 		= $thisyear + 1;
if ($nextyear > date('Y')) {
	$nextyear = $thisyear;
}
$show_nextyear	= $nextyear . '-' . ($nextyear+1);

?>
<style src="media://com_enrega/css/enrega.css" /> 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js" />
<script src="http://cdn.webrupee.com/js" />
<script src="media://com_enrega/js/enrega.js" />

<div id="tools" class="table-table">

	<div class="table-row">
	<form action="<?= @route() ?>" method="get" class="-koowa-grid">
		<div class="table-cell"><?= @text('Common Settings'); ?></div>
		<div class="table-cell"> 
			<select onchange="this.form.submit()" name="lang" class="inputbox">
				<option value="">Language / भाषा </option>
				<option value="en">English</option>
				<option value="mr">मराठी</option>
			</select> 
		</div>
		<div class="table-cell">
		</div>
		<div class="table-cell">
			<input type="checkbox" onchange="toggleCurrency()" checked="true" /> <?=@text('Currency Toggle');?>
		</div>
		<div class="table-cell">
			<input name="id" type="hidden" value="<?= KRequest::get('get.id', 'int'); ?>" />
			<input name="Itemid" type="hidden" value="<?= KRequest::get('get.Itemid', 'int'); ?>" />
		</div>
	</form>
	</div>


	<div class="table-row">
		<div class="table-cell"><?= @text('Quick Search'); ?></div>
		<div class="table-cell"><?= @helper('layout.quicksearch', array('view'=>'states')); ?></div>
		<div class="table-cell"><?= @helper('layout.quicksearch', array('view'=>'districts')); ?></div>
		<div class="table-cell"><?= @helper('layout.quicksearch', array('view'=>'blocks')); ?></div>
		<div class="table-cell"><?= @helper('layout.quicksearch', array('view'=>'panchayats')); ?></div>
	</div>
</div>

<table width="100%">
	<tr>
		<td style="text-align:left" width="30%"><?= @helper('layout.breadcrumb'); ?></td>
		<td style="text-align:center" width="40%">
		<h2 class="year">
			<a href="<?=@route('&year='.$show_lastyear)?>"><</a>
			<span class="currentyear"><?=$showyear?></span>
			<a href="<?=@route('&year='.$show_nextyear)?>">></a>
		</h2>
		</td>
		<td style="text-align:right" width="30%"><a onclick="jQuery('#tools').toggle(); return false;" href="#"><?= @text('TOGGLE CONFIG'); ?></a></td>
	</tr>
</table>
<hr />
