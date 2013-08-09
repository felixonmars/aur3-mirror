# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=zsh-syntax-highlighting
pkgver=0.2.0
pkgrel=1
pkgdesc="Fish shell like syntax highlighting for Zsh."
arch=(any)
url="https://github.com/zsh-users/zsh-syntax-highlighting"
license=(BSD)
depends=("zsh>=4.3.9")
install=${pkgname}.install
changelog=Changelog
conflicts=(${pkgname}-git)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zsh-users/${pkgname}/tarball/${pkgver}")
md5sums=('08ea2f2b5f49ab036e2820bd4d479a58')

package() {
  msg2 "Install scripts at /usr/share/zsh/plugins/${pkgname}..."
  install -m0755 -d "${pkgdir}/usr/share/zsh/plugins/${pkgname}"
  cp -r "${srcdir}"/zsh-users-${pkgname}-*/* "${pkgdir}/usr/share/zsh/plugins/${pkgname}"

  msg2 "Install links to the documentation resources at /usr/share/doc/${pkgname}..."
  install -m0755 -d "${pkgdir}/usr/share/doc"
  ln -s /usr/share/zsh/plugins/${pkgname} "${pkgdir}/usr/share/doc/${pkgname}"

  msg2 "Install links to the license resources at /usr/share/licenses/${pkgname}..."
  install -m0755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /usr/share/zsh/plugins/${pkgname}/COPYING.md "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
