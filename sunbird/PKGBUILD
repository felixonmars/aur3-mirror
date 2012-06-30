# Maintainer: Nathan Williams <nathan at nathanewilliams dot com>
pkgname=sunbird
pkgver=1.0b1
pkgrel=2
pkgdesc="Mozilla standalone calendar application"
arch=('i686' 'x86_64')
url="https://www.mozilla.org/projects/calendar/sunbird/"
license=('MPL' 'GPL' 'LGPL')
depends=('gtk2' 'mozilla-common' 'libidl2' 'nss' 'libxt')
provides=('sunbird')
conflicts=('sunbird')
install=$pkgname.install
changelog=$pkgname.changelog
source=(https://ftp.mozilla.org/pub/mozilla.org/calendar/${pkgname}/releases/${pkgver}/linux-${CARCH}/en-US/${pkgname}-${pkgver}.tar.bz2
        $pkgname.desktop)
case $CARCH in
    i686)
        md5sums=(5a262b095cb0bce85f42183ae76b06ff
                 9372cec706b0a321c3d75d2cbc4788aa) ;;
    x86_64)
        md5sums=(39da36d2500c4b19972c31f492fa5c47
                 9372cec706b0a321c3d75d2cbc4788aa) ;;
esac

build() {
    local _instpath="/usr/share"
    mkdir -p "$pkgdir/$_instpath/applications"
    install -m644 "$pkgname.desktop" "$pkgdir/$_instpath/applications/"
    cd $srcdir
    find "$pkgname" -type d -exec install -d "{}" "$pkgdir/$_instpath/{}" \;
    find "$pkgname" -type f -exec install "{}" "$pkgdir/$_instpath/{}" \;
}
