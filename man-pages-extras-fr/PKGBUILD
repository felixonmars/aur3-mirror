# Contributor: Marc Poiroud <marci1 AT archlinux.fr>
pkgname=man-pages-extras-fr
pkgver=0.8.1
pkgrel=2
pkgdesc="Pages de man complémentaire francophone"
arch=('i686' 'x86_64')
groups=('manpagesfr')
url="http://manpagesfr.free.fr/"
license=('GPL')
source=(http://manpagesfr.free.fr/download/$pkgname-$pkgver.tar.bz2)
md5sums=('94b3c7d6a13f6492417d25d3dc92b016')

build() {
	_fhsman="usr/share/man/fr"
 	cd $startdir/src/$pkgname-$pkgver
	#make DESTDIR=$startdir/pkg install-archlinux
	make DESTDIR=$startdir/pkg install
	# suppression des doublons
	rm $startdir/pkg/${_fhsman}/man1/chsh.1
	rm $startdir/pkg/${_fhsman}/man3/sigwait.3
	rm $startdir/pkg/${_fhsman}/man5/issue.net.5
	# ajout du ChangeLog
	cp $startdir/src/$pkgname-$pkgver/Changements $startdir/ChangeLog
}
