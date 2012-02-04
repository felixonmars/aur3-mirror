# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=plastex-cvs
pkgver=20101107
pkgrel=1
pkgdesc="Python-based LaTeX document processing framework."
arch=('any')
url="http://plastex.sourceforge.net/"
license=('custom')
depends=('python2' 'texlive-core')
makedepends=('cvs')
provides=(plastex)
conflicts=(plastex)
source=()
md5sums=()
#generate with 'makepkg -g'

_cvsroot=":pserver:anonymous@plastex.cvs.sourceforge.net:/cvsroot/plastex"
_cvsmod="plastex"

build() {
  cd "$srcdir"
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
    cd $_cvsmod
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_cvsmod-build"
  cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
  cd "$srcdir/$_cvsmod-build"


  #
  # BUILD HERE
  #

  python2 setup.py install --root=$pkgdir/ 
  install -D -m644 $srcdir/$_cvsmod-build/LICENSE \
    $pkgdir/usr/share/licenses/$pkgname/LICENSE 
}
