# Contributor: Gadget3000 <gadget3000 at msn dot com>
pkgname=fortune-mod-discworld-pl
pkgver=20060830
pkgrel=1
pkgdesc="A collection --- fortune cookies --- of quotes from the "Discworld" novels by Terry Pratchett. Polish translation."
makedepends=('rpmextract')
depends=('fortune-mod')
groups=('fortune-mods')
source=(ftp://ftp.pbone.net/mirror/ftp.pld-linux.org/dists/2.0/PLD/amd64/PLD/RPMS/fortune-mod-pl-pratchett-${pkgver}-2.noarch.rpm)
md5sums=('a94bb465e7ca10b223efb9f4ed6ba393')
arch=('i686' 'x86_64')
url="http://www.splitbrain.org/projects/fortunes/discworld"
license=('None')

build() {

	rpmextract.sh fortune-mod-pl-pratchett-${pkgver}-2.noarch.rpm
	cd ${srcdir}

	install -D -m644 ${srcdir}/usr/share/games/fortunes/pratchett $startdir/pkg/usr/share/fortune/pratchett
	install -D -m644 ${srcdir}/usr/share/games/fortunes/pratchett.dat $startdir/pkg/usr/share/fortune/pratchett.dat

}
