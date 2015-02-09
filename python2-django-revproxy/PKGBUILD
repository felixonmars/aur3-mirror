# Maintainer: Thomas Marchsteiner <tommy[0x2e]m86[0x40]gmail[0x2e]com>
pkgname=('python2-django-revproxy')
pkgver=0.2.8
pkgrel=1
pkgdesc='A simple reverse proxy using Django'
arch=('any')
url="https://pypi.python.org/pypi/django-revproxy/0.2.8"
license=('MPLv2')
makedepends=('python2' 'python2-setuptools')
depends=()
source=("https://pypi.python.org/packages/source/d/django-revproxy/django-revproxy-${pkgver}.tar.gz")
md5sums=('3e3fec4e4558b0cb19aab75baf7e829c')

build() {
  cp -r ${srcdir}/django-revproxy-${pkgver} ${srcdir}/django-revproxy-${pkgver}-py2

  cd ${srcdir}/django-revproxy-${pkgver}-py2
  python2 setup.py build
}

package() {
  cd ${srcdir}/django-revproxy-${pkgver}-py2
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --prefix=/usr --root=${pkgdir}
}
