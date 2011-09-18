<?php
class ComEnregaViewDistrictsHtml extends ComDefaultViewHtml
{
	public function display()
	{
		
		$blocks = $this->getModel()->getList();
		$total = $this->getModel()->getTotal();
		$this->assign('blocks', $blocks);
		
		return parent::display();

	}
}
