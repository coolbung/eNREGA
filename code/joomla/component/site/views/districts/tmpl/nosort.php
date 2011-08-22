<?php
defined('KOOWA') or die ('Phut!');
echo @template('site::com.enrega.view.common.default'); 
?>

<form action="<?= @route() ?>" method="get" class="-koowa-grid">
<table width="100%">
<thead>
    <tr>
		<td colspan="5"><?=@helper('grid.search');?></td>
		<td colspan="3" align="right">
			<a href="index.php?option=com_enrega&view=districts&format=csv" class="button">Export</a>

			<a href="index.php?option=com_enrega&view=districts&format=print" class="button">Print</a>
		</td>
    </tr>
    <tr>
        <th valign="top">
            <?= @helper('grid.sort', array('column' => 'DistrictName_En', 'title'=> 'Name')); ?>
        </th>
        <th valign="top" style="text-align:right">
            <?= @helper('grid.sort', array('column' => 'NoOfWorks', 'title' => 'Works')); ?>  
        </th>
        <th valign="top" style="text-align:right">
            <?= @helper('grid.sort', array('column' => 'LabourExpenditures', 'title' => 'Labour Expenditure')); ?>  
        </th>
        <th valign="top" style="text-align:right">
            <?= @text('Labour %'); ?>  
        </th>
        <th valign="top" style="text-align:right">
            <?= @helper('grid.sort', array('column' => 'MaterialExpenditures', 'title' => 'Material Expenditure')); ?>  
        </th>
        <th valign="top" style="text-align:right">
            <?= @text('Material %'); ?>  
        </th>
        <th valign="top" style="text-align:right">
            <?= @text('Total Expenditure'); ?>  
        </th>
        <th valign="top" style="text-align:right">
            <?= @text('Avg per work'); ?>  
        </th>
    </tr>
</thead>

<tfoot>
       <tr>
            <td colspan="5">
                 <?= @helper('paginator.pagination', array('total' => $total)) ?>
            </td>
        </tr>
</tfoot>

<tbody>
<? 
$total_works = $total_labour = $total_material = $total = 0;

foreach ($districts as $district) : 
/*
$district->total = $district->LabourExpenditures + $district->MaterialExpenditures;
$material_percent = round((100 * $district->MaterialExpenditures/$district->total), 2);
$labour_percent = 100 - $material_percent;

$total_works += $district->NoOfWorks;
$total_labour += $district->LabourExpenditures;
$total_material += $district->MaterialExpenditures;
$total += $district->total;
*/
?>
    <tr>
        <td align="left">
                <a href="<?= @route('view=blocks&id='.$district->districtid); ?>">
                    <?=$district->DistrictName_En?>
                </a>
        </td>
        <td align="right">
			<?=$district->NoOfWorks?>
        </td>
        <td align="right">
			<?= @helper('currency.format', array('number' => $district->LabourExpenditures)) ?>
        </td>
        <td align="right">
			<?= $labour_percent ?>
        </td>
        <td align="right">
			<?= @helper('currency.format', array('number' => $district->MaterialExpenditures)) ?>
        </td>
        <td align="right">
			<?= $material_percent ?>
        </td>
        <td align="right">
			<?= @helper('currency.format', array('number' => $district->total)) ?>
        </td>
        <td align="right">
			<?= @helper('currency.format', array('number' => $district->total/$district->NoOfWorks)) ?>
        </td>
    </tr>
<? endforeach; ?>

<thead>
    <tr>
        <th valign="top">
        </th>
        <th valign="top" style="text-align:right">
            <?= $total_works; ?>  
        </th>
        <th valign="top" style="text-align:right">
            <?= @helper('currency.format', array('number' => $total_labour)); ?>  
        </th>
        <th valign="top" style="text-align:right">
        </th>
        <th valign="top" style="text-align:right">
            <?= @helper('currency.format', array('number' => $total_material)); ?>  
        </th>
        <th valign="top" style="text-align:right">
        </th>
        <th valign="top" style="text-align:right">
            <?= @helper('currency.format', array('number' => $total)); ?>  
        </th>
        <th valign="top" style="text-align:right">
        </th>
    </tr>
</thead>

<? if (!count($districts)) : ?>
    <tr>
        <td colspan="20" align="center">
            <?= @text('No Items Found'); ?>
        </td>
    </tr>
<? endif; ?>    
</tbody>    
</table>
</form>
