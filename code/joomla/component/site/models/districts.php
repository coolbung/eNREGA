<?php

class ComEnregaModelDistricts extends ComDefaultModelDefault {

	public function __construct(KConfig $config)
	{
		parent::__construct($config);
	}
     
    protected function _buildQueryJoins(KDatabaseQuery $query)
    {
		$query->join('LEFT', 'enrega_districtexpenses AS dx', 'dx.districtuniqueid = tbl.districtid');
    }
    
    protected function _buildQueryColumns(KDatabaseQuery $query)
    {
		$query->select(array('tbl.*, dx.*,
		(dx.labourexpenditures + dx.materialexpenditures) AS totalexpenditure,
		(100 * dx.labourexpenditures / (dx.labourexpenditures + dx.materialexpenditures)) AS labourpercent,
		(100 * dx.materialexpenditures / (dx.labourexpenditures + dx.materialexpenditures)) AS materialpercent,
		((dx.labourexpenditures + dx.materialexpenditures) / dx.noofworks) AS averageperwork
		'));
    }

    protected function _buildQueryWhere(KDatabaseQuery $query)
    {
		if ($this->_state->search) {
			$query->where('tbl.districtname_en', 'LIKE', '%'.$this->_state->search.'%');
		}
    }
    
}
