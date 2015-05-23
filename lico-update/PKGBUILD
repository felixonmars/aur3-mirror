# Maintainer: Max Roder <maxroder@web.de>
# Contributor: Mathias Buren <mathias.buren@gmail.com>

pkgname='lico-update'
pkgver='git'
pkgrel='1'
pkgdesc="The Linux Counter automatic update script"
url="https://linuxcounter.net/script.html"
arch=('any')
license=('GPL')
depends=('lsb-release')
#tested but not used in the script: 'at' 'links' 'net-tools' 'module-init-tools' 'sysstat'
#not found: kldstat, lastlogin
optdepends=('cron: use cron to automatically update your counter entry')
replaces=('machine-update')
conflicts=('machine-update')
source=("https://github.com/alexloehner/linuxcounter-update-examples/raw/master/_official/lico-update.sh")
sha256sums=('SKIP')

package() {
	install -D -m755 ${srcdir}/${pkgname}-${pkgver}.sh ${pkgdir}/usr/bin/${pkgname}
}

# vim:set ts=2 sw=2 et:

