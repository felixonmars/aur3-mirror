# Contributor: quasi <quasi@aur.archlinux.org>

pkgname=stedi
pkgver=1
pkgrel=1
pkgdesc="Text editor designed for FORM"
arch=('i686' 'x86_64')
url="http://www.nikhef.nl/~form/"
license=(custom:FORM)
md5sums=('77745f7a361197549b07b5d01b09fa4b' 
		 '87e9bb7fea6baeb1ca6933d45d7753bd'
		 '54d719d98c2c3f053ffccc64dddca4a0'
		 'f80e8b0cbc3c0b5878b16a17b1cc3ed2'
		 '51e4196b2612c8da55712674be35260b'
		 '1936c5ab60f17625d06b07ba52c13400'
 		 '8ede17244954dfb2c6a0babd3c36f77a'
		 '0ae52fd846a0fccf3023aceec9c8aa10'
		 '000d62add454aff9b17d6bc5ac1668f0'
		 '4987dcb51d634917a57dfa7fa9a84443'
		 '0b545e19129bd5107b35ce2c8953c44b'
		 '20dc403dadd1122e1502d5030c31a885')

source=(http://www.nikhef.nl/~form/maindir/others/stedi/st
		http://www.nikhef.nl/~form/maindir/others/stedi/stedi
		http://www.nikhef.nl/~form/maindir/others/stedi/termcap
		http://www.nikhef.nl/~form/maindir/others/stedi/stedi.xdf
		http://www.nikhef.nl/~form/maindir/others/stedi/stedi.hlp
		http://www.nikhef.nl/~form/maindir/others/stedi/macs.tar.gz
		http://www.nikhef.nl/~form/maindir/oldversions/FORMdistribution/stedi/stedi.ps
		http://www.nikhef.nl/~form/maindir/oldversions/FORMdistribution/stedi/stedi.pdf
		http://www.nikhef.nl/~form/maindir/oldversions/FORMdistribution/stedi/stedi.tar.gz
		license
		stedi.install
		stedihtml.tar.gz
		)

build() {
	
	mkdir -p $pkgdir/usr/bin/ || return 1
	mkdir -p $pkgdir/usr/share/doc/stedi/ return 1
	mkdir -p $pkgdir/usr/share/stedi/ return 1

	echo "#!/bin/bash" > $pkgdir/usr/share/stedi/st || return 1
	echo "mkdir -p ~/bin/" >> $pkgdir/usr/share/stedi/st || return 1
	echo "cp -f /usr/share/stedi/termcap ~/bin/" >> $pkgdir/usr/share/stedi/st || return 1
	echo "cp -f /usr/share/stedi/stedi.xdf ~/bin/" >> $pkgdir/usr/share/stedi/st || return 1
	echo "cp -f /usr/share/stedi/stedi ~/bin/" >> $pkgdir/usr/share/stedi/st || return 1
	echo "export TERMCAP=~/bin/termcap" >> $pkgdir/usr/share/stedi/st || return 1
	echo "export STEDIHLP=~/bin/usr/share/stedi/" >> $pkgdir/usr/share/stedi/st || return 1
	echo "export STEDIDFT=~/bin/" >> $pkgdir/usr/share/stedi/st || return 1
	echo "export  STEDIMAC=/usr/share/stedi/macs" >> $pkgdir/usr/share/stedi/st || return 1
	cat $startdir/st | grep -v "#" >> $pkgdir/usr/share/stedi/st || return 1
	cp -f $startdir/stedi $pkgdir/usr/share/stedi/ || return 1
	ln -s -f ../share/stedi/st $pkgdir/usr/bin/st || return 1
	ln -s -f ../share/stedi/stedi $pkgdir/usr/bin/stedi || return 1
	cp -f $startdir/termcap $pkgdir/usr/share/stedi/ || return 1
	tar zxvf $startdir/stedihtml.tar.gz -C $pkgdir/usr/share/doc/stedi/ || return 1
	cp -f $startdir/stedi.ps $pkgdir/usr/share/doc/stedi/ || return 1
	cp -f $startdir/stedi.pdf $pkgdir/usr/share/doc/stedi/ || return 1
	cp -f $startdir/stedi.tar.gz $pkgdir/usr/share/stedi/ || return 1
	tar zxvf $startdir/macs.tar.gz -C $pkgdir/usr/share/stedi/ || return 1
	cp -f $startdir/stedi.xdf $pkgdir/usr/share/stedi/ || return 1
	cp -f $startdir/stedi.hlp $pkgdir/usr/share/doc/stedi/ || return 1
	cp -f $startdir/license $pkgdir/usr/share/doc/stedi/ || return 1

	chmod 755 $pkgdir/usr/share/stedi/st || return 1
	chmod 755 $pkgdir/usr/share/stedi/stedi || return 1
	
}


