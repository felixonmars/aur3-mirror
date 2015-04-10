# Maintainer: Jochen Keil <jochen.keil+aur+git-fixup at gmail dot com>

_pkgname=git-fixup
pkgname=git-fixup-git
pkgver=1.0.2_0_g3d142a5
pkgrel=2
epoch=0
pkgdesc='Fighting the copy-paste element of your rebase workflow'
arch=('any')
url='https://github.com/keis/git-fixup'
license=('custom:ISC')
depends=('git')
makedepends=('git')
optdepends=('zsh: Completion for git-fixup')
provides=('git-fixup')
conflicts=('git-fixup')
source=("git://github.com/keis/git-fixup.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long | sed 's/^v//;s/-manpage-static//;s/-/_/g'
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -m 644 -D COPYING.md ${pkgdir}/usr/share/licenses/git-fixup/LICENSE
  make PREFIX="${pkgdir}/usr" install
  make PREFIX="${pkgdir}/usr" install-zsh
}
