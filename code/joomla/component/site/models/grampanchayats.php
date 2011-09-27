<?php

class ComEnregaModelGrampanchayats extends ComDefaultModelDefault {

	public function __construct(KConfig $config)
	{
		parent::__construct($config);
	}
     
    protected function _buildQueryJoins(KDatabaseQuery $query)
    {
		$query->join('LEFT', 'enrega_grampanchayatexpenses AS gx', 'gx.grampanchayatuniqueid = tbl.grampanchayatcode');
    }
    
    protected function _buildQueryColumns(KDatabaseQuery $query)
    {
		$query->select(array('tbl.*, gx.*, tbl.grampanchayatname_en AS placename,
		(gx.labourexpenditures + gx.materialexpenditures) AS totalexpenditure,
		(100 * gx.labourexpenditures / (gx.labourexpenditures + gx.materialexpenditures)) AS labourpercent,
		(100 * gx.materialexpenditures / (gx.labourexpenditures + gx.materialexpenditures)) AS materialpercent,
		((gx.labourexpenditures + gx.materialexpenditures) / gx.noofworks) AS averageperwork
		'));
    }

    protected function _buildQueryWhere(KDatabaseQuery $query)
    {
		$query->where('gx.year', '=', KRequest::get('session.year', 'int'));

		if ($this->_state->search) {
			$query->where('tbl.grampanchayatname_en', 'LIKE', '%'.$this->_state->search.'%');
		}
		
		if (KRequest::get('get.id', 'int')) {
			$query->where('tbl.blockuniqueid','=',KRequest::get('get.id', 'int'));
		}
    }
    
    protected function _buildQueryLimit(KDatabaseQuery $query)
    {
		$query->limit(100, 'default');
    }
    
	protected function _buildQueryOrder(KDatabaseQuery $query) 
	{
        $sort = $this->_state->sort;
        $direction  = strtoupper($this->_state->direction);

		if ( $sort) {
			$query->order($this->getTable()->mapColumns($sort), $direction);
		}
        
		if (empty($sort)){
			$query->order('placename','ASC');
        } 
	}
}
