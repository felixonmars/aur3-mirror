pkgname=squishyball-svn
pkgver=18997
pkgrel=1
pkgdesc="Compares groups of similar samples. AB, ABX, XXY double-blind testing."
depends=('flac'
         'libao'
         'libvorbis'
	 'opusfile') 
makedepends=('subversion')
url=("http://svn.xiph.org/trunk/squishyball/")
arch=('i686' 'x86_64')
license=('GPL2')
source=()
md5sums=()

_svntrunk="http://svn.xiph.org/trunk/squishyball"
_svnmod="squishyball"

build() {
  svn co $_svntrunk $_svnmod
  cd "$srcdir/$_svnmod"
  ./autogen.sh
  make
}

package() {
  cd "$srcdir/$_svnmod"
  install -D -m755 squishyball "$pkgdir/usr/bin/squishyball"
  install -D -m644 squishyball.1 "$pkgdir/usr/share/man/man1/squishyball.1"
}
