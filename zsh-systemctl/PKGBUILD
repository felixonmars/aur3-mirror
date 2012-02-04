# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
pkgname=zsh-systemctl
pkgver=20111026
pkgrel=1
pkgdesc="ZSH functions to tab-complete systemctl (part of systemd) functions and services"
arch=(any)
license=('GPL')
url="https://github.com/foudfou/zsh-completion/tree/nolegend"
depends=(zsh)
source=('_systemctl')
md5sums=('d3991f0fbf1a8aedfe409f0e1f7cfc1c')

package() {
  install -d -m755 ${pkgdir}/usr/share/zsh/site-functions/
  install -m644 _systemctl ${pkgdir}/usr/share/zsh/site-functions/_systemctl
}
