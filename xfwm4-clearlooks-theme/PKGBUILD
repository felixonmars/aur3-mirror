# Maintainer: Tomasz P. <tmszppATgmailDOTcom>
pkgname=xfwm4-clearlooks-theme
pkgver=0.01
pkgrel=1
pkgdesc='Clearlooks theme for xfwm4'
arch=(any)
license=(GPL)
depends=(xfwm4)
optdepends=('gtk-engines: for Clearlooks GTK theme')
md5sums=('4d74bf765d4c33cd6b3f216f36647108')
url=(http://xfce-look.org/content/show.php/Clearlooks+for+XFWM4?content=137055)
source=(http://xfce-look.org/CONTENT/content-files/137055-Clearlooks-XFWM4-0.01.tar.gz)

build() {
	cd "${srcdir}"
	tar zxf 137055-Clearlooks-XFWM4-0.01.tar.gz
}

package() {
	cd "${pkgdir}"
	install -d --mode=755 usr/share/themes/Clearlooks
	cp -r "${srcdir}/Clearlooks XFWM4/xfwm4" usr/share/themes/Clearlooks
	chmod -R 644 usr/share/themes/Clearlooks/xfwm4
	chmod 755 usr/share/themes/Clearlooks/xfwm4
}