# $Id: PKGBUILD,v 1.4 2008/04/21 16:56:58 BaSh Exp $
# Contributor: Kritoke <kritoke@nospam.gmail.com>
# Maintainer: Kritoke <kritoke@nospam.gmail.com>

pkgname=gnome-splashscreen-manager
pkgver=0.2
pkgrel=2
pkgdesc="A Ruby-based splashscreen manager for gnome."
arch=('i686' 'x86_64')
license=('GPL2')
depends=('ruby-gtk2' 'ruby-libglade' 'ruby-gconf2')
url="http://www.miketech.net/gnome-art/index.php"
source=(http://www.miketech.net/gnome-art/download/gnome-art-$pkgver.tar.gz)
md5sums=('4dd59ba8a84efe8dcb5637ba051394e7')

build() {
  cd $startdir/src/gnome-art
  cd $pkgname
  ruby setup.rb config --prefix=$startdir/pkg/usr
  ruby setup.rb setup
  ruby setup.rb install
}

#Desktop Launcher

mkdir -p ${pkgdir}/usr/share/applications

echo '[Desktop Entry]
Encoding=UTF-8
Name=Gnome Splashscreen Manager
Comment=Modify gnome splashscreen settings
Exec=gnome-splashscreen-manager
Icon=gnome-splashscreen-manager
Terminal=false
Type=Application
StartupNotify=true
Categories=GNOME;GTK;Settings;Application;
' > ${pkgdir}/usr/share/applications/gnome-splashscreen-manager.desktop

}