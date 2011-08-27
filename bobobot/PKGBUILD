# Maintainer: Eric Belanger <belanger@astro.umontreal.ca>
pkgname=bobobot
pkgver=preview3
pkgrel=8
pkgdesc="BoboBot is Mega Man clone"
url="http://www.newbreedsoftware.com/bobobot/"
license="GPL"
arch=('i686' 'x86_64')
depends=('sdl_mixer')
source=(ftp://ftp.billsgames.com/unix/x/bobobot/src/$pkgname-$pkgver.tar.gz makefile.diff)
md5sums=('8d80981bf740bf7eda10ddc6acbde16c' '0fecc0e0c3099bd195e3d04ef6014cc5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p0 < ../makefile.diff || return 1
  install -d "$pkgdir/usr/bin"
  make MUSIC=YES X11_PREFIX=/usr INSTALLROOT=/usr/bin DATA=/usr/share/bobobot all DESTDIR="$pkgdir/" || return 1
}
