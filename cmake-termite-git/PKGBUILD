pkgname=cmake-termite-git
pkgver=v3.0.1.r1620.gebd8fa2
pkgrel=2
pkgdesc="CMake with colors enabled for the termite TE"
arch=('i686' 'x86_64')
makedepends=('git' 'automake' 'make' 'gcc')
conflicts=('cmake')
url="https://github.com/Kitware/CMake"
license=('BSD')
source=("$pkgname"::'git+https://github.com/Kitware/CMake.git'
        'termite.patch')
md5sums=('SKIP'
         'SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    patch -p0 < "$srcdir/termite.patch"
    ./configure --prefix=/usr
}

build() {
    cd "$pkgname"
    make DESTDIR="$pkgdir"
}

package() {
    cd "$pkgname"

    lpath="$pkgdir/usr/share/licenses/cmake"

    make DESTDIR="$pkgdir" install
    install -Dm644 "Copyright.txt" "$lpath/LICENSE"
}

