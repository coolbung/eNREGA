<div class="componentheading">Details of Work</div>
<?php

// Declare vars needed for form
$search_state = KRequest::get('get.search_state', 'string') ? KRequest::get('get.search_state') : @text('State');
$search_district = KRequest::get('get.search_district', 'string') ? KRequest::get('get.search_district') : @text('District');
$search_block = KRequest::get('get.search_block', 'string') ? KRequest::get('get.search_block') : @text('Block');
$search_panchayat = KRequest::get('get.search_panchayat', 'string') ? KRequest::get('get.search_panchayat') : @text('Panchayat');
?>

<div id="tools">
<table width="100%">
	<tr>
		<td><?= @text('Common Settings'); ?></td>
		<td> 
		<select onchange="this.form.submit()" name="language" class="inputbox">
			<option>Language / भाषा </option>
			<option value="En">English</option>
			<option value="Mr">मराठी</option>
		</select> 
		</td>
		<td>
		<select class="inputbox">
			<option>State / राज्य</option>
			<option>Maharashtra</option>
		</select>
		</td>
		<td>
		<select class="inputbox">
			<option>Year / साल</option>
			<option value="2009">2009-10</option>
			<option value="2010">2010-11</option>
		</select>
		</td>
		<td></td>
	</tr>

	<tr>
		<td><?= @text('Quick Search'); ?></td>
		<td><?= @helper('layout.quicksearch', array('view'=>'states')); ?></td>
		<td><?= @helper('layout.quicksearch', array('view'=>'districts')); ?></td>
		<td><?= @helper('layout.quicksearch', array('view'=>'blocks')); ?></td>
		<td><?= @helper('layout.quicksearch', array('view'=>'panchayats')); ?></td>
	</tr>
</table>

</div>
<div style="text-align:right"><a onclick="$('tools').toggle(); return false;" href="#">Show/Hide Search & Config</a></div>
<hr />
Maharashtra > All Districts
