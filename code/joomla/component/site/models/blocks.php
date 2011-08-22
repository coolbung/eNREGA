<?php

class ComEnregaModelBlocks extends KModelTable {

	public function __construct(KConfig $config) {
		parent::__construct($config);
	}
    protected function _buildQueryJoins(KDatabaseQuery $query)
    {
		$query->join('RIGHT', 'enrega_blockexpenses AS blockexpenses', 'blockexpenses.blockuniqueid = tbl.uniqueid');
    }
    
    protected function _buildQueryColumns(KDatabaseQuery $query)
    {
		$query->select(array('tbl.*, blockexpenses.*'));
    }

    protected function _buildQueryWhere(KDatabaseQuery $query)
    {

		$query->where('tbl.uniqueid', '=', KRequest::get('get.id', 'int'));
		if ($this->_state->search) {
			$query->where('tbl.blockname_en', 'LIKE', '%'.$this->_state->search.'%');
		}
		
		parent::_buildQueryWhere($query);
    }
}
