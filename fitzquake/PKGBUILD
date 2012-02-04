# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=fitzquake
pkgver=20080705
pkgrel=2
pkgdesc="A modern Quake1 engine port"
arch=('i686' 'x86_64')
url="http://www.kristianduske.com/$pkgname/"
license=('GPL')
depends=('sdl_net>=1.2' 'libgl')
install=$pkgname.install
source=($url/${pkgname}_sdl_${pkgver}_src.zip \
	$pkgname-homedir.patch \
	http://downloads.sourceforge.net/uhexen2/${pkgname}_sdl_${pkgver}_Makefile.tgz)
md5sums=('8907c5450f8cfe30472093702669df87'
         '1e10c8bdfddbc28a9e010d377e2309ae'
         'be9d15ee1dfe8722f789357744064391')

build() {
  cd ${pkgname}_sdl_${pkgver}_src/Quake

  patch -Np0 -i "$srcdir"/$pkgname-homedir.patch || return 1
  cp -f "$srcdir"/Makefile .

  make CFLAGS="${CFLAGS}" STRIP_CMD=: || return 1
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
