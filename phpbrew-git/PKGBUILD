# Maintainer: Francisco Lopes <chico.lopes (a) gmail (dot) com>

pkgname='phpbrew-git'
pkgver=1.13.1.r18.g496c040
pkgrel=1
pkgdesc='Brew & manage PHP versions in pure PHP at HOME'
arch=('any')
url='http://c9s.github.io/phpbrew/'
license=('MIT')
depends=('php')
makedepends=('git')
source=('git+https://github.com/c9s/phpbrew.git')
md5sums=('SKIP')
conflicts=('phpbrew')
provides=('phpbrew')
install=$pkgname.install

_gitname=phpbrew

pkgver() {
    cd $srcdir/$_gitname
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    install -D -m755 $srcdir/$_gitname/phpbrew $pkgdir/usr/share/webapps/bin/phpbrew.phar
    install -D -m644 $srcdir/$_gitname/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
    install -D -m644 $srcdir/$_gitname/completion/bash/_phpbrew $pkgdir/usr/share/bash-completion/completions/phpbrew
    install -D -m644 $srcdir/$_gitname/completion/zsh/_phpbrew $pkgdir/usr/share/zsh/site-functions/_phpbrew

    install -d $pkgdir/usr/bin
    ln -s /usr/share/webapps/bin/phpbrew.phar $pkgdir/usr/bin/phpbrew
}
