# Maintainer: ScionicSpectre <scionicspectre_at_gmail(dot)com> 
pkgname=gtk-theme-aldabra
pkgver=3.2.2
pkgrel=5
pkgdesc="A GTK2 port of the GTK3 theme Adwaita."
arch=(any)
url="http://gnome-Look.org/content/show.php?content=142247"
license=('LGPL')
makedepends=('unzip')
depends=('gtk-engine-murrine')
conflicts=('mate-themes')
source=('http://dl.dropbox.com/u/45326422/Aldabra-3.2.2.tar.gz')
md5sums=('c0930cc1a7f7dcabbbacfc923652db9b')


build() {
       mkdir -p "$pkgdir"/usr/share/themes
       cd "$srcdir"/
       bsdtar -xf "$srcdir"/Aldabra-3.2.2.tar.gz
       chmod -R 755 "$srcdir"/Aldabra

       cp -R "$srcdir"/Aldabra/ "$pkgdir"/usr/share/themes/
}
