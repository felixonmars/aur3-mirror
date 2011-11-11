# Maintainer: Alois Nespor <info@aloisnespor.info>

pkgname=gnome-shell-theme-metalx
pkgver=1.5
pkgrel=1
pkgdesc="A metallic gnome-shell theme for Gnome3"
url="http://justviper.deviantart.com/art/Metal-X-1-2-shell-theme-256652412"
license=('GPL')
arch=('any')
depends=('gnome-shell>=3.2')
makedepends=('unzip')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
            'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.'
	    'ttf-ubuntu-font-family: this theme prefers ttf-ubuntu-font-family')
source=(http://www.deviantart.com/download/256652412/metal_x_1_2_shell_theme_by_justviper-d48sy9o.zip
	http://www.deviantart.com/download/257044868/panel_icons_for_metal_x_theme_by_justviper-d491d38.zip)

package() {

  #unzip -o metal_x_1_2_shell_theme_by_justviper-d48sy9o.zip
  mkdir -p ${pkgdir}/usr/share/themes/
  cp -R $srcdir/gs-metalX-gnome3.2 $pkgdir/usr/share/themes/
 
  #add Archlinux activities button
  cd $srcdir/Panel\ Icons/Arch/
  cp -f gnomefix* corner* $pkgdir/usr/share/themes/gs-metalX-gnome3.2/gnome-shell/
  chmod -R 755 ${pkgdir}/usr/share/themes/gs-metalX-gnome3.2

}

sha256sums=('741aae9447e5ff51676527d8bd327b7fbbc82b9e0f5309f54274d1d7c4c6141a'
            '88c3c234aa1c6539297ef4f4e901f7edb285f1aae65713e774db0abdd67cab9c')



