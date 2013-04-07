# Maintainer: josephgbr <rafael.f.f1@gmail.com>

pkgname=local-repo-git
pkgver=1.6.5.3.g46a678c
pkgrel=1
pkgdesc="Local repository manager"
arch=('any')
url="http://ushi.wurstcase.net/local-repo"
license=('GPL')
depends=('pacman' 'python>=3.3')
makedepends=('git' 'gettext')
conflicts=('local-repo')
provides=('local-repo')
install=${pkgname}.install
source=('git+https://github.com/ushis/local-repo.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}"/local-repo
  git describe | sed 's/^v//;s/-/./g'
}

package() {
  cd "${srcdir}"/local-repo
  python setup.py install --prefix="${pkgdir}/usr" --optimize=1 
  install -D -m644 bash-completion "${pkgdir}/usr/share/bash-completion/completions/local-repo"
  install -D -m644 share/config.example "${pkgdir}/usr/share/local-repo/config.example"
}

