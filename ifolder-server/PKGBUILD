# Contributor: William Rea <sillywilly@gmail.com>
pkgname=ifolder-server
pkgver=3.5.6172.1
pkgrel=1
url="http://www.ifolder.com"
pkgdesc="Opensourced iFolder Server"
backup=('etc/simias/apache/default/ifolder_admin.conf' 'etc/simias/apache/default/ifolder_webaccess.conf' \
	'etc/simias/apache/default/simias_server.conf' 'etc/simias/apache/ifolder_apache.conf' \
	'etc/simias/bill/Simias.config' 'etc/simias/Simias.config')
license="GPL"
depends=('libxml2' 'log4net' 'libflaim' 'mod_mono')
source=(http://forgeftp.novell.com/ifolder/server/3.5/20060621-0346/src/ifolder3-server-$pkgver.tar.gz)
md5sums=('ef53f842cb7e3dfdcb7377fdd92134ce')

build() {
  export MONO_SHARED_DIR=$startdir/src/.wabi
  mkdir -p $MONO_SHARED_DIR
  mkdir -p $startdir/pkg/var/lib/simias $startdir/pkg/var/log/ifolder3
  chmod 777 $startdir/pkg/var/lib/simias $startdir/pkg/var/log/ifolder3

  cd $startdir/src/ifolder3-server-$pkgver
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --with-simiasdatadir=/var/lib/simias --with-simiaslogdir=/var/log/ifolder3
  make || return 1
  make DESTDIR=$startdir/pkg install

  find $startdir/pkg/etc/simias/apache/* -name '*.conf' -exec sed -i 's|apache2/mod_mono.conf|httpd/conf/mod_mono.conf|' {} \;

  rm -r $MONO_SHARED_DIR
}
