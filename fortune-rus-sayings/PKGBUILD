# Maintainer: Dmitrij <aur@lnx.lv>
pkgname=fortune-rus-sayings
pkgver=0.1
pkgrel=1
pkgdesc="Russian folk sayings (UTF-8 russian)"
arch=('i686' 'x86_64')
url="http://lnx.lv/fortune"
license=('BSD')
groups=()
depends=('fortune-mod')
source=(http://lnx.lv/fortune/$pkgname-$pkgver.tar.gz)
md5sums=('9d06fd4e287c896a1e7c175bd61b4d8d')
_installpath="usr/share/fortune"

build() {
  cd $startdir/src/$pkgname-$pkgver
  install -m 755 -d $startdir/pkg/$_installpath
  install -m 644 rus_poslovicy $startdir/pkg/$_installpath
  cd $startdir/pkg/$_installpath
  strfile rus_poslovicy
}
