#Contributor: Gary Wright <wriggary at g mail dot com>
#Maintainer: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=win7multi-gdm-theme
pkgver=0.0.1
pkgrel=2
pkgdesc='Windows 7 Multiuser GDM Screen'
arch=('i686' 'x86_64')
url='http://gnome-look.org/content/show.php?content=107832'
license=('GPL')
depends=('gdm')
source=(http://linuxgurl.com/login/Win7Multi.tar.gz)
md5sums=('17dca24d24dcbec8a103b3d588f991c6')

build() {
	/bin/true
}

package() {
	cd $srcdir/
	install -d $pkgdir/usr/share/gdm/themes/win7multi
 	install -Dm644 Win7Multi/*.* $pkgdir/usr/share/gdm/themes/win7multi
	rm -r $pkgdir/usr/share/gdm/themes/win7multi/*\~
}
