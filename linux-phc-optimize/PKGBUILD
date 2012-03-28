# Contributor: T - rttommy@gmail.com
# Maintainer: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>

pkgname=linux-phc-optimize
pkgver=0.1
pkgrel=5
pkgdesc='Script to determine optimal voltage values for linux-phc.'
url='http://openmindedbrain.info/09/05/2010/undervolting-in-ubuntu-10-04-lucid-lts/'
depends=('cpuburn')
arch=('any')
license=('GPL')
optdepends=('phc-intel: frequency driver for Intel CPUs with undervolting feature'
'phc-k8: frequency driver for AMD K8 with undervolting feature')
source=('http://openmindedbrain.info/wp-content/uploads/2010/05/intel-phc-undervolt.bash')
md5sums=('3bdcbad83b48061feb4a4220ea020f8c')

build() {
	cd $startdir/pkg
	install -Dm755 $srcdir/intel-phc-undervolt.bash $pkgdir/usr/bin/$pkgname
}
