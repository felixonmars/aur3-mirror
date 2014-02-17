pkgname=python-spherepack
pkgver=3.2
pkgrel=2
pkgdesc="Spherepack scientific library"
depends=('python-numpy')
arch=('i686' 'x86_64')
url="http://www.cisl.ucar.edu/css/software/spherepack/"
license=('BSD')
makedepends=('gcc-fortran')
source=(https://launchpad.net/ubuntu/+archive/primary/+files/spherepack_3.2.orig.tar.gz
        spherepack-3.2_ubuntu_build_7.patch)
md5sums=('28369fa2f9f3cfdbd9112fcdd92b7fc5'
         '417e60cc718dc0c923cdc5a05ed98583')

prepare() {
   cd "${srcdir}"/spherepack-3.2
   patch -Np1 -i ../spherepack-3.2_ubuntu_build_7.patch
}

build() {
   cd "${srcdir}"/spherepack-3.2

   pushd Src
   make
   popd 

   python setup.py build
}

package() {
   cd "${srcdir}"/spherepack-3.2

   pushd Src
   make DESTDIR="${pkgdir}" install
   popd 

   python setup.py install --root "${pkgdir}" --skip-build --optimize=1

   rm -f "${pkgdir}"/libsphere.so
}
