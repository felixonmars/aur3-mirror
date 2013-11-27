# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=kdeplasma-themes-kotonaru
_name=Kotonaru
pkgver=2.3.1
pkgrel=1
pkgdesc="solid clear theme for plasma"
arch=('any')
url=http://koresource.blogspot.com/
license=('CC-BY-SA')
depends=('kdebase-workspace')
groups=('kde')
source=("http://sourceforge.net/projects/kaosx/files/sources/plasma-themes/$pkgver/${_name}_${pkgver}.tar.xz")
sha256sums=('770ab74636518634c84887726f47040e061ef812222c97c178316d7112b11fcb')

package() {
  cd $srcdir
  mkdir -p "${pkgdir}"/usr/share/apps/desktoptheme
  cp -R $_name "${pkgdir}"/usr/share/apps/desktoptheme/
  chmod -R 0755 "${pkgdir}"/usr/share/apps/desktoptheme/$_name
}