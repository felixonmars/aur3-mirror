# Maintainer: qs9rx < that nick at enjoys dÃ¶t it>

pkgname=tyrquake-git
pkgver=0.r1587.b46aa1d
pkgrel=1
pkgdesc="A fairly conservative Quake/Quakeworld port. Software and GL clients for Quake and Quakeworld as well as server. Git version"
arch=('i686' 'x86_64')
url="http://disenchant.net/engine.html"
license=('GPL2')
depends=('libgl' 'libxxf86vm' 'libxxf86dga')
makedepends=('git')
conflicts=('tyrquake')
install=$pkgname.install
md5sums=('SKIP')

source=('git://disenchant.net/tyrquake')
_gitname="tyrquake"

[ "$CARCH" = "i686" ] && _ASM=Y || _ASM=N

pkgver() {
  cd $_gitname
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_gitname

  make	QBASEDIR=/usr/share/quake \
	USE_X86_ASM=$_ASM \
	OPTIMIZED_CFLAGS=N \
	STRIP=: \
	|| return 1
}

package() {
  cd $_gitname
  mkdir -p ${pkgdir}/usr/bin
  install -m755 bin/tyr* ${pkgdir}/usr/bin/
  install -Dm644 gnu.txt ${pkgdir}/usr/share/licenses/${pkgname}/gnu.txt
}
