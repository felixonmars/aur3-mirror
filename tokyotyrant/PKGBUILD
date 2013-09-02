# # Maintainer: Angel Velasquez <angvp@archlinux.org> 
# Contributor: Paul Sadauskas <psadauskas@gmail.com>
# Contributor: Skunnyk <skunnyk@archlinux.fr>

pkgname=tokyotyrant
pkgver=1.1.41
pkgrel=3
pkgdesc="Network interface to TokyoCabinet (with lua enabled)"
arch=('i686' 'x86_64')
url="http://www.fallabs.com"
license=('LGPL')
makedepends=('gcc>=3.1' 'make' 'pkgconfig' 'lua51')
depends=('zlib' 'bzip2' 'tokyocabinet>=1.4.27')
source=("http://fallabs.com/$pkgname/$pkgname-$pkgver.tar.gz"
        "tokyotyrant.rc"
        "tokyotyrant.conf"
	"fix-build.patch")

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  patch -p1 < ../fix-build.patch 
  ./configure --prefix=/usr --enable-lua 
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install || return 1
  install -m 644 -D ../../tokyotyrant.conf $pkgdir/etc/conf.d/ttserver || return 1
  install -m 755 -D ../../tokyotyrant.rc $pkgdir/etc/rc.d/ttserver || return 1
}
md5sums=('a47e58897bd1cbbac173d5a66cc32ae3'
         '3ed9229c9cfb8e1b3055b814d5038799'
         '2558846ece69d1f265ee1ba5728c39cd'
         '990764201967ad1cc5084282c51d2504')
