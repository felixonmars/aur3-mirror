# Maintainer: Jari Vetoniemi <mailroxas _at_ gmail _dot_ com>
# dmenu with pango and imlib support

_gitname=dmenu-pango-imlib
pkgname=dmenu-pango-imlib-git
pkgver=4.5.3.6.g06f871e
pkgrel=1
pkgdesc="Dynamic X menu - with pango and imlib support"
url="https://github.com/Cloudef/dmenu-pango-imlib"
arch=('i686' 'x86_64')
license=('MIT')
depends=('sh' 'libxinerama' 'libxft' 'pango' 'imlib2')
conflicts=('dmenu' 'dmenu-xft')
provides=('dmenu' 'dmenu-pango-imlib')
source=(git://github.com/Cloudef/dmenu-pango-imlib)
md5sums=(SKIP)

pkgver() { cd "$_gitname" && git describe | sed 's/^v//; s/-/./g'; }

build() {
    cd "$_gitname"
    make
}

package() {
    cd "$_gitname"
    make DESTDIR=$pkgdir PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=8 sw=4 tw=0 :
