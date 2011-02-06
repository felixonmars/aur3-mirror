pkgname=kdeplasma-addons-applets-systrayalt
pkgver=0.3
pkgrel=1
pkgdesc="Systray alternative with no history support"
license=('GPL')
arch=('i686' 'x86_64')
depends=('kdebase-workspace')
makedepends=()
url=('http://kde-look.org/content/show.php?content=119268')
source=("http://kde-look.org/CONTENT/content-files/119268-systrayAlt-$pkgver.tgz")
md5sums=('3625431b23f66f3c6d442bd8670318ea')

build() {
        cd systrayAlt-$pkgver
        rm -rf build
        mkdir build && cd build
        cmake -DCMAKE_INSTALL_PREFIX=/usr .. || return 1
        make || return 1
        make DESTDIR="$pkgdir/" install || return 1

}
