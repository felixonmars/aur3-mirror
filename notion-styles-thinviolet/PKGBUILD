
# Maintainer: Tau Tsao <realturner at gmail dot com>

pkgname=notion-styles-thinviolet
pkgver=0.1
pkgrel=1
arch=('any')
license=("GPL")
url="https://aur.archlinux.org/packages.php?ID=51886"
pkgdesc="modified Notion style without window border"
depends=('notion')
optdepends=('wqy-bitmapfont: CJK bitmapfont')
source=(lookcommon_thin.lua look_thinviolet.lua)
md5sums=('d2980f9d4d4659eb8e2ddfc432aa5dd2'
         '2105e615e98ee5da78f731c0524f36cd')

package() {
    mkdir -p "${pkgdir}"/etc/notion
    install -m644 "${srcdir}"/{lookcommon_thin,look_thinviolet}.lua "${pkgdir}"/etc/notion
}
