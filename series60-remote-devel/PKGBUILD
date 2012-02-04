# Maintainer: Jakub Kozisek <nodevel at gmail dot com>

pkgname=series60-remote-devel
pkgver=0.4.80
pkgrel=4
pkgdesc="Application to manage your S60 mobile phone (development version)"
arch=('i686' 'x86_64')
url="http://series60-remote.sourceforge.net"
license=('GPLv2')
depends=('python2' 'python2-qt' 'python-pybluez' 'obexftp')
optdepends=('python-vobject: for exporting/importing contacts in vobject format'
	    'python2-ldap: for exporting/importing contacts in ldap format'
	    'python2-matplotlib: for generating messages statistics')
provides=('series60-remote')
conflicts=('series60-remote')
source=(http://downloads.sourceforge.net/project/series60-remote/series60-remote/$pkgver/series60-remote-$pkgver.tar.gz)

build() {
  cd $srcdir/series60-remote-$pkgver
  python2 setup.py install --prefix=$pkgdir/usr || return 1
}
md5sums=('7ca59f5a41072597d8d4a38ed327e696')