# Maintainer: Tim Cooper <tim.cooper@layeh.com>

pkgname=xwatch-git
_gitname=xwatch
pkgver=0.0.0
pkgrel=1
pkgdesc="logs when X windows become active (in CSV format)"
arch=('any')
url="https://github.com/techietim/xwatch"
license=('MIT')
depends=('bash' 'xorg-xprop')
source=('git+https://github.com/techietim/xwatch.git')
md5sums=('SKIP')

pkgver() {
    cd $_gitname
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    true
}

package() {
    cd $_gitname
    install -Dm755 "xwatch.sh" "$pkgdir/usr/bin/xwatch"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/xwatch-git/LICENSE"
}
