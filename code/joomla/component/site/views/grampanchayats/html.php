<?php
class ComEnregaViewGrampanchayatsHtml extends ComDefaultViewHtml
{
	public function display()
	{
		
		$grampanchayats = $this->getModel()->getList();
		$total = $this->getModel()->getTotal();
		$this->assign('grampanchayats', $grampanchayats);
		
		return parent::display();

	}
}
