# Maintainer: ushi <ushi@porkbox.net>
pkgname=local-repo
pkgver=1.6.5
pkgrel=1
pkgdesc="Local repository manager"
arch=('any')
url="http://ushi.wurstcase.net/local-repo/"
license=('GPL')
depends=('tar' 'pacman' 'python')
makedepends=('gettext')
install=local-repo.install
source=("https://github.com/downloads/ushis/local-repo/local-repo-${pkgver}.tar.gz")
md5sums=('508894f6bcbe2c54ac9fb21307c79762')

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --prefix="${pkgdir}/usr"
  install -D -m644 bash-completion "${pkgdir}/usr/share/bash-completion/completions/local-repo"
  install -D -m644 share/config.example "${pkgdir}/usr/share/local-repo/config.example"
}

# vim:set ts=2 sw=2 et:
