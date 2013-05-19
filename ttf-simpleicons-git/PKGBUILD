# Maintainer: Bastien Dejean <baskerville@lavabit.com>
# Contributor: Cippaciong  <lacapannadelloziotom [at] gmail [dot] com>

_pkgname=SimpleIcons
pkgname=ttf-simpleicons-git
pkgver=16
pkgrel=1
pkgdesc='Simple scalable grid based icon set'
arch=('i686' 'x86_64')
url="https://github.com/baskerville/${_pkgname}"
license=('custom:CC BY-SA')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
makedepends=('git')
provides=('ttf-simpleicons')
conflicts=('ttf-simpleicons')
source=("git://github.com/baskerville/${_pkgname}.git")
md5sums=('SKIP')
install='install'

pkgver() {
    cd "$srcdir/$_pkgname"
    git rev-list --count HEAD
}

package() {
    cd "$srcdir/$_pkgname"
    install -D -m644 "TTF/${_pkgname}.ttf" "${pkgdir}/usr/share/fonts/TTF/${_pkgname}.ttf"
}
