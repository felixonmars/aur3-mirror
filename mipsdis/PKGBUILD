# Maintainer: Philipp Müller <philipp(dot)mueller(at)xi-intersection(dot)de>

pkgname=mipsdis
pkgver=0.0.1
pkgrel=1
pkgdesc="A mips disassembler, especially for R4300i (Nintendo 64)"
arch=( 'i686' 'x86_64' )
url="http://spinout182.com/?a=pr&p=mipsd"
license=('custom')

source=(
	'http://spinout182.com/mipsdis/cop0.c'
	'http://spinout182.com/mipsdis/cop1.c'
	'http://spinout182.com/mipsdis/r3400i.h'
	'http://spinout182.com/mipsdis/Makefile'
	'http://spinout182.com/mipsdis/mipsdis.c'
	)

md5sums=(
	'fc4ec32feb7036dc1bd120afc98adf65'
	'e37a00a3e0f223c49876f2dc9018b679'
	'1402f6ea53fed8292a2c11e53e9ab89e'
	'b75c75f4969424c6aa6299d3dea0798e'
	'4e96a1c2eb1145603a94d63058a9ef22'
	)

package() {
	make
	
	install -D -m755 ${srcdir}/mipsdis ${pkgdir}/usr/bin/mipsdis
}