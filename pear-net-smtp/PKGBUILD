# Maintainer: Jonathan Steel <jsteel at aur.archlinux.org>

pkgname=pear-net-smtp
_pkgname=Net_SMTP
pkgver=1.6.2
pkgrel=1
pkgdesc="Provides an implementation of the SMTP protocol using PEAR's Net_Socket class"
url=http://pear.php.net/package/$_pkgname
arch=('any')
license=('PHP')
depends=('pear-net-socket')
makedepends=('php-pear')
optdepends=('pear-auth-sasl2')
source=(http://download.pear.php.net/package/$_pkgname-$pkgver.tgz)
md5sums=('8b9262332948001f17110b4bfd7c15b3')
noextract=($_pkgname-$pkgver.tgz)

package() {
  pear install -R"$pkgdir" -O -n "$srcdir"/$_pkgname-$pkgver.tgz

  rm -r "$pkgdir"/usr/share/pear/{.channels,.depdb*,.filemap,.lock} "$pkgdir"/tmp
}
