# Maintainer: Mark Harrison <mark@mivok.net>
_pkgname=nad
pkgname=$_pkgname-git
pkgver=124.49e3f41
pkgrel=1
epoch=
pkgdesc="A very thin, simply managed host agent written in Node.js"
arch=('i686' 'x86_64')
url="https://github.com/circonus-labs/nad"
license=('BSD')
depends=('nodejs')
makedepends=('git' 'rsync')
install=
changelog=
source=(
    "$_pkgname::git+https://github.com/circonus-labs/$_pkgname.git"
    "Makefile.diff"
    "nad.service"
)
md5sums=('SKIP'
         '58411998206913e720e8a598d99b0078'
         '073d20c7602479acdada8def79d8a54a')

pkgver() {
    cd "$srcdir/$_pkgname" 
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "$srcdir/$_pkgname"
    patch -Np0 < $srcdir/Makefile.diff
    make
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 $srcdir/nad.service $pkgdir/etc/systemd/system/nad.service
    make DESTDIR="$pkgdir/" install
    make DESTDIR="$pkgdir/" install-linux
}
