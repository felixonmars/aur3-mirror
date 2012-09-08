# Maintainer: Kwpolska <kwpolska@kwpolska.tk>
pkgname=trashman
pkgver=1.0.3
pkgrel=1
pkgdesc='A Python trash manager.  Python 3 build.'
arch=('any')
url='https://github.com/Kwpolska/trashman'
license=('BSD')
depends=('python')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/t/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('e50ab675f18498dcfe8a7908230c65b9')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
