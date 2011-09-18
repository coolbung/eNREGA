<?php
$view = KRequest::get('get.view', 'cmd', 'districts');
$id = KRequest::get('get.id', 'int');
$export_link = "index.php?option=com_enrega&view={$view}&format=csv&id={$id}";
$print_link = "index.php?option=com_enrega&view={$view}&format=print&id={$id}";
?>
<div class="table-table">
    <div class="table-row">
		<div class="table-cell">
			<?php
				$date = @helper('layout.lastupdate');
				echo JText::sprintf('LAST UPDATE', $date);
			?>
			 | 
			<?php
				$link = @helper('layout.getlink');
				echo JText::sprintf('SOURCE LINK', $link);
			?>
		</div>
		
		<div class="table-cell" style="text-align:right">
			<a href="<?=$export_link?>" class="button">Export</a>
			<a href="<?=$print_link?>" class="button" target="_blank">Print</a>
		</div>
    </div>
</div>
