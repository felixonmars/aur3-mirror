# Maintainer: corvolino <corvolino@archlinux.com.br>

pkgname=evolution-python
pkgver=0.0.4
pkgrel=6
pkgdesc="is a new library to add python support to evolution-data-server through producing bindings for libebook and libecal. This is still an alpha quality binding, so expect memory leaks."
depends=('evolution-data-server' 'gnome-python-desktop' 'gdk-pixbuf')
arch=('i686' 'x86_64')
license=('GPL')
source=("http://files.conduit-project.org/releases/${pkgname}-${pkgver}.tar.gz")
url="http://www.conduit-project.org/wiki/evolution-python"
md5sums=('2d08555f0a6de288bfcc3b048d98b3e4')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}


