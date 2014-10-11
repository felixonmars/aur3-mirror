# Maintainer: Chris Sivanich <csivanich at gmail dot com>

_gitname='connman-notify'
_gitroot='https://github.com/wavexx/'$_gitname'.git'

pkgname=connman-notify-git
pkgver=r4.0ed9b5e
pkgrel=1
pkgdesc='Desktop notification integration for connman'
arch=(any)
url='https://github.com/wavexx/connman-notify'
license=('GPLV2')
depends=('python2' 'python2-notify' 'python2-dbus')
makedepends=('git')
optdepends=('dunst: lightweight notification daemon')
provides=('connman-notify')
conflicts=('connman-notify')
source=("$pkgname::git+$_gitroot" "python2.patch" "LICENSE")
sha256sums=('SKIP' '47ba614b296c66c190270cf79413e8598e2a4f839476de9e7208aeb73e2b07bb' 'd8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388')

prepare() {
    cd "$srcdir/$pkgname"
    patch -p1 < "../python2.patch"
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 connman-notify "${pkgdir}"/usr/bin/connman-notify
    install -Dm644 README.rst "${pkgdir}"/usr/share/doc/$pkgname
    install -Dm644 ../LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
