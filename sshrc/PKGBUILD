# Maintainer: Helge Rausch <helge at rausch dot io>
pkgname=sshrc
pkgver=0.4
pkgrel=1
pkgdesc="bring your .bashrc, .vimrc, etc. with you when you ssh"
url="https://github.com/Russell91/sshrc"
arch=('any')
license=('MIT')
depends=('openssh')
source=("https://raw.githubusercontent.com/Russell91/sshrc/ef1e0cebc7e8cb673e9c70b710ed3ba167e221a3/sshrc")
md5sums=('02e09e6d41dad7db4ffd56591d87978a')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cp sshrc "${pkgdir}/usr/bin/sshrc"
  chmod +x "${pkgdir}/usr/bin/sshrc"
}

# vim:set ts=2 sw=2 noexpandtab syntax=sh
