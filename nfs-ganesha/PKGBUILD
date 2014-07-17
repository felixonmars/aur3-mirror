# Maintainer: Thomas Favre-Bulle <thomas.favre-bulle at bull dot net>
pkgname=nfs-ganesha
pkgver=2.1.0
pkgrel=1
pkgdesc="User space NFS server"
arch=(x86_64)
url="https://github.com/nfs-ganesha/nfs-ganesha/wiki"
license=('LGPL3')
depends=('dbus')
makedepends=('cmake' 'bison' 'flex' 'doxygen' 'krb5' 'dbus' 'xfsprogs' 'nfsidmap' 'libwbclient' 'libcap')
optdepends=('jemalloc: more scalable malloc implementation')
provides=('nfs-ganesha')
source=('https://github.com/nfs-ganesha/nfs-ganesha/archive/V2.1.0/nfs-ganesha-v2.1.0.tar.gz'
        'https://github.com/nfs-ganesha/ntirpc/archive/v1.1.0/ntirpc-1.1.0.tar.gz'
        'dbus.nfs-ganesha.conf'
        'nfs-ganesha.service')
md5sums=('e0b398e92def24f5c354c17db1ee1119'
         '18313c48592396061fae3be6428afde8'
         '4cac68afb5067d17f573de348e0f58dd'
         '157ad5fa3c079a746851eabe8f27b776')

build() {
  # Move libntirpc to ganesha's sources
  # This is only required for the build process
  mv $srcdir/ntirpc-1.1.0/* $srcdir/$pkgname-$pkgver/src/libntirpc
  # Build Ganesha
  cd $srcdir/$pkgname-$pkgver/src

  cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_CONFIG=everything -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver/src
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/etc/ganesha"
  install -Dm644 "$srcdir/nfs-ganesha.service" "$pkgdir/usr/lib/systemd/system/nfs-ganesha.service"
  install -Dm644 "$srcdir/dbus.nfs-ganesha.conf" "$pkgdir/etc/dbus-1/system.d/nfs-ganesha.conf"
  install -Dm644 "$srcdir/$pkgname-$pkgver/src/LICENSE.txt" "$pkgdir/usr/share/licenses/nfs-ganesha/LICENSE.txt"
}
