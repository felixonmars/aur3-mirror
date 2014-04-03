# Maintainer: Francisco Lopes <chico.lopes (a) gmail (dot) com>

pkgname='php-phpbrew-git'
pkgver=1097.496c040
pkgrel=1
pkgdesc='Brew & manage PHP versions in pure PHP at HOME'
arch=('any')
url='http://c9s.github.io/phpbrew/'
license=('MIT')
depends=('php')
makedepends=('git')
source=('git+https://github.com/c9s/phpbrew.git')
md5sums=('SKIP')
conflicts=('php-phpbrew')
provides=('php-phpbrew')
install=$pkgname.install

_gitname=phpbrew

pkgver() {
    cd $srcdir/$_gitname
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    install -D -m755 $srcdir/$_gitname/phpbrew $pkgdir/usr/share/webapps/bin/phpbrew.phar
    install -D -m644 $srcdir/$_gitname/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

    install -d $pkgdir/usr/bin
    ln -s /usr/share/webapps/bin/phpbrew.phar $pkgdir/usr/bin/phpbrew
}
