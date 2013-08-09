# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=zsh-completions
pkgver=0.10.0
pkgrel=1
pkgdesc="Additional completion definitions for Zsh."
arch=(any)
url="https://github.com/zsh-users/zsh-completions"
license=(unknown)
depends=(zsh)
changelog=Changelog
provides=(zsh-virtualbox zsh-packagekit zsh-yaourt zsh-bumblebee)
conflicts=(${pkgname}-git zsh-virtualbox zsh-packagekit zsh-yaourt zsh-bumblebee)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zsh-users/${pkgname}/tarball/${pkgver}")
md5sums=('63be9fa078c31d2590d6129857d53275')

package() {
  install -dm0755                                         "${pkgdir}/usr/share/zsh/site-functions"
  install -m0644 "${srcdir}"/zsh-users-${pkgname}-*/src/* "${pkgdir}/usr/share/zsh/site-functions"
}

# vim:set ts=2 sw=2 et:
