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

foreach ($districts as $district) : 
$total_works += $district->NoOfWorks;
$total_labour += $district->LabourExpenditures;
$total_material += $district->MaterialExpenditures;
$total += $district->totalexpenditure;
$link = 'view=blocks&id='.$district->districtid.'&Itemid='.KRequest::get('get.Itemid', 'int');
?>
    <div class="table-row row<?php echo $i % 2; $i++ ?>">
		<div class="table-cell cell1"><?php echo $i; ?></div>
        <div align="left" class="table-cell cell2">
                <a href="<?= @route($link); ?>">
                    <?= @helper('format.name', array('name' => $district)) ?>
                </a>
        </div>
        <div align="right" class="table-cell cell3">
			<?= number_format($district->NoOfWorks) ?>
        </div>
        <div align="right" class="leftborder table-cell cell4">
			<span class="currency_human"><?= @helper('format.humancurrency', array('number' => $district->LabourExpenditures)) ?></span>
			<span class="currency_number"><?= @helper('format.currency', array('number' => $district->LabourExpenditures)) ?></span>
        </div>
        <div align="right" class="table-cell cell5">
			<?= @helper('format.percent', array('number' => $district->labourpercent)) ?>
        </div>
        <div align="right" class="leftborder table-cell cell6">
			<span class="currency_human"><?= @helper('format.humancurrency', array('number' => $district->MaterialExpenditures)) ?></span>
			<span class="currency_number"><?= @helper('format.currency', array('number' => $district->MaterialExpenditures)) ?></span>
        </div>
        <div align="right" class="rightborder table-cell cell7">
			<?= @helper('format.percent', array('number' => $district->materialpercent)) ?>
        </div>
        <div align="right" class="table-cell cell8">
			<span class="currency_human"><?= @helper('format.humancurrency', array('number' => $district->totalexpenditure)) ?></span>
			<span class="currency_number"><?= @helper('format.currency', array('number' => $district->totalexpenditure)) ?></span>
        </div>
        <div align="right" class="table-cell cell9">
			<span class="currency_human"><?= @helper('format.humancurrency', array('number' => $district->averageperwork)) ?></span>
			<span class="currency_number"><?= @helper('format.currency', array('number' => $district->averageperwork)) ?></span>
        </div>
    </div>
<? endforeach; ?>
<? if (!count($districts)) : ?>
    <div class="table-row">
        <div align="center">
            <?= @text('No Items Found'); ?>
        </div>
    </div>
<? endif; ?>    
</div>
</div>

<?php 
$vars['total_works'] = $total_works;
$vars['total_labour'] = $total_labour;
$vars['total_material'] = $total_material;
$vars['total'] = $total;
echo @template('site::com.enrega.view.common.tfoot', $vars);
?>

</form>

<?php echo @template('site::com.enrega.view.common.footer'); ?>
