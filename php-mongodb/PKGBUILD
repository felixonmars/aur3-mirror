# Maintainer: David Roheim <david dot roheim at gmail dot com>
pkgname=php-mongodb
pkgver=1.2.12
pkgrel=1
pkgdesc="PHP driver for MongoDB"
arch=('i686' 'x86_64')
url="http://www.mongodb.org/"
license=('APACHE')
depends=('php')
conflicts=('php-mongodb-git')
optdepends=('mongodb: The MongoDB database')
makedepends=('gcc')
source=("php-mongodb-${pkgver}.tar.gz::https://github.com/mongodb/mongo-php-driver/tarball/${pkgver}"
        'mongo.ini'
        'LICENSE')
sha256sums=('7040d45caf6781a602d6ce32f768194f3b60bcffe0bf007dfab3c4af1bb4ec44'
            '87a77042fc52976b372d845929ecb59d237c78aa684da11265aea357dc6fea7d'
            '5438d7dbf3eda57124e444c2f7446f0a3342c784d0e45f5c9e3561bb6d196aa8')

_gitcommit=fa51fdd

build() {
    cd ${srcdir}/mongodb-mongo-php-driver-${_gitcommit}
    phpize
    ./configure
    make
}

package() {
    install -D -m755 "${srcdir}/mongodb-mongo-php-driver-${_gitcommit}/modules/mongo.so" "${pkgdir}/usr/lib/php/modules/mongo.so"
    install -D -m644 mongo.ini "${pkgdir}/etc/php/conf.d/mongo.ini"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

