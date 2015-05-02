# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Thanks to Alessio 'mOLOk' Bolognino

pkgname=libixp
pkgver=0.5
pkgrel=3
pkgdesc="A standalone client/server 9p library"
arch=('i686' 'x86_64')
url="http://libs.suckless.org/libixp"
license=('MIT')
depends=('glibc')
options=(!makeflags)
source=("http://dl.suckless.org/libs/libixp-$pkgver.tar.gz")
sha512sums=('20a87a5203a504e5569ae288b285948ac34f889c84bc9f95c977092986123e895ce5ad99ffb5153515ef7065e5df7d3ed84ba81e288d8978d29ad07398e0c338')

package() {
  cd $srcdir/$pkgname-$pkgver
  make PREFIX=$pkgdir/usr install
  install -m644 -D ./libixp/LICENSE \
                   $pkgdir/usr/share/licenses/libixp/LICENSE
}
