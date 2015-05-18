# Maintainer: Andres Perez <andres.f.perez@gmail.com>

pkgname=snotify-git
_pkgname=snotify
epoch=1
pkgver=20150517.64ef2bb
pkgrel=1
pkgdesc='Simple notification framework'
url='http://github.com/HokieGeek/snotify'
arch=('i686' 'x86_64')
license=('MIT')
source=('git://github.com/HokieGeek/snotify.git')
sha1sums=('SKIP')

makedepends=('go')
optdepends=('conky: Used by the low battery notifier'
            'dzen2: Used by all of the notifiers, but not required if you write your own'
            'terminus-font: Used by all of the notifiers as the default font given to dzen2'
            'transset-df: Used by all the notifiers to give them transparency')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
    cd "${srcdir}/${_pkgname}"
    git submodule update --init
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}" install
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
