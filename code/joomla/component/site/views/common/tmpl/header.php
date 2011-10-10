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

$mr_link = 'lang=mr&Itemid='.KRequest::get('get.Itemid', 'int').'&id='.KRequest::get('get.id', 'int');
$en_link = 'lang=en&Itemid='.KRequest::get('get.Itemid', 'int').'&id='.KRequest::get('get.id', 'int');

?>
<style src="media://com_enrega/css/enrega.css" /> 
<script src="http://cdn.webrupee.com/js" />
<script src="media://com_enrega/js/enrega.js" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js" />

<table id="tools" width="100%" cellspacing="1" cellpadding="1">

	<tr>
		<td width="160"><?= @helper('layout.quicksearch', array('view'=>'states')); ?></td>
		<td width="160"><?= @helper('layout.quicksearch', array('view'=>'districts')); ?></td>
		<td width="160"><?= @helper('layout.quicksearch', array('view'=>'blocks')); ?></td>
		<td width="160"><?= @helper('layout.quicksearch', array('view'=>'panchayats')); ?></td>
		<td style="text-align:right">
			<a href="<?=@route($mr_link)?>">मराठी</a>
			 | 
			<a href="<?=@route($en_link)?>">English</a>
		</td>

	</tr>
</table>

<table width="100%">
	<tr>
		<td style="text-align:left" width="30%"><?= @helper('layout.breadcrumb'); ?></td>
		<td style="text-align:right" width="40%">
		<h2 class="year">
			<a href="<?=@route('&year='.$show_lastyear)?>"><</a>
			<span class="currentyear"><?=$showyear?></span>
			<a href="<?=@route('&year='.$show_nextyear)?>">></a>
		</h2>
		</td>
	</tr>
</table>
<hr />
