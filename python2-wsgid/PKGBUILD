# Maintainer: Josh VanderLinden <arch@cloudlery.com>
# Contributor: Zhehao Mao <zhehao.mao@gmail.com>
pkgname=python2-wsgid
pkgver=0.7.1
pkgrel=1
pkgdesc='Python WSGI handler for Mongrel2'
arch=('any')
url='http://wsgid.com/'
license=('BSD')
depends=('mongrel2' 'python2-pyzmq' 'python2-simplejson' 'python2-daemon' 'python2-plugnplay')
makedepends=('python2-distribute')
source=("https://pypi.python.org/packages/source/m/m2wsgid/m2wsgid-${pkgver}.tar.gz"
  "LICENSE")
md5sums=('ed610266c0981cbe9347ad8ddf953420'
         'f3cce8098d0395f51ef06772d3932399')

build() {
  cd "${srcdir}/m2wsgid-${pkgver}"
  python2 ./setup.py install --root="${pkgdir}" --prefix="/usr"

  install -D ../LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:ts=2 sw=2 et:
