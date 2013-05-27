# Maintainer: Siddhartha Sahu <sh.siddhartha@gmail.com>
# Contributor: Melancholy_Dream <Melancholy_Dream@write.su>

pkgname=verlihub
pkgver=0.9.8e_r2
_pkgver=0.9.8e-r2
pkgrel=2
pkgdesc="A DC++ protocol server (hub)"
arch=('i686' 'x86_64')
url="http://www.verlihub-project.org"
license=('GPL')
depends=('geoip' 'mysql' 'pcre')
install=$pkgname.install
source=("http://www.verlihub-project.org/download/$pkgname-$_pkgver.tar.bz2"
        "stringutils.patch"
        "verlihub.service")
md5sums=('8d2bc96d4b58a38076958395fc9a0ea9'
         '6940d8b2284122b35e6d15ce616d0fec'
         '5796a52003035027bb4976150f658c0a')

prepare() {
    cd "$srcdir/$pkgname-$_pkgver"
    patch -Np1 -i "$srcdir/stringutils.patch"
}

build() {
    cd "$srcdir/$pkgname-$_pkgver"
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
    cd "$srcdir/$pkgname-$_pkgver"
    make DESTDIR="$pkgdir" install

    # verlihub systemd service file
    install -m755 -d "${pkgdir}/usr/lib/systemd/system"
    install -m644 "${srcdir}/verlihub.service" "${pkgdir}/usr/lib/systemd/system/"
}