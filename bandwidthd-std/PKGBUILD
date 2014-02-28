# Maintainer: Daniel Douat <daniel@douat.fr>
# Contributor: p2k <Patrick.Schneider@uni-ulm.de>
pkgname=bandwidthd-std
pkgver=2.0.1
pkgrel=3
pkgdesc="Track usage of TCP/IP network subnets and builds html files with graphs\
         to display utilization. This package install daemon in stantard dirs"
arch=('i686' 'x86_64')
url="http://bandwidthd.sourceforge.net/"
license=('GPL')
depends=('libpcap' 'libpng' 'gd')
optdepends=('postgresql' 'php')
conflicts=('bandwidthd')
backup=(etc/pacman.conf,var/www/htdocs)
source=(http://downloads.sourceforge.net/bandwidthd/bandwidthd-$pkgver.tgz
        http://download.ifbretagne.net/linux/archlinux/$pkgname/bandwidthd.service
        http://download.ifbretagne.net/linux/archlinux/$pkgname/$pkgname-setDefaultPath.patch)
md5sums=('aa79aad7bd489fd2cae1f7dc086ca8b6'
         '952cc344cebc5494e5c488ae146d33d7'
         'f3cd129477ee6539c998b8a6c2c0f903')

prepare() {
  cd "$srcdir/bandwidthd-$pkgver"
  patch -uNp0 -i ../$pkgname-setDefaultPath.patch
}

build() {
  cd "$srcdir/bandwidthd-$pkgver"
  ./configure
}

package() {
  cd "$srcdir/bandwidthd-$pkgver"
  make DESTDIR="$pkgdir/" install
  target="$pkgdir"
  cp README schema.postgresql "$target/var/www/bandwidthd/"
  # Some compatibility patches
  mkdir "$target/var/www/bandwidthd/phphtdocs"
  cd phphtdocs/
  for f in *.php config.conf;do
    sed -e 's/<?/<?php /g' -e 's/<?php =/<?php echo /g' < $f > "$target/var/www/bandwidthd/phphtdocs/$f"
  done
  cp bd_pgsql_purge.sh legend.gif logo.gif "$target/var/www/bandwidthd/phphtdocs"
  cd ..
  # systemd
  install -D "../bandwidthd.service" "$pkgdir/usr/lib/systemd/system/bandwidthd.service"
}
