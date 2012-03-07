# Maintainer: Tomasz P. <tmszppATgmailDOTcom>
pkgname=xfwm4-nodoka-theme
pkgver=0.2.2
pkgrel=2
pkgdesc="Nodoka theme for xfwm4"
arch=(any)
license=(GPL2)
depends=(xfwm4)
optdepends=("gtk-engine-nodoka: for matching GTK2 theme")
makedepends=(rpmextract)
md5sums=('eb102bc977cb9b43fd83d42aa1cf7771')
url=(https://fedorahosted.org/nodoka/)
source=(http://fedora.c3sl.ufpr.br/linux/releases/16/Fedora/source/SRPMS/xfwm4-theme-nodoka-0.2-2.fc15.src.rpm)

build() {
	cd "$srcdir"
	rpmextract.sh xfwm4-theme-nodoka-0.2-2.fc15.src.rpm
	tar -zxf xfwm4-theme-nodoka-0.2.tar.gz
}

package() {
	cd "${pkgdir}"
	install -d -m755 usr/share/themes
	install -d -m755 usr/share/doc/xfwm4-nodoka-theme
	cp -r "${srcdir}/Nodoka/" usr/share/themes
	cd usr/share/themes/Nodoka
	mv AUTHORS "${pkgdir}/usr/share/doc/xfwm4-nodoka-theme"
	mv ChangeLog "${pkgdir}/usr/share/doc/xfwm4-nodoka-theme"
	mv COPYING "${pkgdir}/usr/share/doc/xfwm4-nodoka-theme"
	mv README "${pkgdir}/usr/share/doc/xfwm4-nodoka-theme"
	mv TODO "${pkgdir}/usr/share/doc/xfwm4-nodoka-theme"
	cd "${pkgdir}"
	chmod -R 644 "${pkgdir}/usr/share/themes/Nodoka"
	chmod 755 "${pkgdir}/usr/share/themes/Nodoka"
	chmod 755 "${pkgdir}/usr/share/themes/Nodoka/xfwm4"
}
