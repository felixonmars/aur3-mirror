# Maintainer: ushi <ushi@porkbox.net>
pkgname=local-repo
pkgver=1.6
pkgrel=2
pkgdesc="Local repository manager"
arch=('any')
url="https://github.com/ushis/local-repo"
license=('GPL')
depends=('tar' 'pacman' 'python')
makedepends=('gettext')
source=("https://github.com/downloads/ushis/local-repo/local-repo-${pkgver}.tar.gz")
md5sums=('d66cd3fabf46d49284b1e4a7a96b6ade')

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --prefix="${pkgdir}/usr"
  install -D -m644 bash_completion "${pkgdir}/etc/bash_completion.d/local-repo"
  install -D -m644 share/config.example "${pkgdir}/usr/share/local-repo/config.example"
}

# vim:set ts=2 sw=2 et:
