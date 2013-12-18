# Submitter: Patrick Palka <patrick@parcs.ath.cx>
# Maintainer: Mariano Iglesias <mgiglesias@gmail.com>
# Development: https://github.com/nicolasff/phpredis

pkgname=phpredis
pkgver=2.2.4
pkgrel=2
pkgdesc="A PHP extension for Redis"
arch=('i686' 'x86_64')
url="https://github.com/nicolasff/phpredis"
license=('PHP')
depends=('php')
_ininame="redis.ini"
_inifile="etc/php/conf.d/$_ininame"
backup=("$_inifile")
_filename="$pkgname-$pkgver.tgz"
source=("$_filename::http://pecl.php.net/get/redis-$pkgver.tgz")
md5sums=('ad7bdb20322833897472b8ee05f3d319')
_builddir=redis-$pkgver

build() {
    cd $_builddir

    phpize
    ./configure --prefix=/usr --enable-redis
    make
    #make test
}

package() {
    cd $_builddir

    make INSTALL_ROOT="$pkgdir" install
    echo ";extension=redis.so" > "$_ininame"
    install -vDm644 "$_ininame" "$pkgdir/$_inifile"
}
