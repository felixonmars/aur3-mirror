# Contributor: Viliam Pucik <viliam dot pucik at gmail dot com>

pkgname=skulpture
pkgver=0.2.4
pkgrel=1
pkgdesc="Qt4/KDE4 style"
arch=('i686' 'x86_64')
url="http://skulpture.maxiom.de/"
license="GPL"
depends=('kdebase-workspace')
makedepends=('automoc4' 'cmake')
source=(http://www.kde-look.org/CONTENT/content-files/59031-$pkgname-$pkgver.tar.gz)
md5sums=('bf22c1122e99f3c80c95deeea5b20ed5')

build() {
    cd $startdir/src/$pkgname-$pkgver
    ./configure || return 1
    make || return 1
    make DESTDIR=$pkgdir install || return 1
}

