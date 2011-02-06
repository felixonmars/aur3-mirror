#Maintainer: andy123 <ajs @ online.de>

pkgname=teeworlds-catching-server
pkgver=1.3.1
_bamver=0.2.0
_name=teeworlds
_ver=0.5.2
pkgrel=1
pkgdesc="A multiplayer 2D shooter's server mod"
arch=('i686' 'x86_64')
url="http://teeworlds.com"
license=('custom')
depends=('zlib')
makedepends=('patch')
replaces=('teewars')
source=(http://www.teeworlds.com/files/${_name}-${_ver}-src.tar.gz
        http://www.teeworlds.com/files/bam-${_bamver}.tar.gz
        http://download.tee-page.de/modifications/catching/3_1/source.zip
	fix_datadir_search.patch
	lightcatch.map)

md5sums=('f605f6df9f1714dcda4cba1d281cc757'
         'd4efe74591a73c1cec8b34d76ffd1049'
	 '96c908a77893a21e55dc5f493e9095f7'
	 '673791ecb74274346456f0fae53b4428'
	 '5d8166d7d96ddc30690db6e1df49143e')

build() {
        # Build bam (used to build teeworlds)
        cd ${srcdir}/bam-${_bamver} || return 1
        ./make_unix.sh || return 1

        # Build teeworlds-catch-server
	cd ${srcdir}/${_name}-${_ver}-src/
        cp -R ${srcdir}/src ${srcdir}/${_name}-${_ver}-src/ || return 1
	patch -p1 -i ../fix_datadir_search.patch || return 1
	../bam-${_bamver}/src/bam server_release || return 1
}

package() {
        mkdir -p ${pkgdir}/usr/share/${_name}/data/maps || return 1
	#cp -R ${srcdir}/${_name}-${_ver}-src/data ${pkgdir}/usr/share/${pkgname} || return 1
        cd ${pkgdir}/usr/share/${_name}/data/maps || return 1
	wget http://download.tee-page.de/modifications/catching/2_0/junglecatch.map http://download.tee-page.de/modifications/catching/3_1/grasscatch.map http://download.tee-page.de/modifications/catching/2_0/dm1_catch.map

        install -Dm755 ${srcdir}/${_name}-${_ver}-src/${_name}_srv ${pkgdir}/usr/bin/${pkgname} || return 1
        install -Dm644 ${srcdir}/${_name}-${_ver}-src/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt || return 1
        #install -Dm644 ${srcdir}/autoexec.cfg ${pkgdir}/usr/share/${_name}/data/autoexec.cfg || return 1
}
