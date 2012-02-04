pkgname=polyvox-git
pkgver=1440
pkgrel=1
pkgdesc="Polyvox is a library for storing, manipulating, and displaying
volumetric representations of objects"
arch=('i686' 'x86_64')
url="http://www.thermite3d.org"
license=('zlib')
makedepends=('git' 'cmake')
provides=(polyvox)
conflicts=(polyvox)

gittrunk=git://gitorious.org/polyvox/polyvox
gitmod=PolyVox

build() {
    cd "$srcdir"
    git clone $gittrunk $gitmod
    
    msg "Git cloning done or server timeout"
    msg "Starting make..."

    rm -rf "$srcdir/$gitmod-build"
    cp -r "$srcdir/$gitmod" "$srcdir/$gitmod-build"
    cd "$srcdir/$gitmod-build"

    cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$srcdir/$gitmod-build"
    make DESTDIR="$pkgdir/" install
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
    cp LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/"
}
