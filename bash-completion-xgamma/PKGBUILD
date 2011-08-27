# Maintainer: Thomas Dziedzic < gostrc at gmail >

pkgname=bash-completion-xgamma
pkgver=1
pkgrel=1
pkgdesc='Bash completion for xgamma'
arch=('any')
url='http://www.archlinux.org'
license=('MIT')
depends=('xorg-xgamma')
source=('xgamma')
md5sums=('88a254772e09abf6f3e6728c2268ef87')

package() {
  install -d ${pkgdir}/etc/bash_completion.d/
  install -m644 xgamma \
    ${pkgdir}/etc/bash_completion.d/
}
