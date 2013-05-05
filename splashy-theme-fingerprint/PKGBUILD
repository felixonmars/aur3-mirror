# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Sausageandeggs <sausageandeggs@archlinux.us>

pkgname=splashy-theme-fingerprint
_pkgname=fingerprint
pkgver=1.0
pkgrel=1
pkgdesc="A splashy theme"
arch=(any)
url=http://splashy.alioth.debian.org/wiki/
license=(GPL)
depends=(splashy)
source=(http://dl.dropbox.com/u/3395784/aur/$pkgname/splashy-themes.tar.bz2
    pathfix.patch)
sha256sums=('597b3a7dd181cc30cc09a6f2063b95c8a24d4da136db649dc8be99313d61dcc0'
    '587bc038994422c4fbd3cc00f4d0814f77cefb02b4ae6a31e52c8662781be9f4')
sha512sums=('d09e33f987569a094f837eb4147161abc6ce0916727528235a7f6611d59cac487576e8ba784c1205fd099196b96d3904aa8745f64a9622c50b71a1ab4ca0fc8f'
    '7998b1197329beaaaac9fd37687ee69baabde4530d3cb11a527d9f006b6b3a242816cddd9d8958241b3168869fea4f24c7d826093b16bda4ed85505a6f831b9b')

prepare() {
    patch -p1 -i pathfix.patch # Fix broken paths and font size
}

package() {
    install -d "$pkgdir"/usr/share/splashy/themes/
    cp -r themes/$_pkgname "$pkgdir"/usr/share/splashy/themes/
}
