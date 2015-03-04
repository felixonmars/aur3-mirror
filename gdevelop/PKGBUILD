# Contributer: luisfcgm@gmail.com

pkgname=gdevelop
name=gdevelop
provides=('game-develop')
pkgver=3.6.78001
pkgrel=1
pkgdesc="a free game creation software, allowing to make games for the web ( HTML5 ) or for Windows and Linux.
No programming or coding skill is required!
It is easy to use and powerful enough for advanced users."
arch=('x86_64')
url="http://compilgames.net/"
license=('GPLv3' 'LGPLv3' 'zlib' 'libpng')
depends=()
#install="$name.install"
makedepends=('cgmanager' 'libpng12')

#if [ "${CARCH}" = 'x86_64' ]; then
    ARCH='amd64'
    md5sums=('d97b7faf8248cb3ea1c8652a3bf94c39')
#elif [ "${CARCH}" = 'i686' ]; then
    #ARCH='i386' 
    #md5sums=('MD5SUM_HERE')
#fi

source=("https://launchpadlibrarian.net/195770186/${name}_${pkgver}-1~trusty_${ARCH}.deb")


package() {
	cd ${srcdir}
	#ar -x ${srcdir}/src/dfm_${pkgver}-1~trusty_${ARCH}.deb
	
	tar -Jxvf ${srcdir}/data.tar.xz
	cp -r ${srcdir}/usr/ ${pkgdir}
	cp -r ${srcdir}/opt/ ${pkgdir}
}
