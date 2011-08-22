<?php
defined('KOOWA') or die ('Phut!');
setlocale(LC_MONETARY, 'en_US');
?>

<a href="index.php?option=com_enrega&view=districts">Back to Districts</a>
<form action="<?= @route() ?>" method="get" class="-koowa-grid">
<table width="100%">
<thead>
    <tr>
		<td colspan="5"><?=@helper('grid.search');?></td>
		<td colspan="2" align="left">
			<a href="index.php?option=com_enrega&view=districts&format=csv">Export</a>
		</td>
    </tr>
    <tr>
        <th valign="top">
            <?= @helper('grid.sort', array('column' => 'DistrictName_En', 'title'=> 'Name')); ?>
        </th>
        <th valign="top">
            <?= @helper('grid.sort', array('column' => 'NoOfWorks', 'title' => 'Works')); ?>  
        </th>
        <th valign="top">
            <?= @helper('grid.sort', array('column' => 'LabourExpenditures', 'title' => 'Labour Expenditure')); ?>  
        </th>
        <th valign="top">
            <?= @text('Labour %'); ?>  
        </th>
        <th valign="top">
            <?= @helper('grid.sort', array('column' => 'MaterialExpenditures', 'title' => 'Material Expenditure')); ?>  
        </th>
        <th valign="top">
            <?= @text('Material %'); ?>  
        </th>
        <th valign="top">
            <?= @text('Total Expenditure'); ?>  
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
foreach ($blocks as $block) : 
$total = $block->LabourExpenditures + $block->MaterialExpenditures;
$material_percent = round((100 * $block->MaterialExpenditures/$total), 2);
$labour_percent = 100 - $material_percent;

?>
    <tr>
        <td align="left">
                <a href="<?= @route('view=blocks&id='.$block->id); ?>">
                    <?=$block->DistrictName_En?>
                </a>
        </td>
        <td align="left">
			<?=$block->NoOfWorks?>
        </td>
        <td align="left">
			<?= number_format($block->LabourExpenditures) ?>
        </td>
        <td align="left">
			<?= $labour_percent ?>
        </td>
        <td align="left">
			<?= number_format($block->MaterialExpenditures) ?>
        </td>
        <td align="left">
			<?= $material_percent ?>
        </td>
        <td align="left">
			<?= number_format($total) ?>
        </td>


    </tr>
<? endforeach; ?>

<? if (!count($blocks)) : ?>
    <tr>
        <td colspan="20" align="center">
            <?= @text('No Items Found'); ?>
        </td>
    </tr>
<? endif; ?>    
</tbody>    
</table>
</form>
