# Maintainer: Wolven
# Original maintainer: Tom Kwok <contact@tomkwok.com>
pkgname=kkedit
pkgver=0.2.7
pkgrel=1
pkgdesc="Source code text editor."
arch=('i686' 'x86_64')
url="https://sites.google.com/site/keithhedgersyard/kkedit-help"
license=('GPL3')
depends=('gtksourceview2' 'libunique' 'webkitgtk2' 'desktop-file-utils')
makedepends=('ctags')
optdepends=('xterm: for opening terminal within editor'
            'gtksu: for running a program with different privileges')
source=(http://keithhedger.hostingsiteforfree.com/zips/kkedit/KKEdit-$pkgver.tar.gz)
md5sums=('f95d8f698c754627347eae5b3992bfb5')
install=kkedit.install

prepare() {
  cd $srcdir/KKEdit-$pkgver
  ./autogen.sh --prefix=/usr --enable-docviewer --enable-aspell
}

build() {
  cd $srcdir/KKEdit-$pkgver
  make
}

package() {
  cd $srcdir/KKEdit-$pkgver
  make DESTDIR=$pkgdir install
}
