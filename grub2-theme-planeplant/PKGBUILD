# Maintainer: Frozen Fox <frozenfoxz@gmail.com>
# Contributor: Xabz <xabz.2k5@gmail.com>
# Wallpaper: Kiriapurv <http://kiriyard.com/2009/03/plane-plant/>

pkgname=grub2-theme-planeplant
pkgver=0.1.1
pkgrel=2
pkgdesc="Artistic grub2-gfxmenu theme, Tux branded (1024x768)"
arch=('i686' 'x86_64')
license=('CCPL:by-nc-sa')
url="http://foro.archlinux.cl/viewtopic.php?id=12"
depends=('grub2-gfxmenu')
provides=()
conflicts=()
backup=()
install=planeplant.install
makedepends=('gzip')
source=("http://hateanthem.dreamhosters.com/arch/build/planeplant-${pkgver}.tar.gz")
md5sums=('98a69d5e0f3b1a94c94f65f7b6f14611')

build() {
  cd ${srcdir}/planeplant || return 1

  install -d ${pkgdir}/boot/grub/themes/
  install -d ${pkgdir}/boot/grub/themes/planeplant/
  for i in ${srcdir}/planeplant/* ; do
     install $i ${pkgdir}/boot/grub/themes/planeplant/
  done
}