# Maintainer: Yang Hamo Bai <hamo.by@gmail.com>

pkgname=chromeplus
pkgver=1.3.3.3
_chromiumver=5.0.342.9
pkgrel=1
pkgdesc="a web browser based on Chromium"
arch=('i686' 'x86_64')
url="http://www.chromeplus.org/"
license=('unknown')
groups=()
depends=('nss' 'gconf' 'alsa-lib' 'xdg-utils' 'hicolor-icon-theme' 'bzip2' 'libxslt'
         'libxss' 'libjpeg6' 'libpng12' 'cairo')
makedepends=()
provides=('chromium=${_chromiumver}')
conflicts=('iron')
replaces=()
backup=()
install=chromeplus.install
_architect='i686'
[ "$CARCH" = "x86_64" ] && _architect='x86_64'
source=("http://www.chromeplus.org/update/${pkgname}-${pkgver}_suse_fedora_${_architect}.tar.gz"
        "chromeplus.desktop"
)
md5sums=('57d4ce631704d96d2080ee7ace48fa24'
         '363b6cb5377e251d6f92ba963bd11a7b'
)
[ "$CARCH" = "x86_64" ] && md5sums[0]='373a9df1c163550f638575bc97aafe3c'
noextract=()

build() {
    cd "$srcdir"
    rm -f ${pkgname}-${pkgver}_suse_fedora_${_architect}.tar.gz
    rm -f chromeplus_update_bin
}

package() {
    cd "${srcdir}"
    install -m 0755 -D ${srcdir}/chrome \
    ${pkgdir}/opt/ChromePlus/chromeplus

    install -m 0644 -D ${srcdir}/chrome.pak \
    ${pkgdir}/opt/ChromePlus/chrome.pak

    install -m 0755 -D ${srcdir}/libffmpegsumo.so \
    ${pkgdir}/opt/ChromePlus/libffmpegsumo.so

    install -m 0644 -D ${srcdir}/product_logo_48.png \
    ${pkgdir}/opt/ChromePlus/chromeplus.png

    install -m 0644 -D ${srcdir}/chromeplus.desktop \
    ${pkgdir}/opt/ChromePlus/chromeplus.desktop

    cp -a ${srcdir}/resources \
    ${pkgdir}/opt/ChromePlus/

    cp -a ${srcdir}/locales \
    ${pkgdir}/opt/ChromePlus/

    mkdir -p \
    ${pkgdir}/usr/bin \
    ${pkgdir}/usr/share/applications \
    ${pkgdir}/usr/share/pixmaps   || return 1

    ln -s /opt/ChromePlus/chromeplus ${pkgdir}/usr/bin/chromeplus

    ln -s /opt/ChromePlus/chromeplus.png ${pkgdir}/usr/share/pixmaps/ChromePlus.png
    ln -s /opt/ChromePlus/chromeplus.desktop ${pkgdir}/usr/share/applications/ChromePlus.desktop

}
