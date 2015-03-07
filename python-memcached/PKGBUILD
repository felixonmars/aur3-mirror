# Maintainer: Boris Djurdjevic <boris@djurdjevic.ch>

pkgname=python-memcached
pkgver=1.51
pkgrel=1
pkgdesc='Python interface to memcached'
arch=('any')
url='http://pypi.python.org/pypi/python3-memcached'
license=('Python')
depends=('python>3')
makedepends=('python>3', 'python-setuptools')
source=("http://pypi.python.org/packages/source/p/python3-memcached/python3-memcached-$pkgver.tar.gz"
        'LICENSE')
sha256sums=('7cbe5951d68eef69d948b7a7ed7decfbd101e15e7f5be007dcd1219ccc584859'
            'aa36a02ae0813d72411f6224d4a1da1b613117f1d091a97f69f69ddba18edd81')

package() {
  cd $srcdir/python3-memcached-$pkgver

  sed -i 's:/usr/bin/env python:#/usr/bin/env python3:' memcache.py
  python3 setup.py install --root=$pkgdir --optimize=1
  install -D -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

check() {
  cd $srcdir/python3-memcached-$pkgver

  python3 setup.py check
}
