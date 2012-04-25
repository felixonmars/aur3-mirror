# Maintainer: Kevin Berry (kb@rubyists.com)
# Contributor: said
# Contributor: Yejun Yang <yejunx AT gmail DOT com>
# Contributor: Biru Ionut <ionut@archlinux.ro>
pkgname=yate4
pkgver=4.1.0
pkgrel=1
pkgdesc="next-generation telephony engine"
arch=('i686' 'x86_64')
url="http://yate.null.ro"
license=('GPL')
depends=('speex' 'gsm' 'postgresql-libs' 'alsa-lib')
makedepends=('pkgconfig')
source=(http://yate.null.ro/tarballs/${pkgname}/yate-${pkgver}-1.tar.gz yate.init)
options=(!makeflags)

build() {
cd $srcdir/yate
export LDFLAGS="${LDFLAGS//-Wl,--as-needed}"
./configure --prefix=/usr \
  --sysconfdir=/etc \
  --with-libpq \
  --without-openh323

make || return 1
make DESTDIR=$pkgdir install
install -D -m755 $srcdir/yate.init $pkgdir/etc/rc.d/yate || return 1
}
     
md5sums=('06adaa9b8dc4f18908b35e9659ab9ad5' 'c0d344607046c47c1d75ac23d323817a')
