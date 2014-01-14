# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=drumkv1
pkgver=0.3.6
pkgrel=1
pkgdesc="An old-school drum-kit sampler"
arch=(i686 x86_64)
url="http://$pkgname.sourceforge.net/$pkgname-index.html"
license=('GPL')
groups=('lv2-plugins')
depends=('jack' 'liblo' 'lv2' 'qt5-base' 'shared-mime-info' 'hicolor-icon-theme')
install="$pkgname.install"
source=("http://download.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('3091e7d75bd02498ab9106e43cf6bfe7')

prepare() {
  cd $pkgname-$pkgver

  # x86_64 lib path fix
  sed -i "s/lib64/lib/" src/src_lv2{,ui}.pro
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
