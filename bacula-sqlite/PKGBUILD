# Contributor: Calogero Lo Leggio <kalos@autistici.org>

pkgname=bacula-sqlite
pkgver=5.0.3
pkgrel=1
pkgdesc="Bacula, the Network Backup Tool for Linux, Unix, Mac and Windows. [sqlite3 DB]"
arch=('i686' 'x86_64')
url="http://www.bacula.org"
license=('GPL')
depends=('sqlite3')
makedepends=('sqlite3')
conflicts=('bacula' 'bacula-postgresql')
backup=(etc/bacula/bacula-{dir,fd,sd}.conf etc/bacula/bconsole.conf)
install="bacula.install"
source=("http://downloads.sourceforge.net/sourceforge/bacula/bacula-$pkgver.tar.gz"
        "bacula-dir" "bacula-fd" "bacula-sd")
md5sums=('9de254ae39cab0587fdb2f5d8d90b03b'
         '384cdc720ba2c46dc942caced4f6a0d7'
         '2b4895573289e6f71582e75fb1812a52'
         '9bf6e300e81b1f23111dba1c85bc28b8')

build() {
  cd "$srcdir/bacula-$pkgver"

  ./configure --prefix=/usr \
    --enable-build-dird --enable-build-stored \
    --with-sqlite3 --without-tcp-wrappers --with-openssl \
    --with-dir-user=bacula-dir --with-dir-group=bacula-dir \
    --with-sd-user=bacula-sd --with-sd-group=bacula-sd \
    --with-fd-user=bacula-fd --with-fd-group=bacula-fd \
    --sysconfdir=/etc/bacula --with-scriptdir=/etc/bacula/scripts \
    --with-archivedir=/usr/var/bacula/archive

  make 
}

package () {
  cd "$srcdir/bacula-$pkgver"
  make DESTDIR="$pkgdir" install 

  # install the init script
  install -D -m755 $srcdir/bacula-dir $pkgdir/etc/rc.d/bacula-dir
  install -D -m755 $srcdir/bacula-fd $pkgdir/etc/rc.d/bacula-fd
  install -D -m755 $srcdir/bacula-sd $pkgdir/etc/rc.d/bacula-sd
}
