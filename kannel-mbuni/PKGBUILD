# Contributor: Essien Ita Essien <me@essienitaessien.com>

pkgname=kannel-mbuni
pkgver=cvs.2006.11.23
pkgrel=2
pkgdesc="Opensource WAP/MMS Gateway Patched for Mbuni MMS/VAS Gateway"
url="http://www.mbuni.org"
license=("custom:KSL")
depends=('libxml2>=2.2.5' 'libmysqlclient' 'postgresql-libs')
arch=(i686 x86_64)
makedepends=()
conflicts=(kannel)
provides=(kannel)
groups=(wasp-core)
backup=(etc/kannel.conf)
source=(http://www.mbuni.org/downloads/1.2.0/kannel-snapshot.tar.gz kannel.conf modems.conf rc.bearerbox rc.wapbox rc.smsbox COPYING)
md5sums=('07e312bf076ce856081659f97cfba098'
         '8516af5ab9ee48fb8e7d687ab9f8b8a6'
         '8420dd67817fbbbcd25cf22375c750de'
         'd18ebbd1bf4cb3e8bc7c4e2a76f13029'
         'd79fa90fea396d9699860f91448f571e'
         '82cda8e92b07259d55a4c9fef0a8baea'
         '03e9fa6510e7957e651adbe338deabd2')

build() {
  cd $startdir/src/kannel-snapshot
  ./configure --prefix=/usr --with-pgsql --with-mysql
  make || return 1
  make DESTDIR=$startdir/pkg install
  make DESTDIR=$startdir/pkg install-test

  install -D -m 664 $startdir/src/kannel.conf $startdir/pkg/etc/kannel/kannel.conf
  install -D -m 664 $startdir/src/modems.conf $startdir/pkg/etc/kannel/modems.conf

  install -D -m 775 $startdir/src/rc.bearerbox $startdir/pkg/etc/rc.d/bearerbox
  install -D -m 775 $startdir/src/rc.smsbox $startdir/pkg/etc/rc.d/smsbox
  install -D -m 775 $startdir/src/rc.wapbox $startdir/pkg/etc/rc.d/wapbox

  install -D -m 644 $startdir/src/COPYING $startdir/pkg/usr/share/licenses/$pkgname/COPYING

  mkdir -p $startdir/pkg/var/log/kannel
}

