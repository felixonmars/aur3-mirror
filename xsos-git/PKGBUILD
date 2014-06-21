# Maintainer: jokot3 <jokot3 at gmail dot com>
_pkgname=xsos
pkgname=xsos-git
pkgver=r168.1f96225
pkgrel=1
pkgdesc="Summarize system info from sosreports"
arch=('any')
url="https://github.com/ryran/xsos"
license=('GPL3')
depends=('bash>=4')
makedepends=('git')
conflicts=('xsos')
provides=('xsos')
options=()
source=("git+https://github.com/ryran/xsos.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${_pkgname}"
    install -Dm755 xsos "$pkgdir/usr/bin/xsos"
    install -Dm644 xsos-bash-completion.bash \
        "$pkgdir/usr/share/bash-completion/completions/xsos"
}

# vim:set ts=4 sw=4 et:
