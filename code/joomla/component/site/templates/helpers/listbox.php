<?php
class ComEnregaTemplateHelperListbox extends ComDefaultTemplateHelperListbox
{
	public function languages($config = array()) {
		$table = KFactory::get('admin::com.default.database.table.languages');
		$query = $table->getDatabase()->getQuery();
		$langs = $table->select($query);
		
		print_r($langs);die;
	}
}
