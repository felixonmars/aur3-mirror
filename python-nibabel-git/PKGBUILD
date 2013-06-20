# Maintainer: Samuel St-Jean <qekchose __please-remove-this-part__ @ dot gmail.com>

pkgname=python-nibabel-git
pkgver=20130619
pkgrel=1
pkgdesc="This package provides read and write access to some common medical and neuroimaging file formats, including: ANALYZE (plain, SPM99, SPM2), GIFTI, NIfTI1, MINC, MGH and ECAT as well as PAR/REC. This is the python 3 version"
arch=(any)
url="http://nipy.sourceforge.net/nibabel"
license=('LGPL')
depends=('git' 'python' 'python-numpy' 'python-scipy' 'python-imaging' 'python-nose' 'python-sphinx')
optdepends=('python-pydicom: For dicom support')
provides=('python-nibabel-git')
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
  python setup.py install --root="$pkgdir"
}
