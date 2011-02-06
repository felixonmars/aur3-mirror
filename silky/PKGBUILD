# Contributor: Mark Rosenstand <mark@borkware.net>
pkgname=silky
pkgver=20051031
pkgrel=1
pkgdesc="A secure chat client."
url="http://silky.sourceforge.net/"
license=""
depends=('libglade' 'silc-toolkit')
#makedepends=('gettext' 'pkgconfig')
makedepends=('cvs' 'autoconf' 'automake' 'gettext' 'libtool' 'pkgconfig')
#source=(http://dl.sourceforge.net/sourceforge/silky/$pkgname-$pkgver.tar.gz)
source=()
#md5sums=('ef7a583bfb612ec16b3437f56e5c72a3')
md5sums=()

_cvsroot=":pserver:anonymous@anoncvs.gnome.org:/cvs/gnome"
_cvsmod="silky"

build() {
#  cd $startdir/src/$pkgname-$pkgver
  cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
  cd $startdir/src/$_cvsmod
#  ./configure --prefix=/usr
  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
