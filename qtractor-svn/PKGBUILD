# Maintainer:  Jason Harrer <jazzyeagle79@gmail.com>
# Contributor: Jiri Prochazka <ojirio[at] gmail[dot]com>

pkgname=qtractor-svn
pkgver=r4145
pkgrel=1
pkgdesc="Audio/MIDI multitrack sequencer"
arch=('i686' 'x86_64')
url="http://qtractor.sourceforge.net"
license=('GPL2')
depends=('qt4' 'jack' 'lilv' 'libmad' 'libsamplerate' 'rubberband' 'liblo')
makedepends=('subversion' 'ladspa' 'dssi')
install="$pkgname.install"
source=("$pkgname"::"svn+http://svn.code.sf.net/p/qtractor/code/trunk")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}

prepare() {
  cd "$srcdir/$pkgname"
  # force qt4
  export ac_qmake=/usr/bin/qmake-qt4 \
         ac_moc=/usr/bin/moc-qt4 \
         ac_uic=/usr/bin/uic-qt4 \
         ac_lupdate=/usr/bin/lupdate-qt4 \
         ac_lrelease=/usr/bin/lrelease-qt4 \
         QMAKE=qmake-qt4
}

build() {
  cd "$srcdir/$pkgname"
  make -f Makefile.svn
  ./configure --prefix=/usr
  make
}
