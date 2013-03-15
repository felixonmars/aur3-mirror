#Maintainer: Alex Brinister (alex_brinister@yahoo.com)
pkgname=frc-gcc-tools
pkgver=1.2
pkgrel=2
pkgdesc="Some FRC-specific stuff for the VxWorks 6.3 GCC Toolchain"
arch=(any)
provides=('frc-gcc-tools')
url="http://firstforge.wpi.edu/sf/projects/c--11_toochain"
license=('custom=FRC-BSD')
depends=('wput' 'cmake' 'vxworks-gcc-toolchain-bin>=1.2')
options=('!strip' 'libtool' '!zipman')
install=$pkgname.install
source=(https://www.dropbox.com/s/4zqz2tb5imdtq74/$pkgname-$pkgver.tar.xz
		LICENSE)
sha512sums=('34d75be8daed0592cda078969a3a573f7414afedb1dda9c15a6ad31586ee5e7e8eae1a7ec732172ed51bc126f294456d9015c72e7b968e6cbd4a937e8693dd12'
            '398dcff3a3229acea7f7d6e43898fe12003150a7b86d58a5bcda0df54635bea94387e0a09dccfefcb62f186d74a60cd031e733d991354e019ac85c7be99cc780')

package() {
  cd $srcdir
  tar -xJf $pkgname-$pkgver.tar.xz

  cd "$pkgname-$pkgver"
  cp -dpr --no-preserve=ownership ./usr $pkgdir/

  cd $startdir && install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
