pkgname=php-shell
pkgver=0.3.1
pkgrel=2
pkgdesc="Advanced interactive command line shell for PHP (with fatal error handling)"
url="http://jan.kneschke.de/projects/php-shell/"
depends=('php')
source=(http://jan.kneschke.de/assets/2007/2/17/PHP_Shell-0.3.1.tgz
        php-shell
        php-shell-cmd.patch)
md5sums=('0e5487d675dd7451138c599265a02af7'
         '1a552f55c3dc34e5f59e185515ae3661'
         '69574ab2ed84005961c39228fb7cf655')
arch=('x86_64' 'i686')
license=('GPL')

build() {
  cd "$srcdir/PHP_Shell-$pkgver"
  patch -Np0 -i "$srcdir/php-shell-cmd.patch"
}

package() {
  cd "$srcdir/PHP_Shell-$pkgver"

  mkdir -p "$pkgdir/usr/share/php-shell"
  cp -r PHP "$pkgdir/usr/share/php-shell/"
  cp scripts/php-shell-cmd.php "$pkgdir/usr/share/php-shell/"
  install -D -m755 "$srcdir/php-shell" "$pkgdir/usr/bin/php-shell"
}
