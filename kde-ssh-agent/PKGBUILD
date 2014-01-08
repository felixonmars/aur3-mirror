# Maintainer: oi_wtf <brainpower at gulli dot com>
# Orig-Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=kde-ssh-agent
pkgver=20130226
pkgrel=1
pkgdesc="Startup and shutdown scripts for ssh-agent in KDE (formerly in kde-agent)"
arch=('any')
url='http://www.archlinux.org/'
license=('GPL' 'LGPL' 'FDL')
depends=('openssh')
source=('ssh-agent-startup.sh' 'ssh-agent-shutdown.sh')
md5sums=('8b8c4f60aa66660670db20dd1beccf88'
         'a5d2f2191f31c4f869c98067010395d4')

package() {
  install -d "${pkgdir}"/etc/kde/env
  install -D -m755 ssh-agent-startup.sh "${pkgdir}"/etc/kde/env/

  install -d "${pkgdir}"/etc/kde/shutdown
  install -D -m755 ssh-agent-shutdown.sh "${pkgdir}"/etc/kde/shutdown/
}
