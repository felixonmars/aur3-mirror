# Contributor: Calimero <calimeroteknik@free.fr>
pkgname=ctkarch-autostartx
pkgver=2.0.2
pkgrel=1
pkgdesc="A systemd unit file for running startx with the user's shell profile loaded"
arch=('any')
url='http://ctkarch.org/git/autostartx'
license=('GPL')
depends=('xorg-xinit')
backup=('etc/systemd/system/autostartx.service.d/user.conf')
install='autostartx.install'
source=('autostartx.service'
        'user.conf'
        'Xwrapper.config')
md5sums=('8d0db8c8ab47a9e2fcece2901fdc27be'
         '1572857291b0ce578f4476cf9183c174'
         'c9cecbe99e67c45f84653571c6bc0463')

package() {
  cd "$srcdir"

  # configuration file
  install -D -m644 user.conf "${pkgdir}/etc/systemd/system/autostartx.service.d/user.conf"

  # service file
  install -D -m644 autostartx.service "${pkgdir}/usr/lib/systemd/system/autostartx.service"

  # allow Xorg.wrap to run X not from a login tty only
  install -D -m644 Xwrapper.config "${pkgdir}/etc/X11/Xwrapper.config"
}
