# Maintainer: Tetsumaki <http://goo.gl/YMBdA>

pkgname=leed-git
_gitname=Leed
pkgver=20130407
pkgrel=1
pkgdesc="Leed (Light Feed) is a free RSS aggregator and minimalist consultation allows RSS feeds quickly and non-intrusively. Very similar to Google Reader, Tiny Tiny RSS, rssLounge and selfoss but leed use the principles of philosophy kiss"
arch=('any')
url="http://projet.idleman.fr/leed/"
license=('CC by-nc-sa')
depends=('php' 'mariadb')
makedepends=('git')
optdepends=('apache: is depedency if you do not use lighttpd or nginx'
            'lighttpd'
            'nginx'
            'wget: for automatic updating feeds with cron')
source=('git://github.com/ldleman/Leed.git')
install=${pkgname}.install
sha1sums=('SKIP')

pkgver() {
	cd "${_gitname}"
	git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
	cd "${_gitname}"
	install -dm755 "${pkgdir}/usr/share/webapps/leed"
	cp -rf . "${pkgdir}/usr/share/webapps/leed"
	cd "${pkgdir}/usr/share/webapps/leed"
	rm -rf {.git,.gitignore,README.md}
	chmod -R 755 "${pkgdir}/usr/share/webapps/leed"
}