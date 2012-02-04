# Author: tantalum <mail@thaseph.de>
pkgname=ruby-dbd-mysql
pkgver='0.4.3'
pkgrel=1
pkgdesc='ruby-dbi database driver mysql' 
arch=(i686 x86_64 ppc)
license=custom
depends=('ruby-dbi>=0.4.1' 'ruby>=1.8.0' 'mysql-ruby') 
url=http://rubyforge.org/projects/ruby-dbi
source=(http://rubyforge.org/frs/download.php/60193/dbd-mysql-${pkgver}.tar.gz)
md5sums=(5d3d874bf7e3038f4eb0b16eead52728)

build() { 
	cd ${srcdir}/dbd-mysql-${pkgver} &&
	ruby setup.rb config &&
	ruby setup.rb setup &&
	ruby setup.rb install --prefix=${pkgdir} || return 1
}
