# Maintainer: Josh VanderLinden <arch@cloudlery.com>
_name=plugnplay
pkgname=python2-${_name}
pkgver=0.5.2
pkgrel=2
pkgdesc="A Generic plug-in system for python"
arch=('any')
url="https://github.com/daltonmatos/plugnplay"
license=('GPL2')
depends=('python2')
source=("https://pypi.python.org/packages/source/p/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('7b61e44de34b57dff636904e880f8195')

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  install -D /usr/share/licenses/common/${license}/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
