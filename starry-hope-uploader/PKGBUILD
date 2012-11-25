pkgname=starry-hope-uploader
pkgver=11.07.1
pkgrel=2
pkgdesc="A simple way to upload photos to Facebook"
arch=('any')
url="https://launchpad.net/starry-hope-uploader"
license=('GPL')
depends=('pygtk' 'python2-imaging' 'python2-pycurl' 'python2-simplejson' 'pywebkitgtk' 'python2-configobj')
makedepends=('python2-distutils-extra')
options=(!emptydirs)
source=(http://launchpad.net/$pkgname/trunk/$pkgver/+download/${pkgname}_$pkgver.tar.gz)
md5sums=('f45e2f7fb86bdd9108fb5c1fd6929c88')

build() {
  cd "$srcdir/$pkgname"
  sed -i 's@^#!.*python$@#!/usr/bin/python2@' starry_hope_uploader/facebook.py

  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname"

  python2 setup.py install --root=$pkgdir/ --optimize=1

  # We don't have apport on Arch Linux
  rm -r "$pkgdir/etc"
  rm -r "$pkgdir/usr/share/apport"
}
