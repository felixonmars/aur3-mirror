# Maintainer: Gadget3000 <gadget3000 at msn dot com>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=tyrquake
pkgver=0.61
pkgrel=1
pkgdesc="A fairly conservative Quake/Quakeworld port"
arch=('i686' 'x86_64')
url="http://disenchant.net/engine.html"
license=('GPL')
depends=('libgl' 'libxxf86vm' 'libxxf86dga')
install=$pkgname.install
source=(http://disenchant.net/files/engine/$pkgname-$pkgver.tar.gz)
md5sums=('d005f0eae0dabf2326866213bbacacd7')

[ "$CARCH" = "i686" ] && _ASM=Y || _ASM=N

build() {
  cd $pkgname-$pkgver

  make	QBASEDIR=/usr/share/quake \
	USE_X86_ASM=$_ASM \
	OPTIMIZED_CFLAGS=N \
	STRIP=: \
	|| return 1

  mkdir -p $pkgdir/usr/{bin,share/quake}
  install -m755 tyr* $pkgdir/usr/bin/
}
