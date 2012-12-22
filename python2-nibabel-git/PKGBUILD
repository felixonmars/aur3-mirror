# Maintainer: Faruk Diblen <fdiblen at gmail dot com>

pkgname=python2-nibabel-git
pkgver=20121222
pkgrel=1
pkgdesc="This package provides read and write access to some common medical and neuroimaging file formats, including: ANALYZE (plain, SPM99, SPM2), GIFTI, NIfTI1, MINC, MGH and ECAT as well as PAR/REC."
arch=(i686 x86_64)
url="http://nipy.sourceforge.net/nibabel"
license=('LGPL')
depends=('git' 'python2' 'python2-numpy' 'python2-scipy' 'python2-pydicom' 'python2-imaging' 'python2-nose' 'python2-sphinx')
optdepends=()
provides=('python2-nibabel-git')
md5sums=()

_gitroot="https://github.com/nipy/nibabel.git"
_gitname=nibabel

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"

}

package() {
  cd "$srcdir/$_gitname-build"
  python2 setup.py install --root="$pkgdir"
}




