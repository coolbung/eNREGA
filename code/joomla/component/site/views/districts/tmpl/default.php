<?php
defined('KOOWA') or die ('Phut!');
$id = KRequest::get('get.id', 'int');
?>
<?php echo @template('site::com.enrega.view.common.header'); ?>

<form action="<?= @route() ?>" method="get" class="-koowa-grid">
<table width="100%" class="datalist">

<tbody>
<?php
$total_works = $total_labour = $total_material = $total = 0;
$i = 0; 

foreach ($districts as $district) : 
$i++;
$total_works += $district->NoOfWorks;
$total_labour += $district->LabourExpenditures;
$total_material += $district->MaterialExpenditures;
$total += $district->totalexpenditure;
$link = 'view=blocks&id='.$district->districtid.'&Itemid='.KRequest::get('get.Itemid', 'int');
?>
    <tr class="row<?php echo $i % 2; ?>">
		<td><?php echo $i; ?></td>
        <td align="left">
                <a href="<?= @route($link); ?>">
                    <?= @helper('format.name', array('name' => $district)) ?>
                </a>
        </td>
        <td align="right">
			<?= number_format($district->NoOfWorks) ?>
        </td>
        <td align="right" class="leftborder">
			<span class="currency_human"><?= @helper('format.humancurrency', array('number' => $district->LabourExpenditures)) ?></span>
			<span class="currency_number"><?= @helper('format.currency', array('number' => $district->LabourExpenditures)) ?></span>
        </td>
        <td align="right">
			<?= @helper('format.percent', array('number' => $district->labourpercent)) ?>
        </td>
        <td align="right" class="leftborder">
			<span class="currency_human"><?= @helper('format.humancurrency', array('number' => $district->MaterialExpenditures)) ?></span>
			<span class="currency_number"><?= @helper('format.currency', array('number' => $district->MaterialExpenditures)) ?></span>
        </td>
        <td align="right" class="rightborder">
			<?= @helper('format.percent', array('number' => $district->materialpercent)) ?>
        </td>
        <td align="right">
			<span class="currency_human"><?= @helper('format.humancurrency', array('number' => $district->totalexpenditure)) ?></span>
			<span class="currency_number"><?= @helper('format.currency', array('number' => $district->totalexpenditure)) ?></span>
        </td>
        <td align="right">
			<span class="currency_human"><?= @helper('format.humancurrency', array('number' => $district->averageperwork)) ?></span>
			<span class="currency_number"><?= @helper('format.currency', array('number' => $district->averageperwork)) ?></span>
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

<? if (!count($districts)) : ?>
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
