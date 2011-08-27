pkgname=fortune-mod-sapkowski-pl
pkgver=20060830
pkgrel=2
pkgdesc="A collection --- fortune cookies --- of quotes from the polish "Wiedzmin" novels by Andrzej Sapkowski."
makedepends=('rpmextract')
depends=('fortune-mod')
license=('other')
groups=('fortune-mods')
source=(http://ftp1.pld-linux.org/pool/f/fortune-mod-pl-sapkowski/fortune-mod-pl-sapkowski-${pkgver}-${pkgrel}.noarch.rpm)
md5sums=('d551ad406aa4472d0736408b3f7775ac')
arch=('i686' 'x86_64')
url="http://dinth.pl"

build() {

	rpmextract.sh fortune-mod-pl-sapkowski-${pkgver}-${pkgrel}.noarch.rpm
	cd $startdir/src/

	install -D -m644 $startdir/src/usr/share/games/fortunes/sapkowski $startdir/pkg/usr/share/fortune/sapkowski
	install -D -m644 $startdir/src/usr/share/games/fortunes/sapkowski.dat $startdir/pkg/usr/share/fortune/sapkowski.dat

}
