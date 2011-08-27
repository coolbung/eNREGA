<?php
setlocale(LC_MONETARY, 'en_IN');

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
		$number = round($config['number']);
		$op = '';
		$op = '₹ ';
		$op .= money_format('%!i', $number);
		
		// Cheap, since it does not seem to work for removing decimals from money_format()
		$pcs = explode('.', $op);
		array_pop($pcs);
		$op = implode('.', $pcs);
		
		return $op;
    }
    
    public function humancurrency($config = array()) {
		$number = round($config['number']);
		$op = '';
		$op = '₹ ';
		$crore = 10000000;
		$lac = 100000;

		if ($number > $crore) {
			$op .= round(($number / $crore), 1) . ' ' . JText::_('crore');
		} elseif ($number > $lac) {
			$op .= round(($number / $lac), 1) . ' ' . JText::_('lakh');
		} else {
			$op .= number_format($number);
		}
		
		return $op;
	}
    
    public function percent ($config = array()) {
		return round($config['number'], 1);
	}
	
	public function name($config = array()) {
	
		$row = $config['district'];
		if (KRequest::get('get.lang', 'string') == 'mr' && $row->DistrictName_Mr)
		return $row->DistrictName_Mr;
		else
		return ucfirst(strtolower($row->DistrictName_En));
	}
    


}
