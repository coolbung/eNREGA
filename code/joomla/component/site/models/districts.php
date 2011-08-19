<?php

class ComEnregaModelDistricts extends KModelTable {

    protected function _buildQueryJoins(KDatabaseQuery $query)
    {
		$query->join('LEFT', 'enrega_districtexpenses AS districtexpenses', 'districtexpenses.districtuniqueid = tbl.districtid');
    }
    
    protected function _buildQueryColumns(KDatabaseQuery $query)
    {
		$query->select(array('tbl.*, districtexpenses.*'));
    }

    protected function _buildQueryWhere(KDatabaseQuery $query)
    {
		if ($this->_state->search) {
			$query->where('tbl.districtname_en', 'LIKE', '%'.$this->_state->search.'%');
		}
    }
}
