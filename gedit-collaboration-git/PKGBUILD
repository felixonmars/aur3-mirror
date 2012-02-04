pkgname=gedit-collaboration-git
pkgver=20100614
pkgrel=1
pkgdesc="gedit collaboration plugin provides support for collaborative editing in gedit."
arch=('i686' 'x86_64')
url="http://blogs.gnome.org/jessevdk/2010/02/14/47/"
license=('other')
provides=('gedit-collaboration')
conflicts=('gedit-collaboration')
makedepends=('git')
depends=('libinfinity' 'gtksourceview2' 'gedit')
build() {

  cd $srcdir
  git clone git://github.com/jessevdk/gedit-collaboration.git
  cd gedit-collaboration
  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install || return 1

}




