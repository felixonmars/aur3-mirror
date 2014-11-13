# $Id:$
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=('python-flask-silk' 'python2-flask-silk')
pkgver=0.2
pkgrel=1
pkgdesc='Adds silk icons to your Flask application or blueprint, or extension'
url='https://pythonhosted.org/Flask-Silk/index.html'
arch=('any')
license=('custom:BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/F/Flask-Silk/Flask-Silk-$pkgver.tar.gz")
sha256sums=('80a21faf09fe257443a4fbbf8cd3f6c793c567c87ff784751a1c38d2e18b5fbe')

prepare() {
  cp -r "Flask-Silk-$pkgver" "python-flask-silk-$pkgver"
  cp -r "Flask-Silk-$pkgver" "python2-flask-silk-$pkgver"
}

build_python-flask-silk() {
  cd "$pkgname-$pkgver"

  python setup.py build
}

build_python2-flask-silk() {
  cd "$pkgname-$pkgver"

  python setup.py build
}

package_python-flask-silk() {
  depends=('python-flask')
  cd "$pkgname-$pkgver"

  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-flask-silk() {
  depends=('python2-flask')
  cd "$pkgname-$pkgver"

  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

