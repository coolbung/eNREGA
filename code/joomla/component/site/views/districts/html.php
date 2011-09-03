<?php
class ComEnregaViewDistrictsHtml extends ComDefaultViewHtml
{
	public function display()
	{
		
		$blocks = $this->getModel()->getList();
		$total = $this->getModel()->getTotal();
		echo $this->_state->search;
		$this->assign('blocks', $blocks);
		
		return parent::display();

	}
}
