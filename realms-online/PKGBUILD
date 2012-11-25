# Maintainer: Cody "Mister Bubbles" Baxter <codybaxter at gmail.com>
# Contributor: Vasco Nunes <vascomfnunes at gmail.com> and Frikilinux <frikilinux at frikilinux.com.ar>

pkgname=realms-online
pkgver=1.9.6
pkgrel=3
pkgdesc="Cross-platform 3D Massively Multiplayer Online Role-playing Game (MMORPG), North American version of Regnum Online"
arch=(i686 x86_64)
_arch=32
url="http://realmsonline.gamesamba.com/index.php"
license=('custom:Realms Online License Agreement')
depends=('gtk2' 'mesa' 'openal' 'libjpeg' 'libpng12' 'libvorbis' 'libtheora')
makedepends=()
install=realms-online.install
options=(!strip)

md5sums=('d370d2ae00dc8c577574f6cfbd6072f4'
    	 'cc969a60e9791ee1d05bb678cf6f929b'
	 'c357225b7f9c7e3b24b2e17e216f7acb'
	 'c12f01458189445a2db477601f395f22'
	 '84ab2767f1815869d8b05ce1959dc1d6')

[ "$CARCH" = "x86_64" ] && md5sums[0]='d370d2ae00dc8c577574f6cfbd6072f4'
[ "$CARCH" = "x86_64" ] && _arch=64
[ "$CARCH" = "x86_64" ] && makedepends=('lib32-glibc')

# For gzip compression
PKGEXT='.pkg.tar.gz'

source=(http://downloads.gamesamba.com//ROInstall_gsb_$_arch.zip
	realms-online.desktop
	realms-online
	LICENSE
	realms.png)

build() {
        cd "${srcdir}"
        mkdir -p reg-extract
        chmod +x ROInstall_gsb_${_arch}
        ./ROInstall_gsb_${_arch} --temp ${srcdir} --prefix "${srcdir}"/reg-extract --mode silent
}
package() {
        mkdir -p "${pkgdir}"/opt/realmsonline
        cd "${pkgdir}"/opt/realmsonline
        mv -f "${srcdir}"/reg-extract/* .
        rm -rf */
        rm -rf {uninstall,RealmsOnline.exe}
        find -type f -exec chmod 664 {} +
        chmod +x rolauncher
        chmod 775 "${pkgdir}"/opt/realmsonline
        chown -R root:games "${pkgdir}"/opt/realmsonline
        install -Dm755 "${srcdir}"/realms-online "${pkgdir}"/usr/bin/$pkgname
        install -Dm644 "${srcdir}"/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
        install -Dm644 "${srcdir}"/realms-online.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
        install -Dm644 "${srcdir}"/realms.png "${pkgdir}"/usr/share/pixmaps/realms.png
}
