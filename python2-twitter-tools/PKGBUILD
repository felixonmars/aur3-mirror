# Maintainer: Dennis Fink <dennis.fink@c3l.lu>

pkgname=python2-twitter-tools
pkgver=1.15.0
pkgrel=1
pkgdesc="An API and command-line toolset for Twitter (twitter.com)"
arch=('any')
url="http://pypi.python.org/pypi/twitter/"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
source=("http://pypi.python.org/packages/source/t/twitter/twitter-${pkgver}.tar.gz" "LICENSE")
md5sums=('ba530230d1687a2a8bfd720a963f13c0'
         'a5da3e25967f8405eb578fa3ab7f4098')
conflicts=('python2-twitter-tools-git')

build() {

  cd "$srcdir/twitter-$pkgver"
  python2 setup.py build

}

package() {

  cd "$srcdir/twitter-$pkgver"
  python2 setup.py install --root=$pkgdir --optimize=1

  cd "$pkgdir/usr/bin"
  for f in *; do
    mv $f $f\-python2
  done

  install -D -m644 $srcdir/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

# vim:set ts=2 sw=2 et:
