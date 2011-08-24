<?php

class ComEnregaTemplateHelperLayout extends KTemplateHelperDate
{

    public function quicksearch($config = array())
    {
		
		$current_view = KRequest::get('get.view', 'cmd');
		$view = $config['view'] ? $config['view'] : 'district';
		$uc = ucfirst($view);
		$itemid = KRequest::get('get.Itemid', 'int');
		$inputname = 'search_'.$view;
		if (KRequest::get('get.search', 'string') && $current_view == $view) {
			$value = KRequest::get('get.search', 'string');
		} else {
			$value = ucfirst($view);
		}
		
		$html = <<<EOT
		<form action="index.php" method="get">
		<input type="hidden" name="option" value="com_enrega" />
		<input type="hidden" name="view" value="{$view}" />
		<input type="text" class="inputbox" name="search" value="{$value}" onclick="if (this.value=='{$uc}') this.value='';" />
		<input type="hidden" name="Itemid" value="{$itemid}" />
		</form>
EOT;
		
		return $html;
    }
}
