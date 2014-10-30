# Maintainer: Muhkoenig
# Contributor: MisterG <mathieu.grzybek at gmail dot com>

pkgname=ndoutils
pkgver=2.0.0
pkgrel=1
pkgdesc="An addon designed to store all configuration and event data from Nagios in a database."
license=('GPL')
arch=('i686' 'x86_64')
url="http://www.nagios.org"
depends=('libmysqlclient' 'glibc' 'zlib')
optdepends=('nagios')
source=("http://downloads.sourceforge.net/project/nagios/ndoutils-2.x/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('93561584f0fa7582a795e795306a3b35')

_nagios_user="nagios"
_nagios_group="nagios"
_instdir="usr/share/nagios"
_bindir="usr/bin"
_vardir="var/nagios"
_confdir="etc/nagios"

getent group $_nagios_group > /dev/null || _nagios_group=30
getent passwd $_nagios_user > /dev/null || _nagios_user=30

build() {
        cd $pkgname-$pkgver

        ./configure \
                --with-ndo2db-user=$_nagios_user \
                --with-ndo2db-group=$_nagios_group \
                --prefix="/$_instdir" \
                --bindir="/$_bindir" \
                --localstatedir="/$_vardir" \
                --sysconfdir="/$_confdir" \
                --enable-mysql \
                --disable-ssl

        make all
}

package() {
        cd $pkgname-$pkgver

        make DESTDIR="$pkgdir/" fullinstall
}
