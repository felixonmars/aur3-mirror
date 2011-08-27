# Contributor: zhuqin <zhuqin83 AT gmail DOT com>
pkgname=libxft-newspr
pkgver=2.1.14
pkgrel=1
pkgdesc="FreeType-based font drawing library for X, with LCD rendering patches"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
license=('GPL')
depends=('fontconfig>=2.6.0' 'libxrender' 'sh')
conflicts=('libxft' 'libxft-lcd')
provides=("libxft=$pkgver")
makedepends=('pkgconfig')
options=('!libtool')
source=(http://xorg.freedesktop.org/releases/individual/lib/libXft-${pkgver}.tar.bz2 lcd.patch)
md5sums=('254e62a233491e0e1251636536163e20' '1d37fba7199d3746fdecd47ef59301e4')

build() {
  cd $srcdir/libXft-$pkgver
  
  patch -p0 < ../lcd.patch || return 1

  ./configure --prefix=/usr --sysconfdir=/etc --disable-static || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
