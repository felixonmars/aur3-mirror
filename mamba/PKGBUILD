# Maintainer: perlawk
pkgname=mamba
_pkgname=Mamba
pkgver=1.1.2
pkgrel=1
pkgdesc="Mamba Image library for Python. Mamba stands for MAthematical Morphology liBrAry. Originated from Micromorph."
url="http://www.mamba-image.org/"
arch=('x86_64' 'i686')
license=('Customize')
depends=('python2-imaging' 'swig')
install=
source=("http://www.mamba-image.org/download/1.1.2/${_pkgname}.${pkgver}.zip")
 
build() {
  cd "${srcdir}/${_pkgname}.${pkgver}"/src/mambaApi	
	python2 setup.py build_py build_ext build_clib 
}
 
package() {
  cd "${srcdir}/${_pkgname}.${pkgver}"/src/mambaApi	
	python2 setup.py install --prefix="$pkgdir/usr"
}
md5sums=('072a53b857f745fa59c15c25d11e6618')
