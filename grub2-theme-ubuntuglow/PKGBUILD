# Maintainer: Frozen Fox <frozenfoxz@gmail.com>
# Contributor: Xabz <xabz.2k5@gmail.com>
# Wallpaper: Mayurarora <http://gnome-look.org/content/show.php/Ubuntu+Glow?content=100314>

pkgname=grub2-theme-ubuntuglow
pkgver=0.1.1
pkgrel=2
pkgdesc="Simple grub2-gfxmenu theme, Ubuntu branded (1024x768)"
arch=('i686' 'x86_64')
license=('Artistic 2.0')
url="http://foro.archlinux.cl/viewtopic.php?id=12"
depends=('grub2-gfxmenu')
provides=()
conflicts=()
backup=()
install=ubuntuglow.install
makedepends=('gzip')
source=("http://hateanthem.dreamhosters.com/arch/build/ubuntuglow-${pkgver}.tar.gz")
md5sums=('6b23b0c7acf1008e251d3cd216c40b6f')

build() {
  cd ${srcdir}/ubuntuglow || return 1

  install -d ${pkgdir}/boot/grub/themes/
  install -d ${pkgdir}/boot/grub/themes/ubuntuglow/
  for i in ${srcdir}/ubuntuglow/* ; do
     install $i ${pkgdir}/boot/grub/themes/ubuntuglow/
  done
}