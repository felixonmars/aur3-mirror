# Maintainer: wido <widowild [at] myopera [dot] com>

pkgname=regnum-online-fr
pkgver=1
pkgrel=3
pkgdesc="Cross-platform 3D Massively Multiplayer Online Role-playing Game (MMORPG) for french"
arch=('i686' 'x86_64')
_arch=32
url="http://regnum.gamigo.fr/"
license=('custom:Regnum Online License Agreement')
depends=('gtk2' 'mesa' 'openal' 'libjpeg' 'libpng12' 'libvorbis' 'libtheora')
conflicts=('regnum-online')
makedepends=()
install=regnum-online.install
options=(!strip)
PKGEXT=".tar"
md5sums=('8d68ec83388ee185c9fb7c4cc9660246'
	 '611cbbc1fc19d420d319fae29ee7c581'
	 '51ac27deb5390ab360bbc8820f440325'
	 'c12f01458189445a2db477601f395f22'
	 '84ab2767f1815869d8b05ce1959dc1d6')

[ "$CARCH" = "x86_64" ] && md5sums[0]='b5b42d79b2899b4a4187701e10780d28'
[ "$CARCH" = "x86_64" ] && _arch=64
[ "$CARCH" = "x86_64" ] && makedepends=('lib32-glibc')

source=(http://client.cdn.gamigo.com/ro/fr/RegnumOnlineInstall_NT_L$_arch
	regnum-online.desktop
	regnum-online
	LICENSE
	regnum.png)

build() {
        cd "${srcdir}"
        mkdir -p reg-extract
        chmod +x RegnumOnlineInstall_NT_L$_arch
        ./RegnumOnlineInstall_NT_L$_arch --temp ${srcdir} --prefix "${srcdir}"/reg-extract --mode silent

}

package() {
    mkdir -p "${pkgdir}"/opt/regnum
    cd ${pkgdir}/opt/regnum
    mv -f "${srcdir}"/reg-extract/* .
    rm -rf */
    rm -rf uninstall
    find -type f -exec chmod 664 {} +
    chmod +x rolauncher
    chmod 775 "${pkgdir}"/opt/regnum
    chown -R root:games ${pkgdir}/opt/regnum
    install -Dm755 ${srcdir}/regnum-online ${pkgdir}/usr/bin/$pkgname
    install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 ${srcdir}/regnum-online.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -Dm644 ${srcdir}/regnum.png ${pkgdir}/usr/share/pixmaps/regnum.png
}
