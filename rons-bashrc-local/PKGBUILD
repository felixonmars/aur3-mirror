# Contributor: Ron Simart

pkgname=rons-bashrc-local
pkgver=0.1
pkgrel=2
pkgdesc="Ron's personal bash.bashrc.local"
arch=('any')
url='http://aur.archlinux.org/packages/rons-bashrc-local/'
license=('GPL')
depends=()
provides=()
conflicts=('pacman-color')
replaces=()
backup=()
options=()
install=rons-bashrc-local.install
source=('bash.bashrc.local')
md5sums=('2bba72a7d807aeadd08f5fd28f22f9a1')

package() {
  install -Dm 644 $srcdir/bash.bashrc.local ${pkgdir}/etc/bash.bashrc.local
}
