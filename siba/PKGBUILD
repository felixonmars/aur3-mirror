# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>
pkgname="siba"
pkgver="1.2"
pkgrel=1
pkgdesc="Simple Backup"
arch=(i686 x86_64)
depends=()
makedepends=()
optdepends=()
url="http://gitorious.org/siba/pages/Home"
source=(http://people.oh14.de/andrej/siba/siba-1.2-stickbuild.tar.xz)
license="custom"

export PREFIX=/usr
export ETCDIR=/etc
export BINDIR=$PREFIX/bin
export LIBDIR=$PREFIX/lib
export DESTDIR="$pkgdir"

build()
{
 cd "$srcdir/$pkgname-$pkgver"
 make
}

package()
{
 cd "$srcdir/$pkgname-$pkgver"
 if [ -e LICENSE ]
 then
  [ -e "$pkgdir/usr/share/licenses/$pkgname" ] || mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  cp LICENSE "$pkgdir/usr/share/licenses/$pkgname"
 fi
 make install
}
md5sums=('1f22015c146d35ee857a26a8c37f0972')
sha512sums=('be1487e81d1330655097197cb6c0045aa9890671f12c65c4021c4200bc65bbf8767d65c4a872328cae9f18b44e4098f4eb5a5fdbaaedc7e8d812a63047f740c2')
