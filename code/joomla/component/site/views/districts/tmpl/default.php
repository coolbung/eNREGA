<?php
defined('KOOWA') or die ('Phut!');
?>

<form action="<?= @route() ?>" method="get" class="-koowa-grid">
<?php echo @template('site::com.enrega.view.common.default'); ?>

<table width="100%">
<thead>
    <tr>
        <th valign="top"><?= @text('Sr. #'); ?></th>
        <th valign="top">
            <?= @helper('grid.sort', array('column' => 'DistrictName_En', 'title'=> 'Name')); ?>
        </th>
        <th valign="top" style="text-align:right">
            <?= @helper('grid.sort', array('column' => 'NoOfWorks', 'title' => 'Works')); ?>  
        </th>
        <th valign="top" style="text-align:right">
            <?= @helper('grid.sort', array('column' => 'LabourExpenditures', 'title' => 'Labour Exp. ₹')); ?>  
        </th>
        <th valign="top" style="text-align:right">
            <?= @helper('grid.sort', array('column' => 'labourpercent', 'title' => 'Labour %')); ?>  
        </th>
        <th valign="top" style="text-align:right">
            <?= @helper('grid.sort', array('column' => 'MaterialExpenditures', 'title' => 'Material Exp. ₹')); ?>  
        </th>
        <th valign="top" style="text-align:right">
            <?= @helper('grid.sort', array('column' => 'materialpercent', 'title' => 'Material %')); ?>  
        </th>
        <th valign="top" style="text-align:right">
            <?= @helper('grid.sort', array('column' => 'totalexpenditure', 'title' => 'Total Exp. ₹')); ?>  
        </th>
        <th valign="top" style="text-align:right">
            <?= @helper('grid.sort', array('column' => 'averageperwork', 'title' => 'Avg per work ₹')); ?>  
        </th>
    </tr>
</thead>

<tfoot>
       <tr>
            <td colspan="9">
                 <?= @helper('paginator.pagination', array('total' => $total)) ?>
            </td>
        </tr>
</tfoot>

<tbody>
<? 
$total_works = $total_labour = $total_material = $total = 0;
$i = 0; 


foreach ($districts as $district) : 
$i++;
$total_works += $district->NoOfWorks;
$total_labour += $district->LabourExpenditures;
$total_material += $district->MaterialExpenditures;
$total += $district->totalexpenditure;

?>
    <tr class="row<?php echo $i % 2; ?>">
		<td><?php echo $i; ?></td>
        <td align="left">
                <a href="<?= @route('view=blocks&id='.$district->districtid); ?>">
                    <?= @helper('format.name', array('district' => $district)) ?>
                </a>
        </td>
        <td align="right">
			<?=$district->NoOfWorks?>
        </td>
        <td align="right">
			<?= @helper('format.currency', array('number' => $district->LabourExpenditures)) ?>
        </td>
        <td align="right">
			<?= @helper('format.percent', array('number' => $district->labourpercent)) ?>
        </td>
        <td align="right">
			<?= @helper('format.currency', array('number' => $district->MaterialExpenditures)) ?>
        </td>
        <td align="right">
			<?= @helper('format.percent', array('number' => $district->materialpercent)) ?>
        </td>
        <td align="right">
			<?= @helper('format.currency', array('number' => $district->totalexpenditure)) ?>
        </td>
        <td align="right">
			<?= @helper('format.currency', array('number' => $district->averageperwork)) ?>
        </td>
    </tr>
<? endforeach; ?>

<tfoot>
    <tr>
        <th valign="top"></th>
        <th valign="top"></th>
        <th valign="top" style="text-align:right">
            <?= $total_works; ?>  
        </th>
        <th valign="top" style="text-align:right">
            <?= @helper('format.currency', array('number' => $total_labour)); ?>  
        </th>
        <th valign="top" style="text-align:right">
        </th>
        <th valign="top" style="text-align:right">
            <?= @helper('format.currency', array('number' => $total_material)); ?>  
        </th>
        <th valign="top" style="text-align:right">
        </th>
        <th valign="top" style="text-align:right">
            <?= @helper('format.currency', array('number' => $total)); ?>  
        </th>
        <th valign="top" style="text-align:right">
        </th>
    </tr>
</tfoot>

<? if (!count($districts)) : ?>
    <tr>
        <td colspan="9" align="center">
            <?= @text('No Items Found'); ?>
        </td>
    </tr>
<? endif; ?>    
</tbody>    
</table>
<input name="option" value="com_enrega" type="hidden" />
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
