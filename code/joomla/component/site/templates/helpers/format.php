<?php
setlocale(LC_MONETARY, 'en_US');

class ComEnregaTemplateHelperFormat extends KTemplateHelperDate
{
    /**
     * Returns formated date according to current local and adds time offset
     *
     * @param   int	A number to format as currency
     * @returns string  formated currency
     * @see     setlocale
     */
    public function currency($config = array())
    {
		$op = '₹ ';
		$op .= number_format($config['number']);
		
		return $op;
    }
    
    public function percent ($config = array()) {
		return round($config['number'], 1);
	}
	
	public function name($config = array()) {
	
		$row = $config['district'];
		if (KRequest::get('get.language', 'string') == 'Mr' && $row->DistrictName_Mr)
		return $row->DistrictName_Mr;
		else
		return $row->DistrictName_En;
	}
    


}
