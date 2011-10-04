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

foreach ($grampanchayats as $grampanchayat) : 
$total_works += $grampanchayat->NoOfWorks;
$total_labour += $grampanchayat->LabourExpenditures;
$total_material += $grampanchayat->MaterialExpenditures;
$total += $grampanchayat->totalexpenditure;
$link = 'view=blocks&id='.$grampanchayat->districtid.'&Itemid='.KRequest::get('get.Itemid', 'int');
?>
    <div class="table-row row<?php echo $i % 2; $i++ ?>">
		<div class="table-cell cell1"><?php echo $i; ?></div>
        <div align="left" class="table-cell cell2">
			<?= @helper('format.name', array('name' => $grampanchayat)) ?>
        </div>
        <div align="right" class="table-cell cell3">
			<?= number_format($grampanchayat->NoOfWorks) ?>
        </div>
        <div align="right" class="leftborder table-cell cell4">
			<span class="currency_human"><?= @helper('format.humancurrency', array('number' => $grampanchayat->LabourExpenditures)) ?></span>
			<span class="currency_number"><?= @helper('format.currency', array('number' => $grampanchayat->LabourExpenditures)) ?></span>
        </div>
        <div align="right" class="table-cell cell5">
			<?= @helper('format.percent', array('number' => $grampanchayat->labourpercent)) ?>
        </div>
        <div align="right" class="leftborder table-cell cell6">
			<span class="currency_human"><?= @helper('format.humancurrency', array('number' => $grampanchayat->MaterialExpenditures)) ?></span>
			<span class="currency_number"><?= @helper('format.currency', array('number' => $grampanchayat->MaterialExpenditures)) ?></span>
        </div>
        <div align="right" class="rightborder table-cell cell7">
			<?= @helper('format.percent', array('number' => $grampanchayat->materialpercent)) ?>
        </div>
        <div align="right" class="table-cell cell8">
			<span class="currency_human"><?= @helper('format.humancurrency', array('number' => $grampanchayat->totalexpenditure)) ?></span>
			<span class="currency_number"><?= @helper('format.currency', array('number' => $grampanchayat->totalexpenditure)) ?></span>
        </div>
        <div align="right" class="table-cell cell9">
			<span class="currency_human"><?= @helper('format.humancurrency', array('number' => $grampanchayat->averageperwork)) ?></span>
			<span class="currency_number"><?= @helper('format.currency', array('number' => $grampanchayat->averageperwork)) ?></span>
        </div>
    </div>
<? endforeach; ?>
<? if (!count($grampanchayats)) : ?>
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
