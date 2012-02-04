# Contributer "daelstorm <daelstorm@gmail.com>"
# Sat Aug 25 21:41:47 IDT 2007

pkgname=museek-plus
pkgver=0.1.13
pkgrel=1
pkgdesc="Museek+ is a C++ daemon/client Soulseek P2P client, that includes QT, PyGTK, and Curses UIs and a PyGTK config tool."
url="http://www.museek-plus.org/"
license="GPL"
depends=('libxml++2' 'libogg' 'libvorbis' 'python' 'qt' 'qsa3' 'pygtk')
source=(http://downloads.sourceforge.net/museek-plus/museek+-$pkgver.tar.bz2 post_release_fixes.patch)
arch=(i686 x86_64)
makedepends=('cmake' 'pkgconfig' 'swig')
conflicts=('mucous' 'museek-plus-svn')
replaces=('mucous' 'museek-plus' 'museek-plus-svn')
md5sums=(7aada627839578ebe525c54a1cef7dc4 17a4afb7df527269be34016ab88f9464)
build() {
  # Qt3 required
  . /etc/profile.d/qt.sh
  cd $startdir/src/museek+-$pkgver/
  patch -p0 < $startdir/src/post_release_fixes.patch || return 1
  cd museeq
  # build .qm translations from .ts
  lrelease museeq.pro
  cd ..
  mkdir -p $startdir/pkg/etc/rc.d/
  cp museekd.rc $startdir/pkg/etc/rc.d/museekd
  mkdir workdir
  cd workdir
  # Museekd with debugging, Museeq with trayicon & binary relocation
  # all python tools, clients, bindings
  cmake -DSWIG_DIR=/usr/share/swig/1.3.31 -DMULOG=1 -DEVERYTHING=1 -DPREFIX=/usr -DTRAYICON=1 -DBINRELOC=1 .. || return 1
  make || return 1 # VERBOSE=1
  make install DESTDIR=$startdir/pkg || return 1
  
}
