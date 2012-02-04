# Author: tantalum <theseph@gmx.de>
pkgname_orig=deprecated
pkgname=ruby-deprecated
pkgver=2.0.1
pkgrel=1
pkgdesc="handle deprecating and executing deprecated code" 
arch=(i686 x86_64 ppc)
license="bsd"
depends=('ruby') 
url=("http://rubyforge.org/projects/deprecated/")
source=("http://rubyforge.org/frs/download.php/40375/${pkgname_orig}-${pkgver}.tar.gz")
md5sums=(10d0962965ee856c364be2bfe8f1c323)

build() { 
	cd ${srcdir}/${pkgname_orig}-$pkgver 
	ruby setup.rb config
	ruby setup.rb setup
	ruby setup.rb install --prefix=${pkgdir}
}
