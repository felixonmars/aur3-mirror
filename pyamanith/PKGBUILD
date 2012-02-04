# Contributor: Allan McRae <mcrae_allan@hotmail.com>

pkgname=pyamanith
pkgver=0.3.35
pkgrel=1
pkgdesc="Python wrapper for the Amanith 2D vector graphics library"
arch=('i686' 'x86_64')
url="http://unrealvoodoo.org/hiteck/projects/pyamanith/"
license=('GPL')
depends=('python' 'amanith')
makedepends=('swig')
source=(http://muksuluuri.ath.cx/~skyostil/projects/pyamanith/dist/PyAmanith-${pkgver}.tar.gz
        pyamanith-0.3.35-build.patch)
md5sums=('eb833bc3b6ac6c30eb7252756dde3786'
         '45a396d6d82a3a73e8adedf1b51e9836')

build() {
  cd ${startdir}/src/PyAmanith-${pkgver}
  
  patch -Np0 -i ../pyamanith-0.3.35-build.patch		# updated version Gentoo patch
  sed -i "/include/s#build/amanith/include/##" headers.i
  
  python setup.py install --root=${startdir}/pkg
}

