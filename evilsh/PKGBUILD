# Contributor: Lexion <omk.reviloliver@gmail.com>
pkgname=evilsh
pkgver=0.1
pkgrel=1
pkgdesc="Evilsh is a shell that doesn't require a *.rc file"
arch=('i686' 'x86_64')
url="http://onebluecat.net/evilsh"
license=('GPL')
install=evilsh.install
depends=('readline')
optdepends=()
makedepends=('make')
provides=('evilsh')
conflicts=('evilsh')
source=()
md5sums=()

build() {
	wget $url/evilsh-src.tar.gz -O $srcdir/evilsh-src.tar.gz
	tar xf $srcdir/evilsh-src.tar.gz

	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/etc
	cd $srcdir/evilsh-src; make
	install -m 755 $srcdir/evilsh-src/evilsh $pkgdir/usr/bin/evilsh
	chmod +x $pkgdir/usr/bin/evilsh
	cp $srcdir/evilsh-src/evilshrc $pkgdir/etc/evilshrc
}
