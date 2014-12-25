# $Id: PKGBUILD 212141 2014-05-08 23:25:56Z dan $
# Maintainer: Chris Warrick <aur@chriswarrick.com>
# Contributor: Dan McGee <dan@archlinux.org>
# Contributor: Daniele Paolella <dp@mcrservice.it>

pkgname=python26-virtualenv
pkgver=12.0.4
pkgrel=1
pkgdesc="Virtual Python Environment builder"
url="https://virtualenv.pypa.io/"
arch=('any')
license=('MIT')
makedepends=('python26')
replaces=('virtualenv')
conflicts=('virtualenv')
source=("http://pypi.python.org/packages/source/v/virtualenv/virtualenv-$pkgver.tar.gz")
md5sums=('ce7c4025516806b791bbd5b4ff6c4b84')

package() {
  depends=('python26')

  cd "$srcdir/virtualenv-$pkgver"
  python2.6 setup.py build
  python2.6 setup.py install --prefix=/usr --root="$pkgdir"

  # move this "old" version out of the way
  mv "$pkgdir/usr/bin/virtualenv" "$pkgdir/usr/bin/virtualenv2.6"

  # should report this upstream as still not fixed...
  sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2.6|" \
    $pkgdir/usr/lib/python2.6/site-packages/virtualenv.py

  install -D -m644 LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
