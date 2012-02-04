# $Id $
# Maintainer: Alexander Mieland (dma147) <dma147@linux-stats.org>
# Contributor: Alexander Mieland (dma147) <dma147@linux-stats.org>

pkgname=list
pkgver=1.9.91
pkgrel=1
pkgdesc="Python client from linux-stats.org. It collects all relevant information for making statistics about linux and its hard- and software"
depends=('bash' 'python>=2.3' 'diffutils' 'grep' 'sed' 'util-linux' 'scrot')
install="$pkgname.install"
source=(http://www.linux-stats.org/download/LiSt-$pkgver.tar.bz2 \
	$pkgname.install)
url="http://www.linux-stats.org"
md5sums=('5b9345e833f6033b5f7645d26ca3e001' '996f16471f5b58b1a4fbd6b6f5adcc4c')

build() {
  cd $startdir/src/LiSt-$pkgver
  mkdir -p $startdir/pkg/usr/bin
  install -D -m755 src/LiSt $startdir/pkg/usr/bin/LiSt
  chown root:stats $startdir/pkg/usr/bin/LiSt
  mkdir -p $startdir/pkg/etc/LiSt
  chown root:stats $startdir/pkg/etc/LiSt
  chmod -R g+w $startdir/pkg/etc/LiSt
  # install -d -D -m644 doc/README doc/INSTALL doc/COPYING doc/AUTHORS $startdir/pkg/usr/share/doc/LiSt-$pkgver/
}
