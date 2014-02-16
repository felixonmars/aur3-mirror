# Maintainer: Bastien Dejean <nihilhill@gmail.com>
# Contributor: flu

_pkgname=shkd
pkgname=${_pkgname}-git
pkgver=20
pkgrel=1
pkgdesc='A simple hotkey daemon'
arch=('i686' 'x86_64')
url="https://github.com/baskerville/${_pkgname}"
license=('custom:BSD')
makedepends=('git' 'linux-api-headers')
backup=('etc/shkdrc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git://github.com/baskerville/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git rev-list --count HEAD
}

build() {
    cd "$_pkgname"
    make PREFIX=/usr
}

package() {
    cd "$_pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
