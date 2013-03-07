# Contributor: Chun Yang <x@cyang.info>
pkgname=python2-pytagcloud
pkgver=0.3.5
pkgrel=1
pkgdesc="python library to create simple tag clouds inspired by wordle"
arch=(any)
url="http://pypi.python.org/pypi/pytagcloud/"
license=('BSD')
depends=('python2-pygame>=1.9.1' 'python2-simplejson')
source=('https://pypi.python.org/packages/source/p/pytagcloud/pytagcloud-0.3.5.tar.gz'
        'LICENSE')
md5sums=('9fdbd71662b681efce79a8070b2c75ec'
         'acd44c7c196f19b8e2fd33c52fdfdefe')

build() {
  cd "$srcdir/pytagcloud-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/pytagcloud-$pkgver"

  python2 setup.py install --root="$pkgdir" --optimize=1

  # Install license
  install -D -m 755 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
