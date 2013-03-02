# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Elijah Perrault
# Contributor: Dan Serban

_rev=181
pkgname=umplayer
pkgver=0.97_svn$_rev
pkgrel=2
pkgdesc="A complete front-end for MPlayer"
arch=('i686' 'x86_64')
url="http://www.umplayer.com/"
license=('GPL3')
depends=('mplayer' 'qt4')
install="$pkgname.install"
source=("$pkgname-utube.patch::http://smplayer.svn.sourceforge.net/viewvc/smplayer/smtube/trunk/src/retrievevideourl.cpp?r1=4376&r2=4918&view=patch")
md5sums=('0f45d198c7e0ff7f82a63870de5a4d11')

build() {
  # download with viewvc and extract
  wget "http://umplayer.svn.sourceforge.net/viewvc/umplayer/?view=tar&pathrev=$_rev" \
    -qO- | tar zxvf - -C "$srcdir"

  cd "$srcdir/$pkgname/$pkgname/trunk"

  # youtube patch (convert dos2unix first)
  sed -i 's/\r//' `find . -name retrievevideourl.cpp`
  patch -p2 -i "$srcdir/${source[0]/:*}"

  # doc path fix
  sed -i "s|/packages||" Makefile

  make QMAKE=qmake-qt4 LRELEASE=lrelease-qt4 PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname/$pkgname/trunk"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
