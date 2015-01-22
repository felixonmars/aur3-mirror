# Maintainer: Masoud <mpoloton@gmail.com>

pkgname=('python2-nibabel')
pkgver=2.0.0
pkgrel=1
pkgdesc="Python library for reading and writing of some common neuroimaging file formats"
arch=('i686' 'x86_64')
url="http://nipy.org/nibabel"
license=('BSD')
makedepends=('python2-setuptools')
depends=('python2')
source=("https://pypi.python.org/packages/source/n/nibabel/nibabel-${pkgver}.tar.gz")
md5sums=('befa2fcbd242496a83007a47aad538de')

prepare() {
  cd "$srcdir"
  cd nibabel-${pkgver}

  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

build() {
  msg "Building Python2"
  cd "$srcdir"/nibabel-${pkgver}
  python2 setup.py build
}

package_python2-nibabel() {

  cd "$srcdir"/nibabel-${pkgver}

  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
  
  pushd "$pkgdir/usr/bin/"
  mv  nib-ls nib-ls2 
  mv  nib-dicomfs nib-dicomfs2
  mv  nib-nifti-dx nib-nifti-dx2
  mv  parrec2nii parrec2nii2
  popd
  
}


