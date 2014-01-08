# Maintainer: Jonathan Steel <jsteel at aur.archlinux.org>

pkgname=pear-net-socket
_pkgname=Net_Socket
pkgver=1.0.14
pkgrel=1
pkgdesc="Net_Socket is a class interface to TCP sockets. It provides blocking and non-blocking operation, with different reading and writing modes"
url=http://pear.php.net/package/$_pkgname
arch=('any')
license=('PHP')
makedepends=('php-pear')
source=(http://download.pear.php.net/package/$_pkgname-$pkgver.tgz)
md5sums=('b0710ca5ec75cfcde1690d39788a3eb3')
noextract=($_pkgname-$pkgver.tgz)

package() {
  pear install -R"$pkgdir" -O -n "$srcdir"/$_pkgname-$pkgver.tgz

  rm -r "$pkgdir"/usr/share/pear/{.channels,.depdb*,.filemap,.lock} "$pkgdir"/tmp
}
