# Maintainer: jokot3 <jokot3 at gmail dot com>
_pkgname=rsar
pkgname=rsar-git
pkgver=r168.1f96225
pkgrel=2
pkgdesc="Extract data from plain-text sar files"
arch=('any')
url="https://github.com/ryran/xsos"
license=('GPL3')
depends=('bash>=4')
makedepends=('git')
conflicts=('rsar')
provides=('rsar')
options=()
source=("git+https://github.com/ryran/xsos.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/xsos"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/xsos"
    install -Dm755 rsar "$pkgdir/usr/bin/rsar"
    install -Dm644 rsar-bash-completion.bash \
        "$pkgdir/usr/share/bash-completion/completions/rsar"
}

# vim:set ts=4 sw=4 et:
