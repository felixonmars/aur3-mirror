# Mantainer: William Díaz <wdiaz [at] archlinux [dot] us>

pkgname=kde4icons-crystaldiamond
_pkgname=KDE_Crystal_Diamond
pkgver=2.85
pkgrel=2
pkgdesc="Wonderful, Realistic and complete Theme for your KDE4."
arch=('any')
depends=()
url="http://www.kde-look.org/content/show.php/KDE4+Crystal+Diamond+Icons?content=45576"
license=('LGPL')
source=(https://www.dropbox.com/s/iwmpnh4z76fbl69/${_pkgname}_${pkgver}_Arch_Mod.tar.gz)
md5sums=('9eb4af99186e4f480aca4379bc7392a9')

build() {
    true
}

package() {
  install -d ${pkgdir}/usr/share/icons/kde-crystal-diamond-arch
  cp -R ${_pkgname}_${pkgver}_Arch_Mod/* ${pkgdir}/usr/share/icons/kde-crystal-diamond-arch
}
