
python=python2
name=lovely-jsonrpc
fname=lovely.jsonrpc

pkgname=$python-$name
pkgver=0.2.1
pkgrel=1
pkgdesc="Python JSONRPC package"
arch=(any)
url=http://code.google.com/p/$name
license=('Apache License 2.0')
depends=($python)
source=("http://pypi.python.org/packages/source/l/$fname/$fname-$pkgver.tar.gz")
md5sums=('0cacae307ce355db102c9aec7fb472d8')
build() {
  cd $srcdir/$fname-$pkgver
  $python setup.py install --prefix=/usr --root=$pkgdir
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
