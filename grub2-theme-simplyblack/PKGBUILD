# Maintainer: Frozen Fox <frozenfoxz@gmail.com>
# Contributor: Xabz <xabz.2k5@gmail.com>
# Wallpaper: Andrea Scarpino <bash.lnx@gmail.com> (archlinux-wallpaper pkg)

pkgname=grub2-theme-simplyblack
pkgver=0.1.1
pkgrel=2
pkgdesc="Simple black grub2-gfxmenu theme, Arch branded (1024x768)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://foro.archlinux.cl/viewtopic.php?id=12"
depends=('grub2-gfxmenu')
provides=()
conflicts=()
backup=()
install=simplyblack.install
makedepends=('gzip')
source=("http://hateanthem.dreamhosters.com/arch/build/simplyblack-${pkgver}.tar.gz")
md5sums=('cad0812252bf5b26b41f2655c07bd5ee')

build() {
  cd ${srcdir}/simplyblack || return 1

  install -d ${pkgdir}/boot/grub/themes/
  install -d ${pkgdir}/boot/grub/themes/simplyblack/
  for i in ${srcdir}/simplyblack/* ; do
     install $i ${pkgdir}/boot/grub/themes/simplyblack/
  done
}