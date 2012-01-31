# Maintainer: Tomasz P. <tmszppATgmailDOTcom>
pkgname=zukitwo-colors-xfwm4
pkgver=0.1
pkgrel=1
pkgdesc='Zukitwo-Colors theme for Xfwm4 by fredbird67'
arch=(any)
license=(GPL)
depends=(xfwm4)
optdepends=('zukitwo-colors: for matching GTK2 and GTK3 themes')
md5sums=('6e557b16c9ebc66bc77b44dc8e02cb3b')
url=(http://xfce-look.org/content/show.php/Zukitwo-Colors+Xfwm+Themes?content=148624)
source=(http://xfce-look.org/CONTENT/content-files/148624-Zukitwo-Colors-Xfwms.tar.gz)

build() {
	cd "${srcdir}"
}

package() {
	cd "${pkgdir}"
	install -d --mode=755 usr/share/themes
	cp -r ${srcdir}/Zukitwo-* usr/share/themes/
}