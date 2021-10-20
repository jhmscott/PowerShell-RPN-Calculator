$RPNStack = new-object system.collections.stack

Clear-Host

while(1){
	
	$NextNum = Read-Host 	
	
	#if user entered an operator
	if($NextNum -eq '+') {
		$RPNStack.Push([math]::Round($RPNStack.Pop() + $RPNStack.Pop(), 4))
	}
	elseif($NextNum -eq '-') {
		$Num1 = $RPNStack.Pop()
		$Num2 = $RPNStack.Pop() 
		$RPNStack.Push([math]::Round($Num2 - $Num1, 4))
	}
	elseif($NextNum -eq '*') {
		$RPNStack.Push([math]::Round($RPNStack.Pop() * $RPNStack.Pop(), 4))
	}
	elseif($NextNum -eq '/') {
		$Num1 = $RPNStack.Pop()
		$Num2 = $RPNStack.Pop() 
		$RPNStack.Push([math]::Round($Num2 / $Num1, 4))
	}
	elseif($NextNum -eq 'd'){
		$RPNStack.Pop()
	}
	else {
		$RPNStack.Push([float]$NextNum)
	}
	
	$StackArray = $RPNStack.ToArray()
	
	Clear-Host

	for($i = $RPNStack.Count - 1; $i -ge 0; $i--) {
		Write-Host $StackArray[$i]
	}
	
	Write-Host '---------'
}


