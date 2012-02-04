# Maintainer: Tomasz P. <tmszppATgmailDOTcom>
pkgname=zukibird-theme
pkgver=0.1
pkgrel=1
pkgdesc="ZukiBird theme for GTK2, GTK3, Metacity and Xfwm, based on Bluebird and Zukitwo, made by elav"
arch=(any)
url="http://gnome-look.org/content/show.php/ZukiBird?content=148343"
license=('GPL')
depends=(gtk-engine-murrine gtk-engine-unico)
source=(http://gnome-look.org/CONTENT/content-files/148343-Zukibird.tar.gz)
md5sums=('173fabe1d6068f0b2fc5ede7bae51324')

build() {
  cd "$srcdir"
  chmod a+r ZukiBird/Background_Panel/panel.png
}

package() {
  cd "$pkgdir"
  install -d -m755 usr/share/themes
  cp -r "$srcdir/ZukiBird" usr/share/themes/
}

