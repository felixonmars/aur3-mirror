# Maintainer: Nicolas Quiénot <niQo @ aur>

#FIXME: switch to release 1.0

pkgname=shairport
pkgver=0.99.1
pkgrel=1
pkgdesc="Emulates an AirPort Express for the purpose of streaming music from iTunes and compatible iPods and iPhones"
url='http://github.com/abrasive/shairport'
arch=('i686' 'x86_64' 'armv6h')
license=('GPL')
groups=('daemons')
depends=('glibc' 'pkgconfig' 'libao' 'openssl')
backup=('etc/conf.d/shairport')
source=(git://github.com/abrasive/shairport.git#branch=1.0-dev)
md5sums=('SKIP')


build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"
    make PREFIX="$pkgdir/usr" install

    install -m 755 -d "$pkgdir"/etc/conf.d/
    echo "# Shairport Daemon options" > shairport.conf && install -m 644 shairport.conf "$pkgdir"/etc/conf.d/shairport
    install -m 755 -d "$pkgdir"/usr/lib/systemd/system
    install -m 644 scripts/shairport.service "$pkgdir"/usr/lib/systemd/system/shairport.service
}

