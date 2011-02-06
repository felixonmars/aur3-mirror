# Contributor: Jason Scurtu <jscurtu@gmail.com>

pkgname=searchmoid-plasmoid
pkgver=0.1
pkgrel=2
pkgdesc="Simple Internet Quick Search bar (with history) for the following websites : Google, yahoo, Wikipedia etc "
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/SearchMoid?content=99460"
license=('GPL')
depends=('kdebase-workspace>=4.2.0')
makedepends=('cmake' 'automoc4')
replaces=(searchmoid-plasmoid-kdemod)
source=(http://kde-look.org/CONTENT/content-files/99460-SearchMoid01.tar.gz)
md5sums=()

build() {
    cd $startdir/src/SearchMoid/
    cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .
    make VERBOSE=1 || return 1
    make DESTDIR=$startdir/pkg install || return 1
}