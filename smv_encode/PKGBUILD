# Contributor: Ali H. Caliskan <ali.h.caliskan//gmail.com>

pkgname=smv_encode
pkgver=0.58
pkgrel=1
pkgdesc="Sigmatel Motion Video (smv) encoder for Linux"
arch=('i686' 'x86_64')
url="http://www.cs.bgu.ac.il/~yurac/interests/smv-encode"
license=('MIT')
depends=('gtkmm' 'libglademm' 'ffmpeg')
source=("http://www.cs.bgu.ac.il/~yurac/interests/smv-encode/package/smv-encode_$pkgver.tar.gz")
md5sums=('cd1eb88b64951a625e26813be23084e0')

build() {
  cd $srcdir/smv-encode-$pkgver
  autoreconf -i -f
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}


