# Maintainer: Brendan MacDonell <macdonellba at gmail dot com>
# Former Maintainer: Linmiao Xu <linmiao.xu@gmail.com>
# Contributor: Juan Miguel Cejuela <juanmi@jmcejuela.net>

pkgname=python-apsw
pkgver=3.7.17_r1
pkgrel=1
pkgdesc="Python wrapper for SQLite"
arch=('i686' 'x86_64')
url="http://code.google.com/p/apsw/"
license=('MIT')
depends=('python' 'sqlite3>=3.7.5')
source=("http://apsw.googlecode.com/files/apsw-${pkgver//_/-}.zip" 'LICENSE')

md5sums=('5393765e7ef55def11dae08149133136'
         'efc704d50cb39441d00f9dc76cbe6665')

package() {
  cd $srcdir/apsw-${pkgver//_/-}
  python setup.py install --root=$pkgdir/

  install -D -m644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

