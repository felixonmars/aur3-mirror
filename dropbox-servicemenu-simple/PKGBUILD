# Maintainer: Aliaksandr Stelmachonak <mail.avatar@gmail.com>

pkgname=dropbox-servicemenu-simple
pkgver=0.1
pkgrel=1
pkgdesc="A servicemenu for KDE4 which allows easy access Dropbox features using Dropbox CLI"
url="https://aur.archlinux.org/packages.php?ID=56187"
license=('GPL')
arch=(any)
depends=('dropbox-cli' 'qt' 'xdg-utils' 'coreutils' 'sqlite3' 'kdebase-kdialog')
source=(
http://dl.dropbox.com/u/4514366/${pkgname}-${pkgver}.tar.gz
http://dl.dropbox.com/u/340607/get_dropbox_folder.sh
)
md5sums=(
'c1e7510785177e6101d0b46321a4dd9c'
'962f4e24241fc0b37a2c1c882cf2df4c'
)

build() {
	cd ${srcdir}
	for file in *.sh
	do
	  install -m 755 -D $file ${pkgdir}/usr/lib/dropbox/$file
	done
	cd ${pkgname}-${pkgver}
	for file in *.sh
	do
	  install -m 755 -D $file ${pkgdir}/usr/lib/dropbox/$file
	done
	for file in *.desktop
	do
	  install -m 755 -D $file ${pkgdir}/`kde4-config --prefix`/share/kde4/services/ServiceMenus/$file
	done
} 
