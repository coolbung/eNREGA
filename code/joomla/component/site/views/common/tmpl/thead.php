<div class="table-table">
	<div class="table-row bottomborder">
		<div class="table-cell cell1" valign="top"></div>
		<div class="table-cell cell2" valign="top"></div>
		<div class="table-cell cell3" valign="top" style="text-align:right"></div>      
		<div class="table-cell cell4" valign="top" style="text-align:center"><?= @text('Labour Expenditure') ?></div>
		<div class="table-cell cell5" valign="top" style="text-align:center"></div>
		<div class="table-cell cell6" valign="top" style="text-align:center"><?= @text('Material Expenditure') ?></div>
		<div class="table-cell cell7" valign="top" style="text-align:center"></div>
		<div class="table-cell cell8" valign="top" style="text-align:right"></div>
		<div class="table-cell cell9" valign="top" style="text-align:right"></div>
	</div>
	<div class="table-row dark">
		<div class="table-cell" valign="top"><?= @text('Sr. #'); ?></div>
		<div class="table-cell" valign="top">
			<?= @helper('grid.sort', array('column' => 'placename', 'title'=> 'Name')); ?>
		</div>
		<div class="table-cell" valign="top" style="text-align:right">
			<?= @helper('grid.sort', array('column' => 'NoOfWorks', 'title' => 'Works')); ?>  
		</div>
		<div class="leftborder table-cell" valign="top" style="text-align:right">
			<?= @helper('grid.sort', array('column' => 'LabourExpenditures', 'title' => 'Value')); ?>  
		</div>
		<div class="table-cell" valign="top" style="text-align:right">
			<?= @helper('grid.sort', array('column' => 'labourpercent', 'title' => 'Percentage')); ?>  
		</div>
		<div class="leftborder table-cell" valign="top" style="text-align:right">
			<?= @helper('grid.sort', array('column' => 'MaterialExpenditures', 'title' => 'Value')); ?>  
		</div>
		<div class="rightborder table-cell" valign="top" style="text-align:right">
			<?= @helper('grid.sort', array('column' => 'materialpercent', 'title' => 'Percentage')); ?>  
		</div>
		<div class="table-cell" valign="top" style="text-align:right">
			<?= @helper('grid.sort', array('column' => 'totalexpenditure', 'title' => 'Total Expenditure')); ?>  
		</div>
		<div class="table-cell" valign="top" style="text-align:right">
			<?= @helper('grid.sort', array('column' => 'averageperwork', 'title' => 'Average per work')); ?>  
		</div>
	</div>
</div>
