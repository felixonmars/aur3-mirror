#Maintainer: andy123 <ajs @ online.de>

pkgname=teeworlds-srv-catch16
pkgver=0.6
_ver=0.6.0
_name=teeworlds
_bamver=0.4.0
pkgrel=1
pkgdesc="A multiplayer 2D shooter's server mod"
arch=('i686' 'x86_64')
url="http://teeworlds.com"
license=('custom')
depends=('zlib')
makedepends=('mercurial' 'python2')
replaces=('teeworlds-srv-tcatch')
source=(http://www.teeworlds.com/files/${_name}-${_ver}-src.tar.gz
        https://github.com/downloads/matricks/bam/bam-${_bamver}.tar.bz2
#	http://download.tee-page.de/modifications/catching/2_0/junglecatch.map
#	http://download.tee-page.de/modifications/catching/3_1/grasscatch.map
#	http://download.tee-page.de/modifications/catching/2_0/dm1_catch.map
	${pkgname})

md5sums=('4d6e5d0fb1b5f0bdf6c5c49714045ef1'
         'f8b62ad553c3615a725a034df4fb4257'
#         '8ede709add8b6d60725cd60901a89651'
#         '004a7d6caf8b798874525400b37a9b05'
#         '2fc2f04329ba0905963e5319f255f7a1'
	 '0f60a8fa3faa36053e1663e3d8b3c28e')

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
        cp -r ${srcdir}/teeworlds0.6_catch16/* ${srcdir}/${_name}-${_ver}-source/src/
	
	# compiling
	cd ${srcdir}/${_name}-${pkgver}.0-source/
	sed -i 's/python /python2 /' bam.lua
	../bam-${_bamver}/bam server_release
}

package() {
        mkdir -p ${pkgdir}/usr/share/${_name}/data/maps
	cp ${srcdir}/*.map ${pkgdir}/usr/share/${_name}/data/maps

        install -Dm755 ${srcdir}/${_name}-${_ver}-source/${_name}_srv ${pkgdir}/usr/bin/${pkgname}
        install -Dm644 ${srcdir}/${_name}-${_ver}-source/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
	install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/etc/rc.d/${pkgname}
}
