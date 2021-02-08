Class rcc.AoC20
{

Parameter CODEWIN = "C:\GitHub\aoc\py\";

Parameter CODELNX = "/opt/irisapp/py/";

/// Description
Parameter PY = "lib/py";

/// Parameter PY = "C:\Users\cemper\AppData\Local\Microsoft\WindowsApps\";
ClassMethod Run()
{
	write #!,"select day as described on https://adventofcode.com/"
			,!,"day 0 to exit",!
	set day=0
	for {
		write !?5,"day (1..25) ["_$i(day)_"]:" read d,! 
		if d'="" quit:'d  set day=d
		if (day<1)||(day>25) write "    Ooops",! continue
		set sc=..pipe(day)
		quit:'sc
		if day=25 set day=0
	}
	quit
}

ClassMethod pipe(day = "")
{
	quit:'day 0
	set day=$e(100+day,2,3)
 	set dev="|CPIPE|1"
 	set $zt="close"
 	set empty=0
	set path=##class(%File).NormalizeDirectory(..#PY, $System.Util.InstallDirectory())
 	if $zversion(1)=3 {
 		set cmd="cd "_path_ " ; python3 d"_day_".py" 
	 	}
	else  {
 		set cmd="cd "_path_ " &&  "_"python3 d"_day_".py" 
		}
   	write !,"+++++ starting : day"_day_" +++++++++",! 
	open dev:cmd:0 
 	if '$t write "pipe failed",! quit 0 
 	set nl=0
 	while empty<36 {
    	use dev read line:5
    	set empty=$s($l(line):0,1:$i(empty))
    	use 0 if $l(line) write:nl ! write line,! set nl=0 
    		else  write "." set nl=1 
    } 
    if empty ZTRAP "TIMEOUT"
close ;
	set $zt="" use 0 
 	close dev 
 	if $ze'["<ENDOFFILE" write $ze,! 
  	write !,"+++++++++ done : day"_day_" +++++++++",!
	quit 1
}

}
