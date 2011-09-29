<?php
class ComEnregaViewPanchayatsHtml extends ComDefaultViewHtml
{
	public function display()
	{
		
		$panchayats = $this->getModel()->getList();
		$total = $this->getModel()->getTotal();
		$this->assign('panchayats', $panchayats);
		
		return parent::display();

	}
}
