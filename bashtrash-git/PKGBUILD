# Maintainer: Giorgio Gilestro <giorgio@gilest.ro>
# Fork Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=bashtrash-git
pkgver=26.f19c6dc
pkgrel=2
pkgdesc="Freedesktop-compliant trashcan implemented in bash script"
arch=(any)
url=https://github.com/robrwo/bashtrash/blob/master/trash
license=(GPL3)
makedepends=(git)
provides=(${pkgname%-*})
conflicts=(${pkgname%-*})
source=(git://github.com/robrwo/${pkgname%-*}.git)
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    cd ${pkgname%-*}/
    echo $(git shortlog | grep -c '\s\+').$(git describe --always)
}

package() {
    install -Dm755 ${pkgname%-*}/trash "$pkgdir"/usr/bin/trash
}
