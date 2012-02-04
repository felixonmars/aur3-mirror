# Arch package for the quotesee plasmoid
# Homepage: 
# Developer: Josh Zegan http://kde-look.org/usermanager/search.php?username=jzegan
# Contributor's note: This is my first attempt at an Arch package. I'm mostly doing this for
# the learning experience. Please contact me if I fucked anything up or you have any problems,
# suggestions, comments, or flames. Thx - p.daniels
# Maintainer: Pete Daniels <teeahr1 AT gee-mail DOT communism> (You can figure it out, right?)

pkgname=quotesee-plasmoid
pkgver=0.2.2
pkgrel=1
pkgdesc="Stock and currency quote plasmoid for KDE4."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/QuoteSee+Stock%2BCurrency+plasmoid?content=101760"
license=('GPL')
depends=('qt>=4.5' 'kdebase-workspace')
makedepends=('cmake' 'make' 'automoc4')
install=$pkgname.install
source=(http://kde-look.org/CONTENT/content-files/101760-plasma_quotesee-$pkgver.tar.gz)
md5sums=('d3b5c3d3026bc6c6159399c87cd0ddeb')
build() {
    cd $srcdir/plasma_quotesee-$pkgver
    mkdir build
    cd build
    cmake ../ -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` || return 1
    make || return 1
    make DESTDIR=$pkgdir install || return 1
}
