# Maintainer  sanderd17 < sanderd17 AT gmail DOT com >

pkgname=gnome-shell-theme-metalx-single-user
pkgver=1.2
pkgrel=1
pkgdesc="A metallic gnome-shell theme for Gnome3. No system wide installation."
url="http://justviper.deviantart.com/art/Metal-X-1-2-shell-theme-256652412"
license=('GPL')
arch=('any')
depends=('gnome-shell')
makedepends=('unzip')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
            'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.'
	    'ttf-ubuntu-font-family: this theme prefers ttf-ubuntu-font-family')
source=(http://www.deviantart.com/download/256652412/metal_x_1_2_shell_theme_by_justviper-d48sy9o.zip
	http://www.deviantart.com/download/257044868/panel_icons_for_metal_x_theme_by_justviper-d491d38.zip)

package() {

  #unzip -o metal_x_1_2_shell_theme_by_justviper-d48sy9o.zip
  mkdir -p ${pkgdir}$HOME/.themes/
  cp -R $srcdir/gs-metalX $pkgdir$HOME/.themes/
 
  #add Archlinux activities button
  cd $srcdir/Panel\ Icons/Arch/
  cp -f gnomefix* corner* $pkgdir$HOME/.themes/gs-metalX/gnome-shell/
  chmod -R 755 ${pkgdir}$HOME/.themes/gs-metalX

}

sha256sums=('9010488e4a2b7c50e654040179b50936d5e768b10dde660fb7ca8b0efe05258b'
	    '88d6c86ba7b344e155c4907e08429ed1b17412fa1eb55f81cca0e499fade04b8')
