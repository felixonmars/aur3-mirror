# Maintainer icasdri <icasdri at gmail dot com>

_pkgname=mpris2controller-python
pkgname=mpris2controller-python-git
pkgver=0.3
pkgrel=1
pkgdesc="A small daemon that intelligently controls MPRIS2 compatible players"
arch=(any)
url="https://github.com/icasdri/mpris2controller-python"
license=('GPL3')
depends=('python' 'python-dbus' 'python-gobject')
makedepends=('git')
provides=('mpris2controller')
source=("git+https://github.com/icasdri/mpris2controller-python.git")
sha256sums=('SKIP')

pkgver() {
   cd "$srcdir/$_pkgname"
   git describe | sed 's/^v//;s/-/./g'
}

prepare() {
    cd "$srcdir/$_pkgname"
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -D -m755 "$srcdir/$_pkgname/mpris2controller" "$pkgdir/usr/bin/mpris2controller"
}