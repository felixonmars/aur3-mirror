# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Brian Knox <taotetek@gmail.com>

pkgname=rsyslog-dev
pkgver=7.5.1
pkgrel=1
pkgdesc="development release of rsyslog with liblognorm support"
arch=(i686 x86_64)
url=http://www.rsyslog.com/
license=(GPL3)
depends=(json-c liblognorm)
makedepends=(gnutls libmysqlclient net-snmp postgresql-libs)
optdepends=(gnutls
    'libmysqlclient: MySQL Database Support'
    net-snmp
    'postgresql-libs: PostgreSQL Database Support')
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
backup=(etc/${pkgname%-*}.conf
    etc/logrotate.d/${pkgname%-*}
    etc/conf.d/${pkgname%-*})
options=(!libtool strip zipman)
source=($url/files/download/${pkgname%-*}/${pkgname%-*}-$pkgver.tar.gz
    ${pkgname%-*}.logrotate
    ${pkgname%-*}.conf.d)
sha256sums=('3f97ce6556e5dec4b4881d6d2e591f502a60e68ea91021c15050c6e1ce3cfadc'
    'fb6904956d2f7a439ac232976ba145436250a5de399823c2423220f7c23e23a3'
    '31ac5cc26b368307ac798c81b5c092f02be6ccbeb02c7254faedabb97acfcf0e')
sha512sums=('398f3a509692e66b3fc34b2e8344110eb7b37867c305bafd4441f11fa7e9e5019e307e28c55254629148c6a711b9d77bda49c7a20a9cfc03640155ee1b98cc58'
    '9e6907d4fbe252f2051503e60163cc052b6f20c8f7a69db56b53fdd2df31649adcc373b504cfe7f734acdcf0590e98d0cf835103ee38cd2eed28ad36f4de349e'
    '68da6324941bdbb9fda0cf52585fd80b0281366b0652b68daf372ecbd1449866a0fa3a078b53896d96cc24d9db2ce5fa82f4646fce2f9fdcaab61438114574f9')

build() {
    cd ${pkgname%-*}-$pkgver/
    ./configure \
        --prefix=/usr \
        --enable-mysql \
        --enable-pgsql \
        --enable-mail \
        --enable-imfile \
        --enable-imtemplate \
        --enable-snmp \
        --enable-imptcp \
        --enable-gnutls \
        --enable-inet \
        --enable-mmnormalize \
        --with-systemdsystemunitdir=/usr/lib/systemd/system
    make
}

package() {
    make -C ${pkgname%-*}-$pkgver DESTDIR="$pkgdir" install
    install -Dm644 ${pkgname%-*}.logrotate "$pkgdir"/etc/logrotate.d/${pkgname%-*}
    install -Dm644 ${pkgname%-*}.conf.d "$pkgdir"/etc/conf.d/${pkgname%-*}
}
