_pkgname=kapteyn
pkgname=python2-$_pkgname
pkgver=2.2
pkgrel=1
pkgdesc="The Kapteyn Astronomical toolkit."
url="http://www.astro.rug.nl/software/kapteyn/"
arch=('any')
license=('MIT')
depends=('python2')
source=("http://www.astro.rug.nl/software/kapteyn/kapteyn-2.2.tar.gz")
md5sums=('e4af15aa7aa3b77f602589052c073db9')

package() {
  cd ${srcdir}/$_pkgname-$pkgver
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
    sed -i 's/pyfits/astropy.io.fits/' $file
  done
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}

