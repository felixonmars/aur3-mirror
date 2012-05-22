# Maintainer: MASSUCHETTI Jonathan <jonathan.massuchetti@gmail.com>
pkgname=firefox-vaccum
pkgver=0.1
pkgrel=2
pkgdesc="Firefox-vaccum allow you to enjoy better performance with your Firefox's SQlite databases (such as search history in address bar)"
license=('WTFPL')
arch=('any')
url=('http://www.mozilla.org/projects/firefox')
install='firefox-vaccum.install'
source=('firefox-vaccum.sh' 'firefox-vaccum-hook.sh')
md5sums=('9e9b459f8ed06a23458fcc4c970e1346' '605e4b0660800fdbc164b577c7407576')


package() {

	mkdir "$pkgdir/etc"
	touch "$pkgdir/etc/firefox-vaccum-seek"
	echo 10 > "$pkgdir/etc/firefox-vaccum-seek"
	chmod 644 "$pkgdir/etc/firefox-vaccum-seek"
	install -Dm744 firefox-vaccum.sh "$pkgdir/usr/bin/firefox-vaccum"
	install -Dm644 firefox-vaccum-hook.sh "$pkgdir/etc/rc.d/functions.d/firefox-vaccum.sh"
}
