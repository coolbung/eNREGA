<?php
defined('KOOWA') or die ('Phut!');
?>

<?php echo @template('site::com.enrega.view.common.header'); ?>

<form action="<?= @route() ?>" method="get" class="-koowa-grid">
<table width="100%" class="datalist">
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
                <a href="<?= @route('view=panchayats&id='.$block->BlockCode); ?>">
                    <?= @helper('format.name', array('name' => $block)) ?>
                </a>
        </td>
        <td align="right">
			<?= number_format($block->NoOfWorks) ?>
        </td>
        <td align="right" class="leftborder">
			<?= @helper('format.humancurrency', array('number' => $block->LabourExpenditures)) ?>
        </td>
        <td align="right">
			<?= @helper('format.percent', array('number' => $block->labourpercent)) ?>
        </td>
        <td align="right" class="leftborder">
			<?= @helper('format.humancurrency', array('number' => $block->MaterialExpenditures)) ?>
        </td>
        <td align="right" class="rightborder">
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

<?php 
$vars['total_works'] = $total_works;
$vars['total_labour'] = $total_labour;
$vars['total_material'] = $total_material;
$vars['total'] = $total;
echo @template('site::com.enrega.view.common.theadfoot', $vars);
?>

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

<?php echo @template('site::com.enrega.view.common.footer'); ?>
