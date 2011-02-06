# Contributor: dimino jeremie <jeremie@dimino.org>
# Contributor: Paolo Herms
pkgname=proofgeneral-cvs
pkgver=20100326
pkgrel=1
pkgdesc="Generic interface for proof assistants"
arch=(i686 x86_64)
url="http://proofgeneral.inf.ed.ac.uk/"
depends=('emacs')
makedepends=('cvs')
provides=('proofgeneral')
conflicts=('proofgeneral')
license=('GPL')
install=proofgeneral.install

_cvsroot=":pserver:anon:anon@cvs.inf.ed.ac.uk:/disk/cvs/proofgen"
_cvsmod="ProofGeneral"

build() {
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
    cd $_cvsmod
  fi

  make clean
  yes ''|make compile || return 1
  make PREFIX=$startdir/pkg/usr install
}
