# Contributor: Flamelab <panosfilip@gmail.com>
pkgname=l4ustyle2-kde4
_realpkgname=l4ustyle2
pkgver=1
pkgrel=1
pkgdesc="A simple Qt4/KDE4 style"
arch=("i686" "x86_64")
url="http://www.kde-look.org/content/show.php/l4ustyle2?content=90014"
license=("GPL")
depends=("qt")
optdepends=("kdebase-workspace")
makedepends=("cmake")
source=('http://www.kde-look.org/CONTENT/content-files/90014-l4ustyle2.tar.gz')
md5sums=('5514356db045324c922fe9e6ca3c77f9')

build() {
	cd ${srcdir}/$_realpkgname/
        cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release . 
        make || return 1
	make DESTDIR=$pkgdir install
}

