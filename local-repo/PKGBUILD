# Maintainer: ushi <ushi@porkbox.net>
pkgname=local-repo
pkgver=1.2
pkgrel=1
pkgdesc="Local repository manager"
arch=('any')
url="https://github.com/ushis/local-repo"
license=('GPL')
depends=('tar' 'pacman' 'python')
makedepends=()
source=("https://github.com/downloads/ushis/local-repo/local-repo-${pkgver}.tar.gz")
md5sums=('8fa018e9aa800904cc331b0e1ae24619')

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --prefix="${pkgdir}/usr"
}

# vim:set ts=2 sw=2 et:
