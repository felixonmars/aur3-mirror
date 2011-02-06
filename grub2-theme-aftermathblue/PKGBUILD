# Maintainer: Frozen Fox <frozenfoxz@gmail.com>
# Contributor: Frozen Fox <frozenfoxz@gmail.com>
# Wallpaper: "Aftermath" color filtered (archlinux-wallpaper pkg)

pkgname=grub2-theme-aftermathblue
pkgver=0.02.1
pkgrel=2
pkgdesc="Deep blue grub2-gfxmenu theme, Arch branded (1024x768)"
arch=('i686' 'x86_64')
license=('CCPL:by-nc-sa')
url="http://bbs.archlinux.org/viewtopic.php?id=56576&p=1"
depends=('grub2-gfxmenu')
provides=()
conflicts=()
backup=()
install=aftermathblue.install
makedepends=('gzip')
source=("http://hateanthem.dreamhosters.com/arch/build/aftermathblue-${pkgver}.tar.gz")
md5sums=('c2b4fd848908d3467d61fbd3b48c9087')

build() {
  cd ${srcdir}/aftermathblue || return 1

  install -d ${pkgdir}/boot/grub/themes/
  install -d ${pkgdir}/boot/grub/themes/aftermathblue/
  for i in ${srcdir}/aftermathblue/* ; do
     install $i ${pkgdir}/boot/grub/themes/aftermathblue/
  done

}