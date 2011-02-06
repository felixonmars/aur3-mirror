# Contributor: Marc Poiroud <marci1 AT archlinux.fr>   
#pkgname=man-fr-traducman
pkgname=man-pages-sup-fr
pkgver=20080606
pkgrel=1
pkgdesc="pages Man du groupe Traducman"
url="http://www.delafond.org/traducmanfr/"
arch=(i686 x86_64)
groups=('manpagesfr')
license=('GPL')
replaces=('man-fr-traducman')
conflicts=('man-fr-traducman')
#source=(http://www.delafond.org/traducmanfr/mansupfr.tar.bz2)
source=(http://manpagesfr.free.fr/download/${pkgname}-${pkgver}.tar.bz2)
md5sums=('e631ca2260f58b89ca881a80a4fac093')

build() {
	_fhsman="usr/share/man/fr"
	cd $startdir/src/${pkgname}-${pkgver}
## Création de la structure du paquetage
	install -d -m 755 $startdir/pkg/${_fhsman}/man{1,3,4,5,6,7,8,9}
	( cd $startdir/src/${pkgname}-${pkgver}
	for i in man[1-9]/* ; do
		install -m 644 $startdir/src/${pkgname}-${pkgver}/$i \
		$startdir/pkg/${_fhsman}/$i
	done
	)

## Suppression des pages man en doublon
	( cd $startdir/pkg/usr/share/man/fr/man1/ ;
	rm gvim.1 vi.1 )
	( cd $startdir/pkg/usr/share/man/fr/man8/ ;
	rm rpc.statd.8 )
	( cd $startdir/pkg/usr/share/man/fr/man9/ ; rm Index.9 )
}
