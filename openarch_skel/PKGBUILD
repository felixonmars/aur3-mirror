# Maintainer: Alexander Ovsyannikov <ovsinc@ya.rud
# Contributor: Alexander Ovsyannikov <ovsinc@ya.ru>

pkgname=openarch_skel
pkgver=0.2.26
pkgrel=1
pkgdesc="Skeleton files for OpenArch"
arch=('any')
url="http://ovsinc.narod.ru/"
license=('GPL')
depends=('openarch_openbox_scripts'
 'openarch_dmenu_scripts' 
 'openarch_artwork_gray' 
 'pcmanfm' 
 'wbar' 
 'openarch_xconf' 
 'openarch_systemd'
 'openbox-xdgmenu'
 'gnome-menus2'
 'lxmenu-data'
 'xfce4-notifyd'
 'pmtools')
source=("http://dl.dropbox.com/u/19256622/src/$pkgname/skel_openarch.tar.gz" "profile.tar.gz")


build() {
	install -d "${pkgdir}"/etc
	cp -R "${srcdir}"/skel_openarch "${pkgdir}"/etc/
	cp -R "${srcdir}"/profile.d "${pkgdir}"/etc/
}

md5sums=('e4265c79b232d10a7c4778ab5f936237'
         '97fc4793d012f494905e0e1533678ea5')
