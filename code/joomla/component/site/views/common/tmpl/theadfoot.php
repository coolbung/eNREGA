
<thead>
	<tr>
        <th valign="top"></th>
        <th valign="top"></th>
        <th valign="top" style="text-align:right"></th>      
        <th valign="top" style="text-align:center" colspan="2" class="leftborder"><?= @text('Labour Expenditure') ?></th>
        <th valign="top" style="text-align:center" colspan="2" class="bothborder"><?= @text('Material Expenditure') ?></th>
        <th valign="top" style="text-align:right"></th>
        <th valign="top" style="text-align:right"></th>
	</tr>
    <tr>
        <th valign="top"><?= @text('Sr. #'); ?></th>
        <th valign="top">
            <?= @helper('grid.sort', array('column' => 'DistrictName_En', 'title'=> 'Name')); ?>
        </th>
        <th valign="top" style="text-align:right">
            <?= @helper('grid.sort', array('column' => 'NoOfWorks', 'title' => 'Works')); ?>  
        </th>
        <th valign="top" style="text-align:right" class="leftborder">
            <?= @helper('grid.sort', array('column' => 'LabourExpenditures', 'title' => 'Value')); ?>  
        </th>
        <th valign="top" style="text-align:right">
            <?= @helper('grid.sort', array('column' => 'labourpercent', 'title' => 'Percentage')); ?>  
        </th>
        <th valign="top" style="text-align:right" class="leftborder">
            <?= @helper('grid.sort', array('column' => 'MaterialExpenditures', 'title' => 'Value')); ?>  
        </th>
        <th valign="top" style="text-align:right" class="rightborder">
            <?= @helper('grid.sort', array('column' => 'materialpercent', 'title' => 'Percentage')); ?>  
        </th>
        <th valign="top" style="text-align:right">
            <?= @helper('grid.sort', array('column' => 'totalexpenditure', 'title' => 'Total Expenditure')); ?>  
        </th>
        <th valign="top" style="text-align:right">
            <?= @helper('grid.sort', array('column' => 'averageperwork', 'title' => 'Average per work')); ?>  
        </th>
    </tr>

    <tr style="border-top:1px solid #99D6EB">
        <th valign="top"></th>
        <th valign="top"><?= @text('Total'); ?></th>
        <th valign="top" style="text-align:right">
            <?= @helper('format.number', array('number' => $total_works)); ?>  
        </th>
        <th valign="top" style="text-align:right" class="leftborder">
            <?= @helper('format.humancurrency', array('number' => $total_labour)); ?>  
        </th>
        <th valign="top" style="text-align:right"></th>
        <th valign="top" style="text-align:right" class="leftborder">
            <?= @helper('format.humancurrency', array('number' => $total_material)); ?>  
        </th>
        <th valign="top" style="text-align:right" class="rightborder"></th>
        <th valign="top" style="text-align:right">
            <?= @helper('format.humancurrency', array('number' => $total)); ?>  
        </th>
        <th valign="top" style="text-align:right">
			<?= @helper('format.humancurrency', array('number' => ($total / $total_works))); ?>
        </th>
    </tr>

</thead>

<tfoot>
    <tr class="dark">
        <th valign="top"></th>
        <th valign="top"><?= @text('Total'); ?></th>
        <th valign="top" style="text-align:right">
            <?= @helper('format.number', array('number' => $total_works)); ?>
        </th>
        <th valign="top" style="text-align:right" class="leftborder">
            <?= @helper('format.humancurrency', array('number' => $total_labour)); ?>  
        </th>
        <th valign="top" style="text-align:right"></th>
        <th valign="top" style="text-align:right" class="leftborder">
            <?= @helper('format.humancurrency', array('number' => $total_material)); ?>  
        </th>
        <th valign="top" style="text-align:right" class="rightborder"></th>
        <th valign="top" style="text-align:right">
            <?= @helper('format.humancurrency', array('number' => $total)); ?>  
        </th>
        <th valign="top" style="text-align:right">
			<?= @helper('format.humancurrency', array('number' => ($total / $total_works))); ?>
        </th>
    </tr>
</tfoot>
