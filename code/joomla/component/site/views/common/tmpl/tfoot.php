<div class="table-table">
	<div class="table-row dark">
		<div class="table-cell cell1" valign="top"></div>
		<div class="table-cell cell2" valign="top"><?= @text('Total'); ?></div>
		<div class="table-cell cell3" valign="top" style="text-align:right">
			<?= @helper('format.number', array('number' => $total_works)); ?>
		</div>
		<div valign="top" style="text-align:right" class="leftborder table-cell cell4">
			<?= @helper('format.humancurrency', array('number' => $total_labour)); ?>  
		</div>
		<div valign="top" style="text-align:right" class="tabl-cell cell5"></div>
		<div valign="top" style="text-align:right" class="leftborder table-cell cell6">
			<?= @helper('format.humancurrency', array('number' => $total_material)); ?>  
		</div>
		<div class="rightborder table-cell cell7" valign="top" style="text-align:right"></div>
		<div class="table-cell cell8" valign="top" style="text-align:right">
			<?= @helper('format.humancurrency', array('number' => $total)); ?>  
		</div>
		<div class="table-cell cell9" valign="top" style="text-align:right">
			<?= @helper('format.humancurrency', array('number' => ($total / $total_works))); ?>
		</div>
	</div>
</div>
