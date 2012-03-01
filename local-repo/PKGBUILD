# Maintainer: ushi <ushi@porkbox.net>
pkgname=local-repo
pkgver=1.4.2
pkgrel=1
pkgdesc="Local repository manager"
arch=('any')
url="https://github.com/ushis/local-repo"
license=('GPL')
depends=('tar' 'pacman' 'python')
makedepends=('gettext')
source=("https://github.com/downloads/ushis/local-repo/local-repo-${pkgver}.tar.gz")
md5sums=('8950a6ec8982dfb913165f4a48e61aa9')

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --prefix="${pkgdir}/usr"
  install -D -m644 bash_completion "${pkgdir}/etc/bash_completion.d/local-repo"
}

# vim:set ts=2 sw=2 et:
