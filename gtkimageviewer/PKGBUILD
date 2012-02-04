# Maintainer: Bartek Piotrowski <barthalion@gmail.com>
# Contributor: Laurent Meunier <meunier.laurent@laposte.net>

pkgname=gtkimageviewer
pkgver=0.9.3
pkgrel=1
pkgdesc="GtkImageViewer is perfectly suited to be used by any photo display program and will provide a uniform interface for interacting with images."
arch=('i686' 'x86_64')
url="http://giv.sourceforge.net/gtk-image-viewer/"
license=('LGPL')
depends=('gtk2')
source=(http://downloads.sourceforge.net/giv/$pkgname-$pkgver.tar.gz)
md5sums=('12a9affa71d486c28110f370400087cf')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install

  # libtool-slaying
  find $pkgdir -name '*.la' -exec rm {} \;
}
