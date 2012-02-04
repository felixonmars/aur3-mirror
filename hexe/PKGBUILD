# Maintainer: Philipp Müller <philipp(dot)mueller(at)xi-intersection(dot)de>

pkgname=hexe
pkgver=0.0.1
pkgrel=1
pkgdesc="A nano inspired hex editor"
arch=( 'i686' 'x86_64' )
url="http://spinout182.com/?a=pr&p=hexe"
license=('custom')

depends=('ncurses')
makedepends=('ncurses')

source=(
	'http://spinout182.com/hexe/io.c'
	'http://spinout182.com/hexe/function.c'
	'http://spinout182.com/hexe/hexe.c'
	'http://spinout182.com/hexe/ui.c'
	'http://spinout182.com/hexe/hexe.h'
	'http://spinout182.com/hexe/ui_function.c'
	'http://spinout182.com/hexe/Makefile'
	)

md5sums=(
	'372c714445c9b5f26a06039ce49c41d6'
	'a338c69879a4f9292fbded29fad122c6'
	'9b476285bc45d3a51c00ccccb4fa3695'
	'6cee48c6e37204ba8996c2c223c21114'
	'282d6be92b55ddfba7a9d0c6e84c48a2'
	'198cdcc1952c089fa0def806a34010d4'
	'c1f6af02332bb1b6757a08515c3cb3cf'
	)

package() {
	make
	
	install -D -m755 ${srcdir}/hexe ${pkgdir}/usr/bin/hexe
}