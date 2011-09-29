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
		$op = self::rupee() . ' ';
		$op .= money_format('%!i', $number);
		
		// Cheap, since it does not seem to work for removing decimals from money_format()
		$pcs = explode('.', $op);
		array_pop($pcs);
		$op = implode('.', $pcs);
		
		return $op;
    }
    
    public function humancurrency($config = array()) {
		$number = round($config['number']);
		$op = self::rupee() . ' ';
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
    
    public function rupee ($config = array()) {
		return 'Rs.';
	}
    
    public function percent ($config = array()) {
		return round($config['number'], 1);
	}
	
	public function name($config = array()) {
		
		$row = $config['name'];
		$lang = KRequest::get('get.lang', 'cmd', 'en');
		$view = substr(KRequest::get('get.view', 'cmd'), 0, -1);
		$fnameen = ucfirst($view) . 'Name_En';
		$fnamemr = ucfirst($view) . 'Name_Mr';

		if ($row->{$fnamemr} && $lang == 'mr')
		return $row->{$fnamemr};
		else
		return ucfirst(strtolower($row->{$fnameen}));
	}
    
	public function number ($config = array()) {
		$tmp = money_format('%!i', $config['number']);
		$pcs = explode('.', $tmp);
		return $pcs[0];
		
		$pcs = @explode('.', $number);
		if (strlen($pcs[0]) <= 3) {
			$left = $pcs[0];
		} else {
			$lpcs = str_split(substr($pcs[0], 0, -3), 2);
			$lpcs[] = substr($pcs[0], -3);
			$left = implode(',', $lpcs);
		}
		
		if (count($pcs) > 1)
			return implode('.', array($left, $pcs[1]));
		else
			return $left;
	}
}
