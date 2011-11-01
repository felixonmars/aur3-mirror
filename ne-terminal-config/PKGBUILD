# Maintainer: Alessio Sergi <asergi at archlinux dot us>

pkgname=ne-terminal-config
pkgver=1.0
pkgrel=1
pkgdesc="A configuration GUI for nautilus-elementary terminal"
arch=('any')
url="https://launchpad.net/nautilus-terminal"
license=('GPL3')
depends=('nautilus-elementary-bzr' 'python2')
makedepends=('gettext')
source=(http://bzr.flogisoft.com/_outdated/${pkgname}/+export/rev6.tar.gz)
md5sums=('a84f93298aa6bf8bce5ca21126e6a75d')

package() {
  cd "${srcdir}/_outdated_${pkgname}"

  sed -i 's_python_python2_' "code/${pkgname}.py"

  ./install.sh -p "${pkgdir}"
}

# vim:set ts=2 sw=2 et:
