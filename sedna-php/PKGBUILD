# Mantainer: Alex Reznichenko
# Mantainer: Gianni Vialetto <g dot vialetto at gmail dot com>

pkgname=sedna-php
pkgver=2.0
pkgrel=1
pkgdesc="PHP API for Sedna XML database"
arch=('i686' 'x86_64')
url="http://modis.ispras.ru/sedna"
license=('APACHE')
depends=('php' 'sedna')
source=("http://www.modis.ispras.ru/FTPContent/sedna/api/php-api-${pkgver}.tgz")
md5sums=('4563b7304fc8bac851c0299148698028')

build() {

    # something is _really_ wrong with the permissions... 
    chmod -R 700 ${srcdir}/php-api
    cd ${srcdir}/php-api/src
    phpize || return 1
    ./configure --with-sedna=/opt/sedna || return 1
    make || return 1
    make INSTALL_ROOT="$pkgdir/" install
}
