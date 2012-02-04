#Contributor:figo.zhang <figo1802@gmail.com>

pkgname=leqi
pkgver=1.0
pkgrel=1
pkgdesc="LeQi"
arch=('i686')
url="http://www.68989.com"
license=('custom')
makedepends=()
depends=()
conflicts=()
install=leqi.install
provides=('')

source=(http://www.68989.com/downloads/leqi1.0.deb)
md5sums=('c318bc21f3a2793815d686cb3e21b837')



build() {
	cd $startdir/src/
      ar -xv leqi1.0.deb;
      tar -xvf data.tar.gz

	mv usr/ ${startdir}/pkg/ ;

	}

