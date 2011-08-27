# Maintainer: Stéphane Gaudreault <stephane@archlinux.org>
pkgname=pycuda
pkgver=2011.1.2
pkgrel=2
pkgdesc="Python wrapper for Nvidia CUDA"
arch=('i686' 'x86_64')
url="http://mathema.tician.de/software/pycuda"
license=('MIT/X Consortium')
source=(http://pypi.python.org/packages/source/p/pycuda/${pkgname}-${pkgver}.tar.gz)
depends=('cuda-toolkit' 'python2-numpy' 'python2-pytools' 'python2')
optdepends=('python2-pytest')
makedepends=('ctags' 'python2-distribute')
conflicts=('pycuda-git')
sha1sums=('8ab8625cb4efe3d63ad53613993c547e14dbab9f')

build() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   python2 ./configure.py \
                  --cuda-root=/usr \
                  --boost-compiler=gcc \
                  --cuda-enable-gl \
                  --cuda-inc-dir=/usr/include/cuda \
                  --cudadrv-lib-dir=/usr/lib \
                  --cudart-lib-dir=/usr/lib
   
   make
}

package() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   python2 setup.py install --prefix=/usr --root="${pkgdir}" --skip-build --optimize=1
}
# vim: set noexpandtab tabstop=8 shiftwidth=8 textwidth=132 autoindent
