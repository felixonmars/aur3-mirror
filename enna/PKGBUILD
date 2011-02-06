pkgname=enna
pkgver=0.4.0
pkgrel=1
pkgdesc="EFL mediacenter which manages video, music, pictures"
arch=('i686' 'x86_64')
license=('BSD')
url="http://enna.geexbox.org/"
makedepends=('')
conflicts=('enna')
replaces=('enna-cvs' 'enna-svn')
depends=('eet' 'embryo-svn' 'edje-svn' 'ecore-svn' 'elementary-svn' 'libplayer' 'libvalhalla')
source=("http://enna.geexbox.org/releases/enna-${pkgver}.tar.bz2")
md5sums=('e0595b3142fd1a1cc3e773c7de6dcd88')

build() {
  cd $startdir/src/enna-${pkgver}/
  autoconf
  ./configure --prefix=/usr/ --disable-static

  make || return 1
  make DESTDIR=$startdir/pkg install

  install -D -m644 AUTHORS $startdir/pkg/usr/share/licenses/$pkgname/AUTHORS
  install -D -m644 COPYING $startdir/pkg/usr/share/licenses/$pkgname/COPYING
}

