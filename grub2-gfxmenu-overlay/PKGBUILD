# Contributor: Frozen Fox <frozenfoxz@gmail.com>

pkgname=grub2-gfxmenu-overlay
pkgver=20090719
_overlay="overlay_2009-07-19"
pkgrel=1
pkgdesc="Overlay/graphical files for grub2-gfxmenu."
arch=('i686' 'x86_64')
license=('Unknown')
url="http://grub.gibibit.com/"
depends=()
provides=()
conflicts=()
backup=()
install=
makedepends=('')
source=("http://grub.gibibit.com/files/$_overlay.tar.gz"
        "arch_icon.png")
md5sums=('766f87d30492bb9192b33328d00de7d2'
         'f9fa607e1e58badc7a2e176427de7df1')
options=('emptydirs')

build() {
  msg "No building being done, this is a data package..."
}

package() {
  # Install all directories (-d) and files (-f)
  msg "Installing files to pkgdir..."
  cd $srcdir/$_overlay
  for _i in `find ./`
    do
       [ -d $_i ] && install -d $pkgdir/`echo $_i | cut -c2-` && continue
       [ -f $_i ] && install $_i $pkgdir/`echo $_i | cut -c2-`
  done
  install ${startdir}/arch_icon.png ${pkgdir}/boot/grub/themes/icons/arch.png
  rm $pkgdir/boot/grub/grub.cfg
}