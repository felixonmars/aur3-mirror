# Contributor: Calogero Lo Leggio <kalos@autistici.org>

pkgname=bacula-wx-console
pkgver=2.2.8
pkgrel=2
pkgdesc="Bacula, the Network Backup Tool for Linux, Unix, Mac and Windows [WX console]"
arch=(i686 x86_64)
url="http://www.bacula.org"
license=('GPL')
depends=('wxgtk')
makedepends=('wxgtk')
backup=(etc/bwx-console.conf)
source=("http://downloads.sourceforge.net/sourceforge/bacula/bacula-$pkgver.tar.gz")
md5sums=('4547d0bf9f976d5d9ea5f21a7bd078ee')

build() {
  cd "$startdir/src/bacula-$pkgver"

  ./configure --prefix=/usr --sbindir=/usr/bin \
    --enable-client-only --enable-bwx-console \
    --with-x --with-tcp-wrappers --with-openssl \
    --sysconfdir=/etc/ --with-scriptdir=/etc/bacula/scripts \
    --with-archivedir=/usr/var/bacula/archive

  make || return 1

  # install only wx-console files
  mkdir -p $startdir/pkg/etc/ $startdir/pkg/usr/bin/ $startdir/pkg/usr/man/man1
  install -m755 $startdir/src/bacula-$pkgver/src/wx-console/bwx-console $startdir/pkg/usr/bin/bwx-console
  install -m644 $startdir/src/bacula-$pkgver/src/wx-console/bwx-console.conf $startdir/pkg/etc/bwx-console.conf
  install -m644 $startdir/src/bacula-$pkgver/manpages/bacula-bwxconsole.1 $startdir/pkg/usr/man/man1/bacula-bwxconsole.1
}
