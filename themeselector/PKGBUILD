# Maintainer: Jiening Wen <phill84@phill84.org>
pkgname=themeselector
pkgver=0.9
pkgrel=1
pkgdesc="ThemeSelector GNOME Shell extension is a new, unofficial GNOME Shell extension that adds a new tab in the Activities overview where all the GNOME Shell themes (not GTK themes!) installed under ~/.themes show up."
arch=('i686' 'x86_64')
url="http://blog.fpmurphy.com/2011/04/gnome-shell-theme-selector-preview.html"
license=('unknown')
depends=('gnome-shell-extensions-common' 'gnome-shell-extension-user-theme')
makedepends=('tar' 'gzip')
install=${pkgname}.install
source=(http://www.fpmurphy.com/gnome-shell-extensions/$pkgname-$pkgver.tar.gz)
md5sums=('61640cfdc9ad1a418b18d6be195705f5')

package() {
	cd "$srcdir"
	extdir=${pkgdir}/usr/share/gnome-shell/extensions/themeselector@fpmurphy.com/
	install -d ${extdir}
	install -Dm755 extension.js ${extdir}
	install -Dm755 metadata.json ${extdir}
	homedir=${pkgdir}${HOME}/
	themesdir=${homedir}/.themes/
	mkdir -p ${themesdir}
	chmod 700 ${homedir}
	cp -R Adwaita ${themesdir}
	cp -R ANewHope ${themesdir}
	cp -R Atolm ${themesdir}
	cp -R DarkGlass ${themesdir}
	cp -R DeviantArt ${themesdir}
	cp -R Elementary ${themesdir}
	cp -R SmoothInsert ${themesdir}
	groupname=$(grep :$(grep ${USER}: /etc/passwd | cut -d":" -f4): /etc/group | cut -d":" -f1)
	chown -R $USER:${groupname} ${themesdir}
}
