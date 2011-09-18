<?php
defined('KOOWA') or die ('Phut!');
$id = KRequest::get('get.id', 'int');
?>

<?php echo @template('site::com.enrega.view.common.header'); ?>

<form action="<?= @route() ?>" method="get" class="-koowa-grid">
<?php echo @template('site::com.enrega.view.common.thead'); ?>

<div class="datalist">
<div class="table-table">
<?php 
$total_works = $total_labour = $total_material = $total = 0;
$i = 0; 

foreach ($blocks as $block) : 
$total_works += $block->NoOfWorks;
$total_labour += $block->LabourExpenditures;
$total_material += $block->MaterialExpenditures;
$total += $block->totalexpenditure;
$link = 'view=panchayats&id='.$block->BlockCode.'&Itemid='.KRequest::get('get.Itemid', 'int');
?>
    <div class="table-row row<?php echo $i % 2; $i++ ?>">
		<div class="table-cell cell1"><?php echo $i; ?></div>
        <div align="left" class="table-cell cell2">
                <a href="<?= @route($link); ?>">
                    <?= @helper('format.name', array('name' => $block)) ?>
                </a>
        </div>
        <div align="right" class="table-cell cell3">
			<?= number_format($block->NoOfWorks) ?>
        </div>
        <div align="right" class="leftborder table-cell cell4">
			<span class="currency_human"><?= @helper('format.humancurrency', array('number' => $block->LabourExpenditures)) ?></span>
			<span class="currency_number"><?= @helper('format.currency', array('number' => $block->LabourExpenditures)) ?></span>
        </div>
        <div align="right" class="table-cell cell5">
			<?= @helper('format.percent', array('number' => $block->labourpercent)) ?>
        </div>
        <div align="right" class="leftborder table-cell cell6">
			<span class="currency_human"><?= @helper('format.humancurrency', array('number' => $block->MaterialExpenditures)) ?></span>
			<span class="currency_number"><?= @helper('format.currency', array('number' => $block->MaterialExpenditures)) ?></span>
        </div>
        <div align="right" class="rightborder table-cell cell7">
			<?= @helper('format.percent', array('number' => $block->materialpercent)) ?>
        </div>
        <div align="right" class="table-cell cell8">
			<span class="currency_human"><?= @helper('format.humancurrency', array('number' => $block->totalexpenditure)) ?></span>
			<span class="currency_number"><?= @helper('format.currency', array('number' => $block->totalexpenditure)) ?></span>
        </div>
        <div align="right" class="table-cell cell9">
			<span class="currency_human"><?= @helper('format.humancurrency', array('number' => $block->averageperwork)) ?></span>
			<span class="currency_number"><?= @helper('format.currency', array('number' => $block->averageperwork)) ?></span>
        </div>
    </div>
<? endforeach; ?>
</div>
</div>

<?php 
$vars['total_works'] = $total_works;
$vars['total_labour'] = $total_labour;
$vars['total_material'] = $total_material;
$vars['total'] = $total;
echo @template('site::com.enrega.view.common.tfoot', $vars);
?>

<? if (!count($blocks)) : ?>
    <tr>
        <td colspan="9" align="center">
            <?= @text('No Items Found'); ?>
        </div>
    </tr>
<? endif; ?>    
</tbody>    
</table>

</form>

<?php echo @template('site::com.enrega.view.common.footer'); ?>
