# Maintainer: faktorx <faktorx at lavabit dot com>

pkgname='sslredir'
pkgver='0.9.1'
pkgrel=1
pkgdesc="A simple utility used for redirecting incoming non-SSL connections to outgoing SSL connections"
url='https://urandom.ca/sslredir/'
arch=('any')
license=('GPL2')
depends=('python2' 'python-m2crypto')

source=("https://urandom.ca/$pkgname/downloads/$pkgname-$pkgver.tar.gz"{,.sig})
sha1sums=('2f94ad524221f1bde7637ece87f730d60b36a977'
          '39c46cc828b8d3db3d8d866c8e0809f6f61841b2')
build()
{
  cd "$pkgname-$pkgver"
  sed -i "s|#!/usr/bin/env python|#!/usr/bin/env python2|g" ./sslredir
}

package()
{
  cd "$pkgname-$pkgver"
  install -D -p -m 755 sslredir $pkgdir/usr/bin/sslredir
  install -D -p -m 644 sslredir.1 $pkgdir/usr/share/man/man1/sslredir.1
}
