# Maintainer: Bjorn Lindeijer <bjorn lindeijer nl>
# Contributor: William Rea <sillywilly@gmail.com>
pkgname=ruby-scw
pkgver=0.4.0
pkgrel=2
pkgdesc="Ruby bindings for scw"
arch=('i686' 'x86_64')
url="http://scwwidgets.googlepages.com/"
license="LGPL"
depends=('ruby-gtk2' 'scw')
source=(http://scwwidgets.googlepages.com/$pkgname-$pkgver.tar.gz)
md5sums=('c2d037215edcf8cff51c5d954b730597')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ruby extconf.rb
  make || return 1
  make DESTDIR=$startdir/pkg install
}
