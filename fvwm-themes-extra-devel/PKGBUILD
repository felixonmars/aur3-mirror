# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>
pkgname=fvwm-themes-extra-devel
pkgver=0.7.0
pkgrel=1
pkgdesc="Development extra themes for fvwm"
arch=('i686' 'x86_64')
url="http://fvwm-themes.sourceforge.net"
license="unknown"
depends=('fvwm-devel' 'perl')
source=("http://dl.sourceforge.net/sourceforge/fvwm-themes/fvwm-themes-extra-$pkgver.tar.gz")
md5sums=('66c13802933942949c7c1be79a497496')

build() {
  cd $startdir/src/fvwm-themes-extra-$pkgver
  mkdir -p $startdir/pkg/usr/share/fvwm/themes
  install * $startdir/pkg/usr/share/fvwm/themes/
}
