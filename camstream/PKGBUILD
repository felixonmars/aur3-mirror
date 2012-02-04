# Contributor: Gilles CHAUVIN <gcnweb ][ gmail ! com>

pkgname=camstream
pkgver=0.27
pkgrel=3
pkgdesc="A collection of tools for webcams and other video-devices"
url="http://www.smcc.demon.nl/camstream/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('alsa-lib' 'qt3')
source=(http://www.smcc.demon.nl/$pkgname/download/$pkgname-$pkgver.tar.gz)
md5sums=('28d93ad8820139de7de59e8e95a9f6a6')

build() {
    # Source Qt3 profile...
    source /etc/profile.d/qt3.sh
    # ...and build
    cd $startdir/src/$pkgname-$pkgver
    ./configure --prefix=/usr
    make || return 1
    make prefix=$startdir/pkg/usr/ install
}
