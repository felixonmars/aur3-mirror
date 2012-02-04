# Contributor: Guillaume Royer <groyer.perso at gmail d0t com>

pkgname=gtksourcecompletion-unstable
pkgver=0.7.0
pkgrel=2
pkgdesc="Unstable development Version. Source code completion for the GtkSourceView library"
arch=('i686' 'x86_64')
url="http://gtksourcecomple.sourceforge.net/"
license=('LGPL3')
provides=('gtksourcecompletion=0.7.0')
depends=('gtksourceview2')
options=('!libtool')
source=("http://cloud.github.com/downloads/chuchiperriman/gtksourcecompletion/gtksourcecompletion-0.7.0.tar.gz")
md5sums=("dd86f6c211dc4d8a305126f700869679")

build() {
  cd "$srcdir/gtksourcecompletion-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}

