# Maintainer: Kwpolska <kwpolska@kwpolska.tk>
pkgname=pkgbuilder-legacy
pkgver=2.1.1.11
pkgrel=1
pkgdesc="A basic Python AUR helper/library.  Legacy version for pacman 3.x."
arch=('any')
url="https://github.com/Kwpolska/pkgbuilder"
license=('BSD')
depends=('python' 'pyalpm' 'python-pyparsing' 'pacman')
options=(!emptydirs)
source=("http://kwpolska.github.com/${pkgname}-${pkgver}.tar.gz")
md5sums=('72b7874d9d4939073d90b3577e3f9b16')
install='legacy.install'

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
