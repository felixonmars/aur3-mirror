#Maintainer: Alex Brinister (alex_brinister@yahoo.com)
pkgname=vxworks-gcc-toolchain-bin
pkgver=1.3
pkgrel=2
pkgdesc="A GCC toolchain for VxWorks 6.3 C/C++ developement - binaries"
arch=('i686' 'x86_64')
url="http://firstforge.wpi.edu/sf/projects/c--11_toochain"
license=('GPL')
provides=('vxworks-gcc-toolchain')
depends=('zlib' 'cloog' 'isl' 'xz' 'expat')
options=('!strip' '!libtool' '!zipman')
install=$pkgname.install
if test "$CARCH" == i686; then
	source=(https://www.dropbox.com/s/en8eqkngu03trqf/$pkgname-$pkgver-$CARCH.tar.xz
			VXWORKS_LICENSE)
	sha512sums=('3248012a2dcaf7868d09e09009ae6abd2f5a45962a57587d9564e5aa6d4d36cac10206f2be7894c6bb5d4e065d63579891be4e6dc919574f999a95a400c7d358'
            	'72b3925f853d8e8bc26594cda084b3cb66a11e4fe206bb1c5e219e7c43cc56022e377f9f9822f4a8e13555a33fe9e695cddc8ac4f92c02e4f491419dd6d07c45')
else
	source=(https://www.dropbox.com/s/6rjxg0ndrxj6djo/$pkgname-$pkgver-$CARCH.tar.xz
			VXWORKS_LICENSE)
	sha512sums=('9f130f4cce12376d6638a649f7b963c0dd5e128a19f231348892cb9c43ae00dc8c5b8b917b13054f273a6ac77a3052cecbb3ec3d296591d1c24ca2c0ff1d06c0'			
				'72b3925f853d8e8bc26594cda084b3cb66a11e4fe206bb1c5e219e7c43cc56022e377f9f9822f4a8e13555a33fe9e695cddc8ac4f92c02e4f491419dd6d07c45')
fi

package(){
  cd $srcdir
  tar -xJf $pkgname-$pkgver-$CARCH.tar.xz

  cd "$pkgname-$pkgver"
  cp -dpr --no-preserve=ownership ./usr $pkgdir/

  cd $startdir && install -D -m644 VXWORKS_LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
