# Maintainer: ushi <ushi@porkbox.net>
pkgname=local-repo
pkgver=1.3.1
pkgrel=1
pkgdesc="Local repository manager"
arch=('any')
url="https://github.com/ushis/local-repo"
license=('GPL')
depends=('tar' 'pacman' 'python')
makedepends=()
source=("https://github.com/downloads/ushis/local-repo/local-repo-${pkgver}.tar.gz")
md5sums=('0d5f1c0b68b593d60d41a1123a96b44d')

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --prefix="${pkgdir}/usr"
  install -D -m644 bash_completion "${pkgdir}/etc/bash_completion.d/local-repo"
}

# vim:set ts=2 sw=2 et:
