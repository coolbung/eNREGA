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
			$value = JText::_(ucfirst($view));
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
    
    public function breadcrumb($config = array()) {
		$view = KRequest::get('get.view', 'cmd', 'districts');
		$id = KRequest::get('get.id', 'int');
		$db = JFactory::getDBO();
		$lang = KRequest::get('get.lang', 'cmd', 'en');
		
		$breadcrumb[] = array('text' => JText::_('All States'), 'link' => 'index.php?option=com_enrega&view=states');
		
		switch ($view) {
		
			case 'panchayats':
			default:
			$qry = '';
			break;
			
			case 'blocks':
			$qry = "SELECT d.districtname_{$lang} AS dname, d.districtid AS did, s.stateid AS sid, s.statename_{$lang} AS sname
			FROM #__enrega_districts AS d, #__enrega_states AS s, #__enrega_blocks AS b
			WHERE b.districtuniqueid = {$id} AND b.districtuniqueid = d.districtid  AND d.stateuniqueid = s.stateid";
			$db->setQuery($qry);
			$row = $db->loadObject();
			$breadcrumb[] = array('text' => $row->sname, 'link' => 'index.php?option=com_enrega&view=districts&id='.$row->sid);
			$breadcrumb[] = array('text' => $row->dname, 'link' => 'index.php?option=com_enrega&view=blocks&id='.$row->did);
			$breadcrumb[] = array('text' => JText::_('All Blocks'), 'link' => '');
			break;
			
			case 'districts':
			$qry = "SELECT s.stateid, s.statename_{$lang} AS sname
			FROM #__enrega_districts AS d, #__enrega_states AS s
			WHERE d.stateuniqueid = {$id} AND d.stateuniqueid = s.stateid";
			$db->setQuery($qry);
			$row = $db->loadObject();
			$breadcrumb[] = array('text' => $row->sname, 'link' => 'index.php?option=com_enrega&view=districts&id='.$id);
			$breadcrumb[] = array('text' => JText::_('All Districts'), 'link' => '');
			break;
			
			case 'states':
			echo $qry;
			break;
		}
		
		$html = array();
		foreach ($breadcrumb as $trail) {
			$ent_name = ucfirst(strtolower($trail['text']));
			if ($trail['link'])
			$html[] = '<a href="'.$trail['link'].'">'.$ent_name.'</a>';
			else
			$html[] = $ent_name;
		}
		
		return implode(' > ', $html);

	}
	
	public function lastupdate() {
		
		$view = KRequest::get('get.view', 'cmd', 'districts');
		$id = KRequest::get('get.id', 'int');
		$db = JFactory::getDBO();

		switch ($view) {
			
			case 'states':
			break;
			
			case 'districts':
			$qry = "SELECT x.modifiedon 
			FROM #__enrega_districtexpenses AS x, #__enrega_districts AS d
			WHERE x.districtuniqueid = d.districtid AND d.stateuniqueid = {$id}
			ORDER BY x.modifiedon DESC LIMIT 1
			";
			break;
			
			case 'blocks':
			$qry = "SELECT x.modifiedon 
			FROM #__enrega_blockexpenses AS x, #__enrega_blocks AS b
			WHERE x.blockuniqueid = b.blockcode AND b.districtuniqueid = {$id}
			ORDER BY x.modifiedon DESC LIMIT 1
			";
			break;			
		}
		
		$db->setQuery($qry);
		$date = $db->loadResult();
		
		return strftime('%e/%m/%Y', strtotime($date));

	}
	
	public function getlink() {}
}
