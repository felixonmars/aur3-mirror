# Maintainer: PyroPeter <abi1789 @ googlemail . com>
pkgname=php-fcgid
pkgver=0.1
pkgrel=1
pkgdesc="Runs a php-fastcgi at port 1026 (usefull with lighttpd-svn)"
url="http://aur.archlinux.org/"
arch=('any')
license=('unknown')
depends=('bash' 'php-cgi')
source=('php-fcgi')
md5sums=('c80d34689ea0afef49c2c8eb47457756')

package() {
  install -Dm0755 $srcdir/php-fcgi $pkgdir/etc/rc.d/php-fcgi
}

# vim:set ts=2 sw=2 et:
