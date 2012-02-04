#Maintainer: andy123 <ajs @ online.de>

pkgname=teeworlds-catch16-server
pkgver=0.6
_name=teeworlds
_ver=0.6.0
_bamver=0.4.0
pkgrel=2
pkgdesc="A multiplayer 2D shooter's server mod"
arch=('i686' 'x86_64')
url="http://www.teeworlds.com/forum/viewtopic.php?id=4812"
license=('custom')
depends=('zlib')
makedepends=('mercurial' 'python2')
replaces=('teeworlds-srv-tcatch' 'teeworlds-srv-catch16')
source=(http://www.teeworlds.com/files/${_name}-${_ver}-src.tar.gz
        https://github.com/downloads/matricks/bam/bam-${_bamver}.tar.bz2
	rc.d)
sha1sums=('17464e17ea0a5c00573d6b994cccc40d9ab4d31f'
          '5dad113e38ba89384d842655eb477834285c216b'
          'a625a2181b58527f874fc07094f4ea832834a876')

build() {
        # Build bam (used to build teeworlds)
        cd ${srcdir}/bam-${_bamver}
        ./make_unix.sh

        # getting the source
	cd ${srcdir}
	if [ -d teeworlds${pkgver}_catch16 ]; then 
		cd teeworlds${pkgver}_catch16
		# is this right?
		hg update
	else hg clone https://bitbucket.org/guillaumeclaret/teeworlds${pkgver}_catch16
	fi	
	
	# "patching"
        cp -r ${srcdir}/${_name}${pkgver}_catch16/* ${srcdir}/${_name}-${_ver}-source/src/
	
	# compiling
	cd ${srcdir}/${_name}-${pkgver}.0-source/
	sed -i 's/python /python2 /' bam.lua
	../bam-${_bamver}/bam server_release
}

package() {
        #mkdir -p ${pkgdir}/usr/share/${_name}/data/maps
	#cp ${srcdir}/*.map ${pkgdir}/usr/share/${_name}/data/maps

        install -Dm755 ${srcdir}/${_name}-${_ver}-source/${_name}_srv ${pkgdir}/usr/bin/${pkgname}
        install -Dm644 ${srcdir}/${_name}-${_ver}-source/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
	install -Dm755 ${srcdir}/rc.d ${pkgdir}/etc/rc.d/${pkgname}
}
