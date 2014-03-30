# Contributer: apkawa <apkawa@gmail.com>

pkgname=python-werkzeug-docs
pkgver=0.9.4
pkgrel=1
pkgdesc="Documentation for The Swiss Army knife of Python web development"
arch=(any)
url="http://werkzeug.pocoo.org/"
license=('BSD')
depends=('python2')
makedepends=('python2-sphinx')
source=("http://pypi.python.org/packages/source/W/Werkzeug/Werkzeug-$pkgver.tar.gz")
sha256sums=('c1baf7a3e8be70f34d931ee173283f406877bd3d17f372bbe82318a5b3c510cc')

build() {
  cd Werkzeug-$pkgver/docs
  make SPHINXBUILD=sphinx-build2 html
  mkdir ${pkgdir}/usr/share/doc/ -p
  mv _build/html ${pkgdir}/usr/share/doc/${pkgname}
}
