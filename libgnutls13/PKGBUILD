# $Id$
# Contributor: webjdm <web.jdm@gmail.com>
# Maintainer: Aurélien DESBRIÈRES <ice.cube@gmx.com>

pkgname=libgnutls13
_pkgname=gnutls
pkgver=2.0.4
pkgrel=3
pkgdesc="Ancient libgnutls.so.13 library"
arch=('i686' 'x86_64')
license=('GPL3' 'LGPL')
url="http://www.gnu.org/software/gnutls/"
options=('!libtool')
depends=('gcc-libs' 'readline' 'zlib' 'lzo2' 'libgcrypt')
source=("ftp://ftp.gnupg.org/gcrypt/gnutls/gnutls-$pkgver.tar.bz2"{,.sig}
	"http://archive.ubuntu.com/ubuntu/pool/main/g/gnutls13/gnutls13_2.0.4-1ubuntu2.7.diff.gz")
md5sums=('0d3c959ff2b3b71f840038c3441ba1f9'
	'50cc8fab9230cdb84a593a76aaf187fe'
	'6da4544c6bdac92b0f40d12ada700a97')
sha256sums=('af07625c701f4d3b2e44b6cb1f9fcf55f8b45942abdf88cfa61a95ca30d6f91f'
	'3458adcde097d858604bff980d0fbeb919df81c1e28388605d3ba28c99406d43'
	'6d2a09c8002bf6cbcc8efaf18c312263a583deb4547de02bab514400828990b5')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  # http://packages.ubuntu.com/hardy/libgnutls13

  patch -Np2 -i "$srcdir/gnutls13_2.0.4-1ubuntu2.7.diff"

  for p in patches/* ; do
	  msg2 "Patch: ${p}"
	  patch < "${p}" -p1
  done
 
  CFLAGS+=" -fstack-protector-all"

  ./configure --prefix=/usr --with-zlib --disable-guile \
	  --disable-static --enable-shared --with-pic --enable-ld-version-script
  make V=1

}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  mkdir -p -m 0755 "$pkgdir/tmp" "$pkgdir/usr/lib"
  make DESTDIR="$pkgdir/tmp" install
  cp -va "$pkgdir"/tmp/usr/lib/*13* "$pkgdir/usr/lib"
  rm -r "$pkgdir/tmp"
}
