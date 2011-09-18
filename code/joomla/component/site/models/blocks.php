<?php

class ComEnregaModelBlocks extends KModelTable {

	public function __construct(KConfig $config) {
		parent::__construct($config);
	}
    protected function _buildQueryJoins(KDatabaseQuery $query)
    {
		$query->join('RIGHT', 'enrega_blockexpenses AS bx', 'bx.blockuniqueid = tbl.blockcode');
    }
    
    protected function _buildQueryColumns(KDatabaseQuery $query)
    {
		$query->select(array('tbl.*, bx.*, tbl.blockname_en AS placename,
		(bx.labourexpenditures + bx.materialexpenditures) AS totalexpenditure,
		(100 * bx.labourexpenditures / (bx.labourexpenditures + bx.materialexpenditures)) AS labourpercent,
		(100 * bx.materialexpenditures / (bx.labourexpenditures + bx.materialexpenditures)) AS materialpercent,
		((bx.labourexpenditures + bx.materialexpenditures) / bx.noofworks) AS averageperwork
		'));
    }

    protected function _buildQueryWhere(KDatabaseQuery $query)
    {
		$query->where('bx.year', '=', KRequest::get('session.year', 'int', date('Y')));
		
		if ($this->_state->search) {
			$query->where('tbl.blockname_en', 'LIKE', '%'.$this->_state->search.'%');
		}
		
		if (KRequest::get('get.id', 'int')) {
			$query->where('tbl.districtuniqueid','=',KRequest::get('get.id', 'int'));
		}

    }
    
    protected function _buildQueryLimit(KDatabaseQuery $query)
    {
		$query->limit(100, 'default');
    }
}
