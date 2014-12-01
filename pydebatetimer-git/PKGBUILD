# Maintainer icasdri <icasdri at gmail dot com>

_pkgname=pydebatetimer
pkgname=pydebatetimer-git
pkgver=0.1
pkgrel=1
pkgdesc="A small GTK app for timing PF debate rounds"
arch=(any)
url="https://github.com/icasdri/pydebatetimer"
license=('GPL3')
depends=('python' 'python-dbus' 'python-gobject' 'gtk3')
makedepends=('git')
source=("git+https://github.com/icasdri/pydebatetimer.git")
sha256sums=('SKIP')

pkgver() {
   cd "${srcdir}/${_pkgname}"
   git describe | sed 's/^v//;s/-/./g'
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}/"
}