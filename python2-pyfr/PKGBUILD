# Maintainer: Masoud <mpoloton@gmail.com>

pkgname=('python2-pyfr')
pkgver=0.2.4
pkgrel=1
pkgdesc="Python based framework for solving advection-diffusion type problems on streaming architectures"
arch=('i686' 'x86_64')
url="http://www.pyfr.org/"
license=('BSD')
makedepends=('python2-setuptools')
source=("http://www.pyfr.org/download/PyFR-${pkgver}.zip")
depends=('python2-numpy' 'python2-mpmath' 'python2-mpi4py' 'python2-pytools' 'python2-mako' 'python2-appdirs')
optdepends=('metis: needed for running PyFR in parallel'
	    'ptscotch-openmpi: needed for running PyFR in parallel' 
	    'python2-pycuda: needed for CUDA Backend' 
            'python2-pyopencl: needed for OpenCL Backend' 
            'clblas: needed for OpenCL Backend' 
            'cblas: OpenMP Backend'
            'openblas: Optimized BLAS' )
            
md5sums=('2f15cc9898b3ffe23fc4d227dfb83395')



build() {
  msg "Building Python2"
  cd "$srcdir"/PyFR-${pkgver}
  python2 setup.py build
}

package() {

  cd "$srcdir"/PyFR-${pkgver}

  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}


