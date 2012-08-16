# Maintainer: Marvin Gülker <quintus at quintilianus point eu>
pkgname=xf86-input-mtev-meego
pkgver=0.1.13
pkgrel=1
epoch=
pkgdesc="X.org driver for multitouch displays (with Meego patch for recent versions of X.org)"
arch=("armv7h")
url="https://build.pub.meego.com/package/show?package=xorg-x11-drv-mtev&project=CE%3AAdaptation%3Ax86-generic"
license=('GPL')
groups=()
depends=("xorg-server" "mtdev")
makedepends=("xorg-server-devel")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=$pkgname.install
changelog=
source=("https://api.pub.meego.com/public/source/CE:Adaptation:x86-generic/xorg-x11-drv-mtev/xorg-x11-drv-mtev-$pkgver.tar.gz?rev=e85bdeccdb9ead5748a78cd4f5bbe520&" "https://api.pub.meego.com/public/source/CE:Adaptation:x86-generic/xorg-x11-drv-mtev/apis-match-for-xserver-1.10.1.patch?rev=e85bdeccdb9ead5748a78cd4f5bbe520&")
noextract=("apis-match-for-xserver-1.10.1.patch?rev=e85bdeccdb9ead5748a78cd4f5bbe520&")
md5sums=(c3ae76a98e16961d39726c272ca37297 62c7dc9698fc905ae58e74fbf229be36)

build() {
    cd "$srcdir/xorg-x11-drv-mtev-$pkgver"
    patch -p1 < '../apis-match-for-xserver-1.10.1.patch?rev=e85bdeccdb9ead5748a78cd4f5bbe520&'
    make
}

package() {
    cd "$srcdir/xorg-x11-drv-mtev-$pkgver"
    make DESTDIR="$pkgdir/" install
}
