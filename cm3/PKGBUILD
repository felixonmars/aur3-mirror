# Contributor: Kevin McCarthy <kwm@purdue.edu>
# Maintainer: Kevin McCarthy <kwm@purdue.edu>
pkgname=cm3
pkgver=5.5.0
pkgrel=1
pkgdesc="The Critical Mass Modula-3 Distribution"
url="http://modula3.elegosoft.com/cm3/"
depends=(flex bison postgresql-libs mesa unixodbc lesstif libx11 gcc binutils)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
install=('cm3.install')
source=(http://modula3.elegosoft.com/cm3/cm3-min-POSIX-LINUXLIBC6-d5.5.0.tgz)
md5sums=('fab73c59cd2130ba51b770e45f3635bb')
arch=('i686')
license=('custom:Critical Mass License Agreement')

build() {
	  mkdir -p $startdir/pkg/opt/cm3
	  mkdir -p $startdir/pkg/usr/share/licenses/$pkgname
	  cd $startdir/pkg/opt/cm3
	  tar xzf $startdir/src/system.tgz
	  cp $startdir/cm3.cfg $startdir/pkg/opt/cm3/bin/
	  cp $startdir/LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}

