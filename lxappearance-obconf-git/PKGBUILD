# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=lxappearance-obconf-git
pkgver=0.2.0.26.g309621d
pkgrel=1
pkgdesc="A plugin for LXAppearance to configure Openbox"
arch=(i686 x86_64)
url=http://lxde.org/
license=(GPL2)
depends=(lxappearance openbox)
makedepends=(git intltool)
source=($pkgname::git://lxde.git.sourceforge.net/gitroot/lxde/${pkgname%-*})
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    cd $pkgname/
    git describe | sed 's/-/./g'
}

build() {
    cd $pkgname/
    autoreconf -fi
    ./configure --prefix=/usr
    make
}

package() {
    make -C $pkgname DESTDIR="$pkgdir" install
}
