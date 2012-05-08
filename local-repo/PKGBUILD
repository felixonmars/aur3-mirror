# Maintainer: ushi <ushi@porkbox.net>
pkgname=local-repo
pkgver=1.6.4
pkgrel=1
pkgdesc="Local repository manager"
arch=('any')
url="http://ushi.wurstcase.net/local-repo/"
license=('GPL')
depends=('tar' 'pacman' 'python')
makedepends=('gettext')
install=local-repo.install
source=("https://github.com/downloads/ushis/local-repo/local-repo-${pkgver}.tar.gz")
md5sums=('c2173a02db0138cc75dffc0b774c4ca0')

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --prefix="${pkgdir}/usr"
  install -D -m644 bash-completion "${pkgdir}/usr/share/bash-completion/completions/local-repo"
  install -D -m644 share/config.example "${pkgdir}/usr/share/local-repo/config.example"
}

# vim:set ts=2 sw=2 et:
