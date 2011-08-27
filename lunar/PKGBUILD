# Contributor: Tusooa Zhu <tusooa@gmail.com>
pkgname=lunar
pkgver=2.2
pkgrel=1
pkgdesc="Show lunar date."
arch=('i686' 'x86_64')
url="http://packages.ubuntu.com/source/lucid/lunar"
license=('GPL')
depends=()
makedepends=(make)
source=(http://archive.ubuntu.com/ubuntu/pool/universe/l/$pkgname/${pkgname}_$pkgver.orig.tar.gz)

build()
{
    cd "$srcdir/$pkgname"
    msg "Starting make..."

    make &&
    #make DESTDIR="$pkgdir" install || return 1
    mkdir -pv $pkgdir/usr/bin/ &&
    cp -v lunar $pkgdir/usr/bin/
}


md5sums=('fcd6e0876ddaf5cb653688e318e112c9')
