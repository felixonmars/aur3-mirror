# Contributor: p2k <Patrick.Schneider@uni-ulm.de>
pkgname=bandwidthd
pkgver=2.0.1
pkgrel=1
pkgdesc="Tracks usage of TCP/IP network subnets and builds html files with graphs to display utilization."
arch=('i686' 'x86_64')
url="http://bandwidthd.sourceforge.net/"
license=('GPL')
depends=('libpcap' 'libpng' 'gd')
optdepends=('postgresql' 'php')
backup=(/opt/bandwidthd/etc/bandwidthd.conf)
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tgz bandwidthd)
md5sums=('aa79aad7bd489fd2cae1f7dc086ca8b6'
         'cff9b0467a648ceffa6f54bf06612135')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/opt
  make || return 1
  make DESTDIR="$pkgdir" install
  
  target="$pkgdir/opt/$pkgname"

  cp README schema.postgresql "$target"
  # Some compatibility patches
  mkdir "$target/phphtdocs"
  cd phphtdocs/
  for f in *.php config.conf;do
    sed -e 's/<?/<?php /g' -e 's/<?php =/<?php echo /g' < $f > "$target/phphtdocs/$f"
  done
  cp bd_pgsql_purge.sh legend.gif logo.gif "$target/phphtdocs"
  cd ..

  # Daemon wrapper
  install -D "$srcdir/bandwidthd" "$pkgdir/etc/rc.d/bandwidthd"
}

# vim:set ts=2 sw=2 et:
