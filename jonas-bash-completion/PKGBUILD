# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=jonas-bash-completion
pkgver=1.0
pkgrel=1
pkgdesc="Bash completion for OW2 JOnAS."
arch=(any)
url="http://jonas.ow2.org"
license=(LGPL)
depends=('jonas' 'bash-completion')
changelog=Changelog
source=("http://archive.canonical.com/ubuntu/pool/partner/j/jonas-full-5.2/jonas-full-5.2_5.2.0.GA-0ubuntu1.debian.tar.gz")
md5sums=('4c481d589998a248b2f8e23b5f71ab2f')

package() {

  msg2 "Install the script at /etc/bash_completion.d..."
  install -Dm644 "${srcdir}"/debian/completion/bash/jonas "${pkgdir}"/etc/bash_completion.d/jonas

}

# vim:set ts=2 sw=2 et:
