# Contributor: William Rea <sillywilly@gmail.com>
pkgname=osgedit
pkgver=0.6.1
pkgrel=2
pkgdesc="An open editor for an openscenegraph"
url="http://osgedit.sourceforge.net"
depends=('gtksourceview' 'gtkglext' 'openscenegraph')
makedepends=('gettext')
source=(http://dl.sourceforge.net/sourceforge/osgedit/osgedit-$pkgver.tar.gz)
md5sums=('3cdf3563c53a2046114f17c97d18e38e')

build() {
  cd $startdir/src/osgedit-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install

}
