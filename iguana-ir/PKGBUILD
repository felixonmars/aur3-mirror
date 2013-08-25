# Original PKGBUILD came from https://github.com/terazini/abs-htpc/iguana-ir

# Maintainer:  Sterling Lombard <kb7jtz at arrl dot net>
# Contributor: Atanas Kunev <atanas dot kunev at gmail dot com>

pkgname=iguana-ir
pkgver=1.1.0
pkgrel=2
pkgdesc="IguanaWorks USB IR Transceiver driver, client and reflasher"
arch=('i686' 'x86_64')
url="http://iguanaworks.net/"
license=('GPL')
depends=('shadow' 'libusb-compat' 'python2' 'swig')
depends=()
install=iguana-ir.install
backup=('etc/conf.d/iguana-ir')
source=(http://iguanaworks.net/downloads/iguanaIR-$pkgver.tar.bz2 iguanair.service)
md5sums=('798eda1de8873c8da41fb50ffe221140'
         'df6cb934e4c1a579890927e73c7d85e2')
build() {

  cd "$srcdir/iguanaIR-$pkgver"

  PYTHON=/usr/bin/python2 ./runCmake --prefix=/usr 
  cd "$srcdir/iguanaIR-$pkgver/build"
  make || return 1
  make DESTDIR="$pkgdir" RPM_OS="True" install
  cd ../..

  # we support only systemd 
  rm -rf "$pkgdir/etc/init.d"

  # the environment configuration file
  mkdir -p "$pkgdir/etc/conf.d"
  mv "$pkgdir/etc/default/iguanaIR" "$pkgdir/etc/conf.d/iguana-ir"
  rmdir "$pkgdir/etc/default"

  # copy the service file
  install "iguanair.service" -D "$pkgdir/usr/lib/systemd/system/iguanair.service"

  #if [ "$CARCH" == "x86_64" ];then
   # mv "$pkgdir/usr/lib64/libiguanaIR.so.0" "$pkgdir/usr/lib/libiguanaIR.so.0"
    #mv "$pkgdir/usr/lib64/libiguanaIR.so" "$pkgdir/usr/lib/libiguanaIR.so"
    #rmdir "$pkgdir/usr/lib64"
  #fi
}


