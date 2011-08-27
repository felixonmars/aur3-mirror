# Maintainer: Sebastian Vandekerckhove <ptitfox@scarlet.be>

pkgname=mysql-proxy-svn
pkgver=361
pkgrel=4
pkgdesc="Monitors, analyzes and transformations communication between the MySQL client and server"
arch=('i686')
url="http://forge.mysql.com/wiki/MySQL_Proxy"
license=('GPL')
depends=('mysql>=5.0.0' 'lua>=5.1.0' 'glib2>=2.6.0' 'libevent>=1.0')
makedepends=('subversion' 'autoconf' 'automake' 'flex')
provides=('mysql-proxy')
conflicts=('mysql-proxy')
source=()
md5sums=()

_svntrunk=http://svn.mysql.com/svnpublic/mysql-proxy/trunk
_svnmod=mysql-proxy

build() {
    cd $startdir/src

    # Checkout SVN repository
    msg "Checking out SVN repository..."
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
    msg "SVN checkout finished or server timed out..."

    cd ${_svnmod}

    ./autogen.sh

    ./configure --prefix=/usr --datadir=/usr/share/$pkgname LDFLAGS="-ldl"
    make || return 1
    make DESTDIR=$startdir/pkg install || return 1
}
