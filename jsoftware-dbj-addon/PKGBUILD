# Contributor: Lorenzo Tomei <tomeil@tiscali.it>

pkgname=jsoftware-dbj-addon
pkgver=2.5.2
pkgrel=1
pkgdesc="DBMS developed in J programming language"
arch=('any')
url="http://www.databaserossoverde.it/jsoftware"
license=('GPL')
depends=('jsoftware' 'sudo')
source=(http://www.databaserossoverde.it/jsoftware/data_dbj_${pkgver}_linux.tar.gz)
md5sums=('8e3b74fe312d18a492b360e0f432ab75')

build() {
  cd $startdir/src
  mkdir -p $startdir/pkg/usr/lib/j/addons
  cp -a data $startdir/pkg/usr/lib/j/addons/
  mkdir -p $startdir/pkg/usr/share/applications
  cp $startdir/pkg/usr/lib/j/addons/data/dbj/examples/dbj.desktop $startdir/pkg/usr/share/applications/
  mkdir -p $startdir/pkg/etc/rc.d
  cp $startdir/pkg/usr/lib/j/addons/data/dbj/examples/dbjd.conf $startdir/pkg/etc/
  cp $startdir/pkg/usr/lib/j/addons/data/dbj/examples/dbjd $startdir/pkg/etc/rc.d/
  chmod +x $startdir/pkg/etc/rc.d/dbjd
}
