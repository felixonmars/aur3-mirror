# Maintainer: Mark Coolen <mark.coolen@gmail.com>
pkgname=writerperfect
pkgver=0.9.2
pkgrel=1
pkgdesc="libwpd utilities for converting WordPerfect(tm) and Visio(tm) documents to odt and odg"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/libwpd"
license=('LGPL')
depends=('libwpd' 'libwpg' 'libwps' 'libvisio' 'libgsf')
makedepends=('libtool' 'glib2')
optdepends=('libmwaw' 'libfreehand' 'libabw' 'libepubgen')
source=(http://downloads.sourceforge.net/project/libwpd/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('bc6f1b7037fdbb655d86f62150e71dc9')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./autogen.sh
	./configure --prefix=/usr --disable-werror
	make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
