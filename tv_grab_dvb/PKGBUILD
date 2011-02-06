# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=tv_grab_dvb
pkgver=0.9
pkgrel=1
pkgdesc="A program to dump DVB EPG info in xmltv format."
arch=(i686 x86_64)
url="http://www.darkskiez.co.uk/index.php?page=tv_grab_dvb"
license=('GPL')
depends=('glibc')
makedepends=('gcc')
source=(http://www.darkskiez.co.uk/$pkgname-$pkgver.tar.gz)
md5sums=('f347ffa1bc3fd3963d916306b6dd5bca')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make clean && make || return 1
  install -D -m 0755 $pkgname $pkgdir/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
