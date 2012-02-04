# Maintainer: Michael Trunner <archlinux@michael.trunner.de>
pkgname=libnss-pgsql
pkgver=1.5.0_beta
_pkgver=1.5.0-beta
pkgrel=6
pkgdesc="libnss-pgsql 1.5.0-beta"
arch=('x86_64')
url="http://pgfoundry.org/projects/sysauth/"
license=('GPL')
groups=()
depends=(postgresql-libs)
makedepends=(xmlto docbook-xsl)
optdepends=()
provides=()
conflicts=('authpgsql')
replaces=()
backup=('etc/nss-pgsql.conf' 'etc/nss-pgsql-root.conf')
options=()
install=
changelog=$pkgname.changelog
source=(http://pgfoundry.org/frs/download.php/1878/$pkgname-$pkgver.tgz
        beta-exit-in-library.patch
        libpg-fe.patch
        add_primary_group.patch
        getgr-conf.patch
	fallback.patch)
noextract=()
md5sums=('8d86f1dd93799c365691a3322e107732'
         '35eb9dda236701973bd00abf522682d1'
         '1306b001ddd33427693321f489d5dc36'
         '28f18a19b8f35cc35448507ca322e1da'
         '062b40577bd385fc3d45175d8af87efa'
         '4ba1ac481b6c7be75bdd0975948a286b')

build() {
  cd "$srcdir/$pkgname-$_pkgver"
  patch -p 1 < ../libpg-fe.patch
  patch -p 1 < ../beta-exit-in-library.patch
  patch -p 1 < ../add_primary_group.patch
  patch -p 1 < ../getgr-conf.patch
  patch -p 1 < ../fallback.patch
  ./configure --libdir=/lib --sysconfdir=/etc --prefix=/
  make
  make DESTDIR="$pkgdir/" install
  install -D -o root -g root -m 644 conf/nss-pgsql.conf $pkgdir/etc/nss-pgsql.conf
  install -D -o root -g root -m 600 conf/nss-pgsql-root.conf $pkgdir/etc/nss-pgsql-root.conf
  install -D -o root -g root -m 644 conf/nsswitch.conf $pkgdir/usr/share/doc/nsspgsql/nsswitch.conf
  install -D -o root -g root -m 644 conf/dbschema.sql $pkgdir/usr/share/doc/nsspgsql/dbschema.sql
  install -D -o root -g root -m 644 README $pkgdir/usr/share/doc/nsspgsql/README
  install -D -o root -g root -m 644 INSTALL $pkgdir/usr/share/doc/nsspgsql/INSTALL
  install -D -o root -g root -m 644 ChangeLog $pkgdir/usr/share/doc/nsspgsql/ChangeLog
  cd $pkgdir
  mkdir -p usr/share/doc/nsspgsql
  mv doc/* usr/share/doc/nsspgsql
  rm -Rf doc
}
# vim:set ts=2 sw=2 et:
