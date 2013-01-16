# Maintainer: TDY <tdy@archlinux.info>

pkgname=njiiri
pkgver=0.3.9
pkgrel=2
pkgdesc="A Ruby-GTK+ client for MPD"
arch=('i686' 'x86_64')
url="http://www.red-bean.com/decklin/njiiri/"
license=('MIT')
depends=('ruby-gnome2' 'ruby-libglade' 'ruby-librmpd')
source=(http://www.red-bean.com/decklin/$pkgname/$pkgname-$pkgver.tar.gz
        $pkgname-$pkgver-$pkgrel.diff)
md5sums=('0ec4c09bc4641739157697fd3023c730'
         '114b84fc27ae6de085cd5d7dd004f94f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i ../$pkgname-$pkgver-$pkgrel.diff
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  ./install /usr "$pkgdir"
}

# vim:set ts=2 sw=2 et:
