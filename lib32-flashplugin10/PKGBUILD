# Maintainer: jtts
# Contributor: Pablo Olmos de Aguilera C. <pablo at glatelier dot org>

pkgname=lib32-flashplugin10
_filename="fp_10.3.183.90_archive"
_licensefile='Reader_Player_AIR_WWEULA-Combined-20080204_1313.pdf'
_pkgverdir=10_3_r183_90
_pkgverfile=10_3r183_90
pkgver=10.3.183.90
pkgrel=1
pkgdesc='Adobe Flash Player v10 (32-bit) - multilib version for x86_64 with working HW accelerated scaling'
url='http://kb2.adobe.com/cps/142/tn_14266.html'
arch=('x86_64')
makedepends=('unzip')
depends=('mozilla-common' 'lib32-libxt' 'lib32-gtk2' 'lib32-nss' 'lib32-curl' 'lib32-alsa-plugins' 'nspluginwrapper' 'hicolor-icon-theme')
provides=('flashplayer' 'flashplugin')
conflicts=('flashplayer' 'flashplugin')
optdepends=('lib32-libvdpau: GPU acceleration on Nvidia card')
license=('custom')
install=flashplugin.install
backup=(etc/adobe/mms.cfg)
source=("http://download.macromedia.com/pub/flashplayer/installers/archive/$_filename.zip"
        "http://www.adobe.com/products/eulas/pdfs/$_licensefile"
        mms.cfg)
noextract=("$_filename.zip")
sha256sums=('28ad25861caecfb4e48600c900f0a8808f866eb2abddbb3053913a8bc7abdbbc'
            '80472d96f0b9835e399987849b632c23bd8b20406c7d3fe2313f8cf00e22837e'
            '01ef437cf63514bda52538502e3fda3d82423bc456cc88de7435166998f1d197')
options=(!strip)

package() {
    cd ${srcdir}
    unzip $_filename -x "fp_${pkgver}_archive/${_pkgverdir}_debug/*" \
					"fp_${pkgver}_archive/${_pkgverdir}/flashplayer_${_pkgverfile}_mac*" \
					"fp_${pkgver}_archive/${_pkgverdir}/flashplayer_${_pkgverfile}_win*" \
					"fp_${pkgver}_archive/${_pkgverdir}/uninstall*" \
					"fp_${pkgver}_archive/${_pkgverdir}/flashplayer_${_pkgverfile}_linux_sa*"
    tar -xnf "fp_${pkgver}_archive/${_pkgverdir}/flashplayer_${_pkgverfile}_linux.tar.gz"
    install -Dm755 libflashplayer.so "$pkgdir/usr/lib32/mozilla/plugins/libflashplayer.so"
    install -Dm755 usr/bin/flash-player-properties "$pkgdir/usr/bin/flash-player-properties"
    for i in 16x16 22x22 24x24 32x32 48x48; do
        install -Dm644 usr/share/icons/hicolor/$i/apps/flash-player-properties.png \
            "$pkgdir/usr/share/icons/hicolor/$i/apps/flash-player-properties.png"
    done
    install -Dm644 usr/share/applications/flash-player-properties.desktop "$pkgdir/usr/share/applications/flash-player-properties.desktop"
    install -Dm644 "$_licensefile" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.pdf"
    install -Dm644 $srcdir/mms.cfg "$pkgdir/etc/adobe/mms.cfg"
    # Install npwrapper:
    mkdir -p "$pkgdir"/usr/lib/mozilla/plugins/
    touch "$pkgdir"/usr/lib/mozilla/plugins/npwrapper.libflashplayer.so
    chmod 755 "$pkgdir"/usr/lib/mozilla/plugins/npwrapper.libflashplayer.so
}