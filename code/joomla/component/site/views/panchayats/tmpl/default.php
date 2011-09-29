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

foreach ($panchayats as $panchayat) : 
$i++;
$total_works += $panchayat->NoOfWorks;
$total_labour += $panchayat->LabourExpenditures;
$total_material += $panchayat->MaterialExpenditures;
$total += $panchayat->totalexpenditure;

?>
    <tr class="row<?php echo $i % 2; ?>">
		<td><?php echo $i; ?></td>
        <td align="left">
			<?= @helper('format.name', array('name' => $panchayat)) ?>
        </td>
        <td align="right">
			<?= number_format($panchayat->NoOfWorks) ?>
        </td>
        <td align="right" class="leftborder">
			<span class="currency_human"><?= @helper('format.humancurrency', array('number' => $panchayat->LabourExpenditures)) ?></span>
			<span class="currency_number"><?= @helper('format.currency', array('number' => $panchayat->LabourExpenditures)) ?></span>
        </td>
        <td align="right">
			<?= @helper('format.percent', array('number' => $panchayat->labourpercent)) ?>
        </td>
        <td align="right" class="leftborder">
			<span class="currency_human"><?= @helper('format.humancurrency', array('number' => $panchayat->MaterialExpenditures)) ?></span>
			<span class="currency_number"><?= @helper('format.currency', array('number' => $panchayat->MaterialExpenditures)) ?></span>
        </td>
        <td align="right" class="rightborder">
			<?= @helper('format.percent', array('number' => $panchayat->materialpercent)) ?>
        </td>
        <td align="right">
			<span class="currency_human"><?= @helper('format.humancurrency', array('number' => $panchayat->totalexpenditure)) ?></span>
			<span class="currency_number"><?= @helper('format.currency', array('number' => $panchayat->totalexpenditure)) ?></span>
        </td>
        <td align="right">
			<span class="currency_human"><?= @helper('format.humancurrency', array('number' => $panchayat->averageperwork)) ?></span>
			<span class="currency_number"><?= @helper('format.currency', array('number' => $panchayat->averageperwork)) ?></span>
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

<? if (!count($panchayats)) : ?>
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
