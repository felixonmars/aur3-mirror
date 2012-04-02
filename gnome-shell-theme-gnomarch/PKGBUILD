# Maintainer: Alucryd <alucryd at gmail dot com>
pkgname=gnome-shell-theme-gnomarch
pkgver=3.2.1
pkgrel=1
pkgdesc="A GNOME Shell theme for ArchLinux"
url="http://alucryd.deviantart.com/art/Gnome-Shell-GnomArch-245249611"
license=('GPL3')
arch=('any')
depends=('gnome-shell')
optdepends=('gnome-tweak-tool: Easy theme switcher')
source=('http://www.deviantart.com/download/245249611/gnome_shell___gnomarch_by_alucryd-d420jt7.zip')
md5sums=('7f8d37f56d7c0dac4d4a4476acab29fe')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/themes"
  mv GnomArch "$pkgdir/usr/share/themes/"
  chmod 755 -R "$pkgdir/usr/share/themes"
}

