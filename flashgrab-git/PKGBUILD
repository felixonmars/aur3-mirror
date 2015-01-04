pkgname=flashgrab-git
pkgver=r15.733893b
pkgrel=1

pkgdesc='disable dpms if flashplugin or pipelight/silverlight is fullscreen.'
url='https://github.com/gulafaran/flashgrab'
arch=('i686' 'x86_64')
license=('beerware')

depends=('libx11' 'xproto' 'glibc')
makedepends=('git' 'make' 'clang')

provides=('flashgrab')
conflicts=('flashgrab')

source=('git://github.com/gulafaran/flashgrab.git')
md5sums=('SKIP')

options=("!buildflags")
export LDFLAGS="${LDFLAGS} -lX11 -L/usr/X11/lib -L/usr/X11R6/lib"

pkgver() {
    cd "flashgrab" 
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
}

build() {
    cd "flashgrab"
    cmake -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "flashgrab" 
    make DESTDIR="$pkgdir" install
}
