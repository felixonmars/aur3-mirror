# Contributor: Shaika-Dzari <shaikadzari@gmail.com>

pkgname=fvwm-themes-devel
pkgver=0.7.0
pkgrel=4
pkgdesc="Development themes for fvwm"
arch=('i686' 'x86_64')
url="http://fvwm-themes.sourceforge.net"
license="GPL"
depends=('fvwm-devel' 'perl')
source=(http://downloads.sourceforge.net/sourceforge/fvwm-themes/fvwm-themes-$pkgver.tar.bz2)
md5sums=('fca651b3f912873cc8cedf20ace1095e')

build() {
  cd $startdir/src/fvwm-themes-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
