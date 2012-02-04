# Contributor: Ivan Gasperoni <gaspe (at) libero (dot) it>
pkgname=freepops
pkgver=0.2.9
pkgrel=8
pkgdesc="A program to convert webmail interfaces to pop3"
arch=('i686' 'x86_64')
url="http://freepops.sourceforge.net/"
license=('GPL')
depends=('curl' 'expat' 'bison')
source=(http://downloads.sourceforge.net/sourceforge/freepops/${pkgname}-${pkgver}.tar.gz
	freepopsd)
md5sums=('4b93740f06b2ed7ea34c76889d141f4c'
         '5c83ddaeababceba6435aad47e92c48e')

build() {
	export MAKEFLAGS="-j1"
	cd ${startdir}/src/${pkgname}-${pkgver}

        if [ "$CARCH" == "x86_64" ]; then
	  # fix optimisations that break the build; Arch64 needs 'x86-64' and not 'x86_64' to build
	  sed -i -e "s/-g3 -march=i486/-march=x86-64/g" configure.sh
        else
	  sed -i -e "s/-g3 -march=i486/-march=${CARCH}/g" configure.sh	 
        fi	

	./configure.sh linux-slack
	make all || return 1
	make DESTDIR=${startdir}/pkg/ install
	install -D -m755 ${startdir}/src/freepopsd ${startdir}/pkg/etc/rc.d/freepopsd
}
