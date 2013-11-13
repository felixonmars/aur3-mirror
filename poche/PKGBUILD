# Maintainer: Samuel Lepetit <lepetit.samuel@gmail.com>

pkgname=poche
pkgver=1.1.0
pkgrel=2
pkgdesc="poche is a self hostable read-it-later app. Unlike to other services, poche is free and open source."
arch=('any')
url="http://www.inthepoche.com/"
license=('WTFPL')
depends=('php' 'php-composer')
optdepends=('apache: is depedency if you do not use lighttpd or nginx'
            'lighttpd'
            'nginx'
            'mariadb: if you want to use the MariaDB backend'
            'sqlite: if you want to use the SQLite backend')
install=${pkgname}.install
source=(https://github.com/inthepoche/poche/archive/$pkgver.zip)
sha1sums=('f0fd286a383cb8559abffce17c6b2bc2f62227f9')

package() {
    cd ${pkgname}-${pkgver}
	install -dm755 "${pkgdir}/usr/share/webapps/poche"
	cp -rf . "${pkgdir}/usr/share/webapps/poche"
	cd "${pkgdir}/usr/share/webapps/poche"
	composer install
	rm -rf {CONTRIBUTING.md, CREDITS.md, INSTALL.md, README.md, TODO.md}
	chmod -R 755 "${pkgdir}/usr/share/webapps/poche"
    
}
