# Maintainer: Aurelien Grosdidier <aurelien.grosdidier@gmail.com>

pkgname=kde-agent-ssh
pkgver=0.2
pkgrel=1
pkgdesc="Startup and shutdown scripts for ssh-agent in KDE"
arch=('any')
url='https://www.archlinux.org/'
license=('GPL')
depends=('')
source=('ssh-agent-startup.sh' 'ssh-agent-shutdown.sh')
md5sums=('3946e7a24063f10971416f83c57097ad'
         'bd64b5ae2993444835807bdb69825afc')

package() {
  install -d "${pkgdir}"/etc/kde/env
  install -D -m755 ssh-agent-startup.sh "${pkgdir}"/etc/kde/env/

  install -d "${pkgdir}"/etc/kde/shutdown
  install -D -m755 ssh-agent-shutdown.sh "${pkgdir}"/etc/kde/shutdown/
}
