# Maintainer: Andreas Krutzler <andreas.krutzler@gmx.net>

pkgname=kontrollerlab-git
_pkgname=kontrollerlab
pkgver=1.0.0_beta1
pkgrel=1
pkgdesc=" IDE for developing software for Atmel(r) AVR(c) microcontrollers." 
arch=("i686" "x86_64")
url="https://github.com/andik92/kontrollerlab"
depends=('kdebase-runtime' 'katepart4' 'qt4')
makedepends=('cmake' 'automoc4' 'git')
optdepends=("uisp: support for uisp"
                            "avrdude:  support for avrdude")
#groups=('kdebindings')
conflicts=('kontrollerlab')
#provides=('kontrollerlab')
source=(git://github.com/andik92/kontrollerlab.git)

license='GPL2' 
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
    cd $srcdir/$_pkgname/
    msg "Precompiling..."
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    msg "Compiling..."
    make
}

package() {
    msg "Packaging..."
    make -C "$srcdir/$_pkgname" DESTDIR="$pkgdir" install
}