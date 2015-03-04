# Maintainer: Gustavo Castro <gustawho[at]gmail[dot]com>

pkgname=rainier-icon-theme-git
pkgver=7.1bbcad9
pkgrel=3
pkgdesc='Icon set by the Trenta OS Developers for Trenta OS.'
arch=('any')
url='http://trentaos.org/'
license=('GPLv3')
depends=('gnome-icon-theme' 'numix-circle-icon-theme-git')
makedepends=('git')
provides=()
conflicts=()
options=('!strip')
install='rainier-icon-theme-git.install'
source=("rainier-icons"::'git+https://github.com/trenta-os/rainier-icons.git')
sha256sums=('SKIP')
_realname=rainier-icons

pkgver() {
  cd "${_realname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
    
package() {	
  cd "${_realname}/Rainier"
  install -dm 755 "$pkgdir"/usr/share/icons
  rm -rf {.git,LICENSE,README.md}
  cp -dpr --no-preserve='ownership' "${srcdir}/${_realname}/Rainier" "${pkgdir}/usr/share/icons/"
}
          
# vim: ts=2 sw=2 et:
