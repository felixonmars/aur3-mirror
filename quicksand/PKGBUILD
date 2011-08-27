# Contributor: Githzerai <githzerai06@gmail.com>

pkgname=quicksand
pkgver=0.1
pkgrel=1
arch=(i686 x86_64)
pkgdesc="An alternative front-end for KRunner."
url="http://kde-apps.org/CONTENT/content-files/91748-quicksand.tar.bz2"
license="GPL"
depends=('kdebase-workspace' 'kdelibs')
makedepends=('cmake')
source=('http://kde-apps.org/CONTENT/content-files/91748-quicksand.tar.bz2')
md5sums=

build() {
        cd $startdir/src/$pkgname
        cmake -DCMAKE_INSTALL_PREFIX=/usr
        make || return 1
        make DESTDIR=$startdir/pkg install
}
