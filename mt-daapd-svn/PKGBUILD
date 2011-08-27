# Contributor: Ricardo Martins <meqif@swearing-ape.net>
pkgname=mt-daapd-svn
pkgver=1463
pkgrel=1
pkgdesc="An open-source media server for the Roku SoundBridge and Apple iTunes which supports server-side transcoding and other advanced features."
url="http://www.fireflymediaserver.org/"
license=('GPL' 'custom:ASPL')
depends=('flac' 'libid3tag' 'sqlite3' 'libvorbis' 'avahi' 'vorbis-tools')
makedepends=()
provides=('mt-daapd')
conflicts=('mt-daapd')
replaces=()
backup=(etc/mt-daapd.conf)
install=
source=(http://nightlies.mt-daapd.org/$pkgname-$pkgver.tar.gz \
	mt-daapd)
md5sums=('2f918d7dbe09f06153de90cba7e2df9b' \
	'96156b11573d513785a7e94399d8a6e4')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --enable-flac --enable-avahi --enable-oggvorbis --enable-sqlite3
  make || return 1
  make DESTDIR=$startdir/pkg install
  mkdir -p $startdir/pkg/etc/rc.d
  cp $startdir/mt-daapd $startdir/pkg/etc/rc.d/mt-daapd
  cp $startdir/src/$pkgname-$pkgver/contrib/mt-daapd.conf $startdir/pkg/etc/mt-daapd.conf
  mkdir -p $startdir/pkg/usr/share/licenses/$pkgname
  cp $startdir/src/$pkgname-$pkgver/admin-root/aspl-license.txt $startdir/pkg/usr/share/licenses/$pkgname/aspl-license.txt
}
