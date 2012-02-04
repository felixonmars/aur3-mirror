# Maintainer: Frozen Fox <frozenfoxz@gmail.com>
# Contributor: Xabz <xabz.2k5@gmail.com>
# Wallpaper: Phillipe <http://gnome-look.org/content/show.php/Arch+Sphere?content=101136>

pkgname=grub2-theme-archsphere
pkgver=0.1.1
pkgrel=2
pkgdesc="Sleek grub2-gfxmenu theme, Arch branded (1024x768)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://foro.archlinux.cl/viewtopic.php?id=12"
depends=('grub2-gfxmenu')
provides=()
conflicts=()
backup=()
install=archsphere.install
makedepends=('gzip')
source=("http://hateanthem.dreamhosters.com/arch/build/archsphere-${pkgver}.tar.gz")
md5sums=('581feb2c67806c005aa43437b28ecccd')

build() {
  cd ${srcdir}/archsphere || return 1

  install -d ${pkgdir}/boot/grub/themes/
  install -d ${pkgdir}/boot/grub/themes/archsphere/
  for i in ${srcdir}/archsphere/* ; do
     install $i ${pkgdir}/boot/grub/themes/archsphere/
  done
}