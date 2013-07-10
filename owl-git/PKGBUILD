# Maintainer: Bastien Dejean <baskerville@lavabit.com>

_pkgname=owl
pkgname=${_pkgname}-git
pkgver=163
pkgrel=2
pkgdesc='A pacman and cower wrapper focused on simplicity'
arch=('i686' 'x86_64' 'armv7f' 'armv6h')
url="https://github.com/baskerville/${_pkgname}"
license=('custom:BSD')
depends=('sudo' 'dash' 'cower' 'abs')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git://github.com/baskerville/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git rev-list --count HEAD
}

package() {
    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir"/{usr/bin,etc/bash_completion.d,usr/share/man/man8}
    cp owl owl_* "$pkgdir/usr/bin"
    cp bash_completion.d/* "$pkgdir/etc/bash_completion.d"
    cp owl.8 "$pkgdir/usr/share/man/man8"
}
