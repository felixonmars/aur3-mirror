pkgname=edid-decode
_commit=27532e7
pkgver="86+g${_commit}"  # Commit count: git rev-list --count "$_commit"
_snapshot="$pkgname-$_commit"
pkgrel=1
pkgdesc="EDID decoder and conformance tester"
url="http://cgit.freedesktop.org/xorg/app/$pkgname"
arch=('i686' 'x86_64')
license=('MIT')
depends=(glibc)
source=("$url/snapshot/$_snapshot.tar.gz")
md5sums=(8a11d35195abdd4d738fa9de563b3463)

build() {
    make -C "$srcdir/$_snapshot"
}

package() {
    make -C "$srcdir/$_snapshot" install DESTDIR="$pkgdir"
}
