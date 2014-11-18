# Maintainer: Hans-Harro Horn <h.h.horn@gmail.com>

pkgname=viewdown-git
_gitname=viewdown
pkgver=1.0.r0.g29de382
pkgrel=1
pkgdesc="Simple Markdown Viewer based on Qt5 and QtWebKit"
arch=('i686' 'x86_64')
url="https://github.com/Cornu/viewdown"
license=('MIT')
depends=('qt5-base' 'qtwebkit' 'hoedown-git')
makedepends=('git')
source=('git+https://github.com/cornu/viewdown.git')
md5sums=('SKIP')

pkgver() {
    cd "$_gitname"
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$_gitname"
    qmake
    make
}

package() {
    cd "$_gitname"
    install -D -m755 viewdown "${pkgdir}"/usr/bin/viewdown
}

# vim:set ts=2 sw=2 et:
