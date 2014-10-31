:let g:now = localtime()
:let yes = (60*60*24)
:let a = (now/(60*60*24))

:for e in range(0,30)
	:let lastday = now+(yes*e)
	:let Nmonth = strftime("%m",lastday)
		if Nmonth == strftime("%m",now)
			:let lasttime = strftime("%d",lastday)
		:endif
:endfor

:let s = 0
:let firestday = now-yes
:while strftime("%d",firestday) > 1 
	:let firestday = now-(yes*s)
	:let s += 1
:endwhile

:let week = strftime("%a",firestday)

:let list = ["日","月","火","水","木","金","土"]
echo strftime("                   　  %m月",now)
echo ("    日    月    火    水    木    金    土")
:let g = 1
:while week != list[g]
	:let g += 1
:endwhile

let list1 = []
for d in range (0,g-1)
	call add(list1,'  ')
endfor


for l in range (1,lasttime)
	if l < 10
		let h = ' '.l
		call add(list1,h)
	elseif l >=10
		call add(list1,''.l)
	endif
endfor

for o in range(1,9)
	call add(list1,'  ')
endfor

for r in [0,8,16,24,32,40]
	call insert(list1,"\n",r)
endfor


echo (list1)
