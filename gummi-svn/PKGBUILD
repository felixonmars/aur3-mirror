# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=gummi-svn  
pkgver=1285
pkgrel=1
pkgdesc="Simple LaTeX editor for GTK users - latest svn"
url="http://gummi.midnightcoding.org"
arch=('i686' 'x86_64')
license=('custom')
depends=('poppler-glib' 'gtksourceview2' 'texlive-core' 'gtkspell')
makedepends=('subversion' 'intltool')
conflicts=('gummi')
provides=('gummi')
source=(gummi::svn+http://svn.midnightcoding.org/gummi/trunk)
md5sums=('SKIP')
_svnmod=gummi

pkgver() {
  cd "$srcdir"/$_svnmod
  svnversion
}

build() {
  cd $srcdir/$_svnmod
  ./autogen.sh
  ./configure --prefix=/usr 
  make
}

package() {
  cd $srcdir/$_svnmod
  make DESTDIR=$pkgdir install
  install -Dm644 $srcdir/$_svnmod/COPYING \
    $pkgdir/usr/share/licenses/$_svnmod/COPYING 
}
