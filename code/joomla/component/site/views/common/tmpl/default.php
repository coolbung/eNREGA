<div class="componentheading">Details of Work</div>
<?php

// Declare vars needed for form
$search_state = KRequest::get('get.search_state', 'string') ? KRequest::get('get.search_state') : @text('State');
$search_district = KRequest::get('get.search_district', 'string') ? KRequest::get('get.search_district') : @text('District');
$search_block = KRequest::get('get.search_block', 'string') ? KRequest::get('get.search_block') : @text('Block');
$search_panchayat = KRequest::get('get.search_panchayat', 'string') ? KRequest::get('get.search_panchayat') : @text('Panchayat');
?>

<div id="tools">
<form action="<?= @route() ?>" method="get" class="-koowa-grid">
<table width="100%">
	<tr>
		<td><?= @text('Common Settings'); ?></td>
		<td> 
		<select onchange="this.form.submit()" name="lang" class="inputbox">
			<option>Language / भाषा </option>
			<option value="en">English</option>
			<option value="mr">मराठी</option>
		</select> 
		</td>
		<td>
		<select class="inputbox" name="year">
			<option>Year / साल</option>
			<option value="2009">2009-10</option>
			<option value="2010">2010-11</option>
		</select>
		</td>
		<td></td>
	</tr>
</table>
<input name="id" type="hidden" value="<?= KRequest::get('get.id', 'int'); ?>" />
</form>

<table width="100%">
	<tr>
		<td><?= @text('Quick Search'); ?></td>
		<td><?= @helper('layout.quicksearch', array('view'=>'states')); ?></td>
		<td><?= @helper('layout.quicksearch', array('view'=>'districts')); ?></td>
		<td><?= @helper('layout.quicksearch', array('view'=>'blocks')); ?></td>
		<td><?= @helper('layout.quicksearch', array('view'=>'panchayats')); ?></td>
	</tr>
</table>
</div>
<hr />
<table width="100%">
	<tr>
		<td style="text-align:left"><?= @helper('layout.breadcrumb'); ?></td>
		<td style="text-align:right"><a onclick="$('tools').toggle(); return false;" href="#"><?= @text('TOGGLE CONFIG'); ?></a></td>
	</tr>
</table>




