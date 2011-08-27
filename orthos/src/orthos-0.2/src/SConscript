
Import('env')
from os import listdir;
ld=listdir(".")
files=[]
for i in ld:
	if len(i)>4:
		if i[-4:].lower()=='.cpp':
			files.append(i)

retval=env.Object(files)
Return('retval')


