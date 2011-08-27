# Author: tantalum <mail@thaseph.de>
pkgname=ruby-dbd-sqlite3
pkgver=1.2.5
pkgrel=1
pkgdesc='ruby-dbi database driver sqlite'
arch=(i686 x86_64 ppc)
license=custom
depends=('ruby-dbi>=0.4.1' 'ruby>=1.8.0' 'ruby-sqlite3')
url=http://rubyforge.org/projects/ruby-dbi
source=(http://rubyforge.org/frs/download.php/60205/dbd-sqlite3-${pkgver}.tar.gz)
md5sums=(2af3766bd696ed0899acb768da1d12fe)

build() { 
	cd ${srcdir}/dbd-sqlite3-${pkgver} &&
	ruby setup.rb config &&
  ruby setup.rb setup &&
  ruby setup.rb install --prefix=${pkgdir} || return 1
}
