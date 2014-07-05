# Contributer: tesfabpel@gmail.com

pkgname=game-develop-deb
name=game-develop
provides=('game-develop')
pkgver=3.3.71
pkgrel=2
pkgdesc="a free game creation software, allowing to make games for the web ( HTML5 ) or for Windows and Linux.
No programming or coding skill is required!
It is easy to use and powerful enough for advanced users."
arch=('x86_64')
url="http://compilgames.net/"
license=('GPLv3' 'LGPLv3' 'zlib' 'libpng')
depends=()
#install="$name.install"
#makedepends=('')

#if [ "${CARCH}" = 'x86_64' ]; then
    ARCH='amd64'
    md5sums=('53ad51a909980f2a7d761773f8ff28aa')
#elif [ "${CARCH}" = 'i686' ]; then
    #ARCH='i386' 
    #md5sums=('MD5SUM_HERE')
#fi

source=("http://compilgames.net/dl/${name}_${pkgver}_${ARCH}.deb")


package() {
	cd ${srcdir}
	#ar -x ${srcdir}/src/dfm_${pkgver}_${ARCH}.deb
	
	tar -zxf ${srcdir}/data.tar.gz
	cp -r ${srcdir}/usr/ ${pkgdir}
	cp -r ${srcdir}/opt/ ${pkgdir}
}
