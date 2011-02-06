# Contributor: Marcus Carlsson <carlsson.marcus@gmail.com>
_pkgname=ircd-ratbox

pkgname=${_pkgname}-testing
pkgver=3.0.6
pkgrel=2
pkgdesc="ircd-ratbox irc daemon"
url="http://www.ircd-ratbox.org/"
arch=(any)
depends=('openssl')
license=('GPL')
source=("ftp://ftp.ircd-ratbox.org/pub/ircd-ratbox/testing/${_pkgname}-$pkgver.tar.bz2"
        "ircd")
backup=('/etc/ircd-ratbox/ircd.conf')
install='ircd-ratbox.install'
md5sums=('31f4fae4211144188b4b982d6e7d3465'
         'd43dae868ef7359e6030524fdb94cade')

build() {
    cd $srcdir/${_pkgname}-$pkgver

    echo "Configurating package..."
    ./configure --prefix=/usr/local/ircd-ratbox \
    --with-confdir=/etc/ircd-ratbox \
    --with-logdir=/var/log/ircd-ratbox \
    --bindir=/usr/sbin \
    --with-nicklen=12 || return 1

    echo "Starting make..."
    make || return 1
    cd contrib/
    make || return 1
    echo "Installing..."
    mkdir -p $pkgdir/etc/ircd-ratbox
    cd $srcdir/${_pkgname}-$pkgver
    make DESTDIR=$pkgdir install || return 1

    mkdir -p $pkgdir/usr/local/${_pkgname}/modules/contrib/
    cp $srcdir/${_pkgname}-$pkgver/contrib/.libs/*.so $pkgdir/usr/local/${_pkgname}/modules/contrib/
    install -D -m755 "$srcdir/ircd" "$pkgdir/etc/rc.d/ircd"
}
