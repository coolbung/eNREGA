<!--<div class="componentheading"><?= @text('Details of Work')?></div>-->
<?php
// Declare vars needed for form
$search_state = KRequest::get('get.search_state', 'string') ? KRequest::get('get.search_state') : @text('State');
$search_district = KRequest::get('get.search_district', 'string') ? KRequest::get('get.search_district') : @text('District');
$search_block = KRequest::get('get.search_block', 'string') ? KRequest::get('get.search_block') : @text('Block');
$search_panchayat = KRequest::get('get.search_panchayat', 'string') ? KRequest::get('get.search_panchayat') : @text('Panchayat');
?>
<style src="media://com_enrega/css/enrega.css" /> 
<script src="media://com_enrega/js/enrega.js" />

<div id="tools" class="table-table">
	<form action="<?= @route() ?>" method="get" class="-koowa-grid">

	<div class="table-row">
		<div class="table-cell"><?= @text('Common Settings'); ?></div>
		<div class="table-cell"> 
			<select onchange="this.form.submit()" name="lang" class="inputbox">
				<option value="">Language / भाषा </option>
				<option value="en">English</option>
				<option value="mr">मराठी</option>
			</select> 
		</div>
		<div class="table-cell">
			<select class="inputbox" name="year">
				<option value="">Year / साल</option>
				<option value="2009">2009-10</option>
				<option value="2010">2010-11</option>
			</select>
		</div>
		<div class="table-cell">
			<input type="checkbox" onchange="toggleCurrency()" checked="true" /> <?=@text('Currency Toggle');?>
		</div>
		<div class="table-cell">
			<input name="id" type="hidden" value="<?= KRequest::get('get.id', 'int'); ?>" />
			<input name="Itemid" type="hidden" value="<?= KRequest::get('get.Itemid', 'int'); ?>" />
		</div>
	</div>
	</form>

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
		<td style="text-align:left"><?= @helper('layout.breadcrumb'); ?></td>
		<td style="text-align:right"><a onclick="jQuery('#tools').toggle(); return false;" href="#"><?= @text('TOGGLE CONFIG'); ?></a></td>
	</tr>
</table>
<hr />
