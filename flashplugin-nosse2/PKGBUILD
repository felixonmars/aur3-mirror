# Maintainer : DUCRETTET Philippe <ecolinux@gmx.fr>

pkgname=flashplugin-nosse2
name=flashplugin
_licensefile='PlatformClients_PC_WWEULA_Combined_20100108_1657.pdf'
pkgver=11.1.102.63
pkgrel=1
pkgdesc='Adobe Flash Player for no sse2 processor'
url='http://get.adobe.com/flashplayer'
arch=('i686' 'x86_64')
depends=('mozilla-common' 'libxt' 'gtk2' 'nss' 'curl' 'hicolor-icon-theme')
optdepends=('libvdpau: GPU acceleration on Nvidia card')
provides=('flashplayer' 'flashplugin-10' 'flashplugin-10.1' 'flashplugin-beta' 'flashplugin-debugger'
	  'flashplugin-sse2-nosse2' 'flashplugin-square' 'flashplugin_src' 'lib32-flashplugin10')
conflicts=('flashplayer' 'flashplugin-10' 'flashplugin-10.1' 'flashplugin-beta' 'flashplugin-debugger'
	  'flashplugin-sse2-nosse2' 'flashplugin-square' 'flashplugin_src' 'lib32-flashplugin10')
license=('custom')
options=(!strip)
install=flashplugin.install
backup=(etc/adobe/mms.cfg)

source=("http://fpdownload.macromedia.com/get/flashplayer/installers/archive/fp_11.1.102.63_archive.zip"
        "http://www.adobe.com/products/eulas/pdfs/${_licensefile}"
        mms.cfg)

package () {
if [ "$CARCH" = x86_64 ]; then
	bits=64 ; arch=$CARCH
else
	bits=32 ; arch=i386
fi

    mv ${srcdir}/fp_11.1.102.63_archive/11_1r102_63_${bits}bit/flashplayer11_1r102_63_linux.${arch}.tar.gz \
${srcdir}/flashplayer11_1r102_63_linux.${arch}.tar.gz
    rm -r ${srcdir}/fp_11.1.102.63_archive
    tar zxvf flashplayer11_1r102_63_linux.${arch}.tar.gz
    install -Dm755 libflashplayer.so "${pkgdir}/usr/lib/mozilla/plugins/libflashplayer.so"

if [ "$CARCH" = x86_64 ]; then
        install -Dm755 usr/lib64/kde4/kcm_adobe_flash_player.so "${pkgdir}/usr/lib/kde4/kcm_adobe_flash_player.so"
else
        install -Dm755 usr/lib/kde4/kcm_adobe_flash_player.so "${pkgdir}/usr/lib/kde4/kcm_adobe_flash_player.so"
fi

    install -Dm755 usr/bin/flash-player-properties "${pkgdir}/usr/bin/flash-player-properties"

    for i in 16x16 22x22 24x24 32x32 48x48; do
        install -Dm644 usr/share/icons/hicolor/${i}/apps/flash-player-properties.png \
            "${pkgdir}/usr/share/icons/hicolor/${i}/apps/flash-player-properties.png"
    done

    install -Dm644 usr/share/applications/flash-player-properties.desktop "${pkgdir}/usr/share/applications/flash-player-properties.desktop"
    install -Dm644 usr/share/kde4/services/kcm_adobe_flash_player.desktop "${pkgdir}/usr/share/kde4/services/kcm_adobe_flash_player.desktop"
cd ${srcdir}
    install -Dm644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.pdf"
    install -Dm644 ${srcdir}/mms.cfg "${pkgdir}/etc/adobe/mms.cfg"
}
md5sums=('1c43121e55c0d5774b2978323ceb64b7'
         '94ca2aecb409abfe36494d1a7ec7591d'
         'f34aae6279b40e0bd2abfb0d9963d7b8')
