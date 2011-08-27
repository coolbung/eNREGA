<?php
defined('KOOWA') or die ('Phut!');
?>

<?php echo @template('site::com.enrega.view.common.default'); ?>

<form action="<?= @route() ?>" method="get" class="-koowa-grid">
<table width="100%">
<!--
<tfoot>
       <tr>
            <td colspan="9">
                 <?= @helper('paginator.pagination', array('total' => $total)) ?>
            </td>
        </tr>
</tfoot>
-->
<tbody>
<? 
$total_works = $total_labour = $total_material = $total = 0;
$i = 0; 


foreach ($blocks as $block) : 
$i++;
$total_works += $block->NoOfWorks;
$total_labour += $block->LabourExpenditures;
$total_material += $block->MaterialExpenditures;
$total += $block->totalexpenditure;

?>
    <tr class="row<?php echo $i % 2; ?>">
		<td><?php echo $i; ?></td>
        <td align="left">
                <a href="<?= @route('view=blocks&id='.$block->districtid); ?>">
                    <?= @helper('format.name', array('district' => $block)) ?>
                </a>
        </td>
        <td align="right">
			<?= number_format($block->NoOfWorks) ?>
        </td>
        <td align="right">
			<?= @helper('format.humancurrency', array('number' => $block->LabourExpenditures)) ?>
        </td>
        <td align="right">
			<?= @helper('format.percent', array('number' => $block->labourpercent)) ?>
        </td>
        <td align="right">
			<?= @helper('format.humancurrency', array('number' => $block->MaterialExpenditures)) ?>
        </td>
        <td align="right">
			<?= @helper('format.percent', array('number' => $block->materialpercent)) ?>
        </td>
        <td align="right">
			<?= @helper('format.humancurrency', array('number' => $block->totalexpenditure)) ?>
        </td>
        <td align="right">
			<?= @helper('format.humancurrency', array('number' => $block->averageperwork)) ?>
        </td>
    </tr>
<? endforeach; ?>

<thead >
	<tr>
        <th valign="top"></th>
        <th valign="top"></th>
        <th valign="top" style="text-align:right"></th>      
        <th valign="top" style="text-align:center" colspan="2"><?= @text('Labour Expenditure') ?></th>
        <th valign="top" style="text-align:center" colspan="2"><?= @text('Material Expenditure') ?></th>
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
        <th valign="top" style="text-align:right">
            <?= @helper('grid.sort', array('column' => 'LabourExpenditures', 'title' => 'Value ₹')); ?>  
        </th>
        <th valign="top" style="text-align:right">
            <?= @helper('grid.sort', array('column' => 'labourpercent', 'title' => 'Percentage')); ?>  
        </th>
        <th valign="top" style="text-align:right">
            <?= @helper('grid.sort', array('column' => 'MaterialExpenditures', 'title' => 'Value ₹')); ?>  
        </th>
        <th valign="top" style="text-align:right">
            <?= @helper('grid.sort', array('column' => 'materialpercent', 'title' => 'Percentage')); ?>  
        </th>
        <th valign="top" style="text-align:right">
            <?= @helper('grid.sort', array('column' => 'totalexpenditure', 'title' => 'Total Exp. ₹')); ?>  
        </th>
        <th valign="top" style="text-align:right">
            <?= @helper('grid.sort', array('column' => 'averageperwork', 'title' => 'Avg per work ₹')); ?>  
        </th>
    </tr>

    <tr style="border-top:1px solid #FFF">
        <th valign="top"></th>
        <th valign="top"><?= @text('Total'); ?></th>
        <th valign="top" style="text-align:right">
            <?= number_format($total_works); ?>  
        </th>
        <th valign="top" style="text-align:right">
            <?= @helper('format.humancurrency', array('number' => $total_labour)); ?>  
        </th>
        <th valign="top" style="text-align:right"></th>
        <th valign="top" style="text-align:right">
            <?= @helper('format.humancurrency', array('number' => $total_material)); ?>  
        </th>
        <th valign="top" style="text-align:right"></th>
        <th valign="top" style="text-align:right">
            <?= @helper('format.humancurrency', array('number' => $total)); ?>  
        </th>
        <th valign="top" style="text-align:right">
			<?= @helper('format.humancurrency', array('number' => ($total / $total_works))); ?>
        </th>
    </tr>

</thead>

<tfoot>
    <tr>
        <th valign="top"></th>
        <th valign="top"><?= @text('Total'); ?></th>
        <th valign="top" style="text-align:right">
            <?= number_format($total_works); ?>  
        </th>
        <th valign="top" style="text-align:right">
            <?= @helper('format.humancurrency', array('number' => $total_labour)); ?>  
        </th>
        <th valign="top" style="text-align:right"></th>
        <th valign="top" style="text-align:right">
            <?= @helper('format.humancurrency', array('number' => $total_material)); ?>  
        </th>
        <th valign="top" style="text-align:right"></th>
        <th valign="top" style="text-align:right">
            <?= @helper('format.humancurrency', array('number' => $total)); ?>  
        </th>
        <th valign="top" style="text-align:right">
			<?= @helper('format.humancurrency', array('number' => ($total / $total_works))); ?>
        </th>
    </tr>
</tfoot>

<? if (!count($blocks)) : ?>
    <tr>
        <td colspan="9" align="center">
            <?= @text('No Items Found'); ?>
        </td>
    </tr>
<? endif; ?>    
</tbody>    
</table>

</form>

<table width="100%">
    <tr>
		<td colspan="6"></td>
		<td colspan="3" align="right">
			<a href="index.php?option=com_enrega&view=districts&format=csv" class="button">Export</a>

			<a href="index.php?option=com_enrega&view=districts&format=print" class="button">Print</a>
		</td>
    </tr>
</table>
