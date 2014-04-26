# Maintainer: Fabio Melo Pfeifer <fmpfeifer@gmail.com>

pkgname=liblightgrep-git
pkgver=v1.2.1.r84.g82df668
pkgrel=1
pkgdesc="A true multi-pattern search engine"
arch=('x86_64')
url="http://www.lightboxtechnologies.com/lightgrep-engine/"
license=('GPL')
depends=('boost' 'icu')

source=('git+https://github.com/LightboxTech/liblightgrep.git')
md5sums=('SKIP')
provides=('liblightgrep')
conflicts=('liblightgrep')
_gitname=liblightgrep

pkgver() {
    cd $srcdir/$_gitname
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd $srcdir/$_gitname
    autoreconf -fi
    ./configure --prefix=/usr
    make
}

package() {
    cd $srcdir/$_gitname
    make DESTDIR=$pkgdir install
}
