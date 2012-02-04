# Maintainer: Daniele Paolella <dp@mcrservice.it>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
pkgname=supervisor
pkgver=3.0a10
pkgrel=1
pkgdesc='A system for controlling process state under UNIX'
arch=('any')
url='http://supervisord.org'
license=('custom')
depends=('python2' 'setuptools' 'meld3>=0.6.5')
backup=('etc/supervisord.conf')
changelog=ChangeLog
source=("http://pypi.python.org/packages/source/s/$pkgname/$pkgname-$pkgver.tar.gz"
        'supervisor')
md5sums=('99c6fbd45bade87301296b7a597fb68e'
         'de39a63165fb7a796156b6924e8789a1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root=$pkgdir
  install -D -m600 "$srcdir/$pkgname-$pkgver/build/lib/$pkgname/skel/sample.conf" \
    "$pkgdir/etc/supervisord.conf"
  install -D "$srcdir/supervisor" "$pkgdir/etc/rc.d/supervisor"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  mv "$pkgdir/usr/doc/COPYRIGHT.txt" "$pkgdir/usr/share/licenses/$pkgname"
  mv "$pkgdir/usr/doc/LICENSES.txt" "$pkgdir/usr/share/licenses/$pkgname"
  mkdir -p "$pkgdir/usr/share/doc"
  mv "$pkgdir/usr/doc" "$pkgdir/usr/share/doc/$pkgname"
}

# vim:set ts=2 sw=2 et:
