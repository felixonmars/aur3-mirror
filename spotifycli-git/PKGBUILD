pkgname=spotifycli-git
pkgver=r6.51bf9e6
pkgrel=1

pkgdesc='small tool to control spotify through dbus.'
url='https://github.com/gulafaran/spotifycli'
arch=('i686' 'x86_64')
license=('beerware')

depends=('glib2')
makedepends=('git' 'make' 'clang')

provides=('spotifycli')
conflicts=('spotifycli')

source=('git://github.com/gulafaran/spotifycli.git')

md5sums=('SKIP')


pkgver() {
    cd "spotifycli" 
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
}

build() {
    cd "spotifycli"
    make
}

package() {
    cd "spotifycli" 
    install -Dm775 "spotifycli" "$pkgdir/usr/bin/spotifycli"
}
