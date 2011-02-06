# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>
pkgname="mkinitcpio-mount-hook"
pkgver="0.3"
pkgrel=1
pkgdesc="Mount hook for mkinitcpio"
arch=(any)
depends=()
makedepends=()
optdepends=()
url="http://people.oh14.de/andrej/mkinitcpio-mount-hook"
source=(http://people.oh14.de/andrej/mkinitcpio-mount-hook/mkinitcpio-mount-hook-0.3-stickbuild.tar.xz)
license="MIT"

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
md5sums=('d74aea77abd0a9776e64414df3f340fd')
sha512sums=('4d3b808da7a3b3833b0a2d35d06662c28a5ab835be81be8ef9e54caf58f22d3504c58fc388684e45cce36a42765463e0cf1ce24196abd8e6888fbacd27eaec74')
