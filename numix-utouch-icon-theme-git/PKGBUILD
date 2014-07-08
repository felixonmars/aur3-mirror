
# Maintainer: grindcore <gruberjonathan at gmail dot dom>

pkgname=numix-utouch-icon-theme-git
pkgver=0.r10.90da3d9
pkgrel=1
pkgdesc="uTouch icon theme from the Numix project"
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
depends=('numix-icon-theme-git')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
options=('!strip')
install="${pkgname%-*}.install"
source=("${pkgname%-*}::git+https://github.com/numixproject/numix-icon-theme-utouch.git")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname%-*}
    printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${pkgname%-*}

    install -dm 755 "$pkgdir"/usr/share/icons
    cp -dr --no-preserve='ownership' Numix-uTouch "$pkgdir"/usr/share/icons/
}