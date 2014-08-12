# $Id: PKGBUILD 103459 2014-01-06 11:25:36Z arcanis $
# Maintainer: Evgeniy Alekseev <arcanis.arch at gmail dot com
# Contributor: Julien Nicoulaud <julien.nicoulaud at gmail dot com>

pkgname=zsh-opp
pkgver=0.0.8
pkgrel=1
pkgdesc="Vim's text-bojects-ish for Zsh"
arch=(any)
url="https://github.com/hchbaw/opp.zsh"
license=('custom:public')
install=${pkgname}.install
source=("https://github.com/hchbaw/opp.zsh/archive/v${pkgver}.tar.gz"
        LICENSE)
sha1sums=(90d7db57ca821485eb9c2cfc8191c31fdcff1388
          8b3717f57678b42256cae3f1b44d5e43391d56b0)

package() {
  install -dm755 "${pkgdir}/usr/share/zsh/plugins/opp"
  install "${srcdir}/opp.zsh-${pkgver}/opp.zsh" "${pkgdir}/usr/share/zsh/plugins/opp/"
  install "${srcdir}/opp.zsh-${pkgver}/opp/"*.zsh "${pkgdir}/usr/share/zsh/plugins/opp/"

  install -dm755 "${pkgdir}/usr/share/licenses/zsh-opp/"
  install "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/zsh-opp/"
}
