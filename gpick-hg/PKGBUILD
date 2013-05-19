_pkgname=gpick
pkgname=${_pkgname}-hg
pkgver=270
pkgrel=1
pkgdesc='An advanced color picker'
arch=('i686' 'x86_64')
url="http://${_pkgname}.googlecode.com/"
license=('custom:BSD')
depends=('lemon' 'flex' 'gtk2' 'lua' 'hicolor-icon-theme')
makedepends=('boost' 'scons' 'mercurial')
optdepends=('dbus-glib' 'libunique')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install='gpick.install'
source=("hg+https://code.google.com/p/${_pkgname}" 'gpick.desktop' 'LICENSE')
md5sums=('SKIP'
         '9bcf9591e2ff77dc34db093410aadb00'
         '8d148bfa61e38ba91b3a832dbb378320')

pkgver() {
    cd "$srcdir/$_pkgname"
    hg identify -n
}

build() {
    cd "$srcdir/$_pkgname"
    scons
}

package() {
    cd "$srcdir/$_pkgname"
    scons DESTDIR="$pkgdir/usr" install
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/gpick.desktop" "$pkgdir/usr/share/applications/gpick.desktop"
}
