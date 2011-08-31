<?php
$view = KRequest::get('get.view', 'cmd', 'districts');
$id = KRequest::get('get.id', 'int');
$export_link = "index.php?option=com_enrega&view={$view}&format=csv&id={$id}";
$print_link = "index.php?option=com_enrega&view={$view}&format=print&id={$id}";
?>
<table width="100%">
    <tr>
		<td colspan="6">
			<?php
				$date = @helper('layout.lastupdate');
				echo JText::sprintf('LAST UPDATE', $date);
			?>
			 | 
			<?php
				$link = @helper('layout.getlink');
				echo JText::sprintf('SOURCE LINK', $link);
			?>
		</td>
		
		<td colspan="3" align="right">
			<a href="<?=$export_link?>" class="button">Export</a>
			<a href="<?=$print_link?>" class="button">Print</a>
		</td>
    </tr>
</table>
