# Maintainer: Andrey Mivrenik <gim at fastmail dot fm>
pkgname=phpbb3
pkgver=3.0.12
pkgrel=5
pkgdesc="A high powered, fully scalable, and highly customisable open-source bbs package."
arch=("i686" "x86_64")
url="http://www.phpbb.com"
license=('GPLv2')
depends=('php>=4.3.3')
optdepends=('phpbb3-i18n: Language packs'
            'php-sqlite: to use the SQLite database backend'
            'php-pgsql: to use the PostgreSQL database backend')
backup=('etc/webapps/phpbb3/config.php' 'etc/webapps/phpbb3/.htaccess')
install="$pkgname.install"
source=("http://www.phpbb.com/files/release/phpBB-${pkgver}.tar.bz2")
md5sums=('b841460cd4247e240e1b80d989e5fe4f')

package() {
    # install project
    install -d ${pkgdir}/usr/share/webapps/
    cp -r ${srcdir}/phpBB3 ${pkgdir}/usr/share/webapps/${pkgname}

    # move config to /etc/webapps
    install -d -o http -g http ${pkgdir}/etc/webapps/${pkgname}
    mv ${pkgdir}/usr/share/webapps/${pkgname}/config.php ${pkgdir}/etc/webapps/${pkgname}/config.php
    chown -R http:http ${pkgdir}/etc/webapps/${pkgname}
    ln -s /etc/webapps/${pkgname}/config.php ${pkgdir}/usr/share/webapps/${pkgname}/config.php

    # move .htaccess to /etc/webapps
    mv ${pkgdir}/usr/share/webapps/${pkgname}/.htaccess ${pkgdir}/etc/webapps/${pkgname}/.htaccess
    ln -s /etc/webapps/${pkgname}/.htaccess ${pkgdir}/usr/share/webapps/${pkgname}/.htaccess

    # move cache to /var/cache
    install -d ${pkgdir}/var/cache
    mv ${pkgdir}/usr/share/webapps/${pkgname}/cache ${pkgdir}/var/cache/${pkgname}
    chown -R http:http ${pkgdir}/var/cache/${pkgname}
    ln -s /var/cache/${pkgname} ${pkgdir}/usr/share/webapps/${pkgname}/cache

    # license
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    cp ${pkgdir}/usr/share/webapps/${pkgname}/docs/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/

    # making some directories writable for web-server
    chown -R http:http ${pkgdir}/usr/share/webapps/${pkgname}/files
    chown -R http:http ${pkgdir}/usr/share/webapps/${pkgname}/store
    chown -R http:http ${pkgdir}/usr/share/webapps/${pkgname}/images/avatars/upload
}

# vim:set ts=4 sw=4 et:
