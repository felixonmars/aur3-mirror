# Maintainer: Frozen Fox <frozenfoxz@gmail.com>
# Contributor: Xabz <xabz.2k5@gmail.com>
# Wallpaper: Takatalvi <http://gnome-look.org/content/show.php/Distro+balls?content=74628>

pkgname=grub2-theme-distroballs
pkgver=0.1.1
pkgrel=2
pkgdesc="Distro balls grub2-gfxmenu theme, Arch branded (1024x768)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://foro.archlinux.cl/viewtopic.php?id=12"
depends=('grub2-gfxmenu')
provides=()
conflicts=()
backup=()
install=distroballs.install
makedepends=('gzip')
source=("http://hateanthem.dreamhosters.com/arch/build/distroballs-${pkgver}.tar.gz")
md5sums=('a4fdc6212410312950c4f808268be49e')

build() {
  cd ${srcdir}/distroballs || return 1

  install -d ${pkgdir}/boot/grub/themes/
  install -d ${pkgdir}/boot/grub/themes/distroballs/
  for i in ${srcdir}/distroballs/* ; do
     install $i ${pkgdir}/boot/grub/themes/distroballs/
  done
}