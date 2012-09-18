# Contributor: quasi <quasi@aur.archlinux.org>

pkgname=form
pkgver=4.0
pkgrel=1
pkgdesc="Symbolic Manipulation System"
arch=('i686' 'x86_64')
url="http://www.nikhef.nl/~form/"
license=(custom:FORM)
md5sums=('83217fe95391f31551e6b2c3e44a8ebb'
	 '8f2976853f886aa063f1b7e2f885a641'
	 '66517ffccbb0db6a73c95571425fed35'
	 '6345845e6d4a463182fe59b7f59f530f'
	 '4a8632e051014f60534f14d8ba409af9'
	 'e68e579fe78da3664b82a8dc6a6a32c3'
	 '0b545e19129bd5107b35ce2c8953c44b'
	 '4987dcb51d634917a57dfa7fa9a84443')

if [ ${CARCH} = "i686" ]
then
	_plat=32
	else
	_plat=64
fi

source=(http://www.nikhef.nl/~form/maindir/documentation/tutorial/book.ps
		http://www.nikhef.nl/~form/maindir/documentation/tutorial/book.pdf
		http://www.nikhef.nl/~form/maindir/documentation/reference/man.ps
		http://www.nikhef.nl/~form/maindir/documentation/reference/man.pdf
		http://www.nikhef.nl/~form/maindir/documentation/lattice.ps
		http://www.nikhef.nl/~form/maindir/documentation/lattice.pdf
		form.install
		license
		)

build() {
	wget http://www.nikhef.nl/~form/maindir/binaries/linux${_plat}/form -O $srcdir/form || return 1
	wget http://www.nikhef.nl/~form/maindir/binaries/linux${_plat}/tform -O $srcdir/tform || return 1
	
	mkdir -p $pkgdir/usr/bin/ || return 1
	mkdir -p $pkgdir/usr/share/doc/FORM/ return 1
	
	cp -f $srcdir/form $pkgdir/usr/bin/ || return 1
	cp -f $srcdir/tform $pkgdir/usr/bin/ || return 1
	cp -f $srcdir/*.ps $pkgdir/usr/share/doc/FORM/ || return 1
	cp -f $srcdir/*.pdf $pkgdir/usr/share/doc/FORM/ || return 1
	cp -f $srcdir/license $pkgdir/usr/share/doc/FORM/ || return 1

	chmod 755 $pkgdir/usr/bin/form || return 1
	chmod 755 $pkgdir/usr/bin/tform || return 1
	
}

