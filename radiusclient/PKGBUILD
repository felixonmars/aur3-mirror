# Contributor: Alexander Drozdov <adrozdoff@gmail.com>
pkgname=radiusclient
# note: if the pkgver had been '0.99-10' then use an underscore. like '0.99_10'
pkgver=0.3.2
pkgrel=1
pkgdesc="RADIUS protocol client and library"
arch=(i686 x86_64)
url="ftp://ftp.cityline.net/pub/radiusclient"
license=('GPL')
depends=(glibc)
backup=(etc/radiusclient/radiusclient.conf etc/radiusclient/servers)
source=(ftp://ftp.cityline.net/pub/${pkgname}/${pkgname}-${pkgver}.tar.gz radiusclient-config.sub-x86_64-fix.diff)
md5sums=(dd6a85f2f6fcb944cbf1dddd05ab132f 177561078901c57f265f13991fca34b9)

build() {
  cd $startdir/src/$pkgname-$pkgver
  
  patch -p0 < ../radiusclient-config.sub-x86_64-fix.diff
  
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1

  make DESTDIR=$startdir/pkg install
}
