
# Maintainer: Tau Tsao <realturner at gmail dot com>

pkgname=ion-3-styles-thinviolet
pkgver=0.1
pkgrel=2
arch=('any')
license=("GPL")
url="http://aur.archlinux.org/packages.php?ID=34740"
pkgdesc="modified Ion3 style without window border"
depends=('ion-3')
optdepends=(
   'wqy-bitmapfont: CJK bitmapfont'
)
source=(
    lookcommon_thin.lua
    look_thinviolet.lua
)

build() {
    mkdir -p "${pkgdir}"/etc/ion3
    cd       "${pkgdir}"/etc/ion3
    install -m644 "${srcdir}"/{lookcommon_thin,look_thinviolet}.lua . || return 1
}
md5sums=('d2980f9d4d4659eb8e2ddfc432aa5dd2'
         '2105e615e98ee5da78f731c0524f36cd')
