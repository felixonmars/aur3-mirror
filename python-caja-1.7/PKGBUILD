# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Piotr Gorski <sir_lucjan@openlinux.pl>

pkgname=python-caja-1.7
_pkgname=python-caja
pkgver=1.7.0
pkgrel=2
pkgdesc="Python binding for Caja, to allow Caja property page and menu item extensions to be written in Python."
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('caja' 'python2' 'python2-gobject')
makedepends=('mate-common')
options=('!emptydirs')
replaces=('python-caja')
provides=('python-caja')
source=("${pkgname}::git+https://github.com/mate-desktop/${_pkgname}.git")
sha1sums=('SKIP')

build() {
    cd "${srcdir}/${_pkgname}"
    PYTHON=/usr/bin/python2 ./autogen.sh \
        --prefix=/usr \
        --disable-static
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}" install
}

