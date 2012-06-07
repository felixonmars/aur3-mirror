# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Zerial <fernando@zerial.org>
# Contributor: Dalius <dagis@takas.lt>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
pkgname=amaya
pkgver=11.4.4
pkgrel=7
pkgdesc="W3C's WYSIWYG HTML Editor"
arch=('i686' 'x86_64')
url="http://www.w3.org/Amaya/"
license=('W3C')
depends=('wxgtk' 'mesa' 'raptor1' 'libwww')
makedepends=('perl' 'raptor')
options=('!makeflags')
install=$pkgname.install
source=(amaya-fix-thotlib-png15.patch \
  amaya-wakeupidle.patch \
  amaya-splitmode.patch \
  amaya-wxyield.patch \
  explicite_linking2.patch \
  gzread.patch \
  amaya-11.4.4-socketbufsize.patch \
  ftp://ftp.w3.org/pub/$pkgname/$pkgname-sources-$pkgver.tgz \
  http://www.w3.org/Amaya/Distribution/Dutch.tgz \
  http://www.w3.org/Amaya/Distribution/German.tgz \
  http://www.w3.org/Amaya/Distribution/Italian.tgz \
  http://www.w3.org/Amaya/Distribution/Spanish.tgz \
  http://www.w3.org/Amaya/Distribution/Swedish.tgz)
md5sums=('6ebd78d57ee0a4b30b2dfb3369439288'
         '32347b32aded742b705a2038416f74de'
         'bc42d4b3ff7b43c8d0f7955dd1498b01'
         'c42175f9cc9e90277547828b9cf6a92a'
         '572cdeaa2a6b318217f69c37edee116c'
         'f35ae7158133b6d39aa6a83e11bc261b'
         '9fc28d3fd4da1147f8baefa46ec3ae52'
         'e8072c7b1d06b983951c56e9f51fbacf'
         '3edb9cce5ce160d7270b23808c1d5981'
         '400eeeae974a64d23de4fcdd609c30bc'
         '05e2d25ee8af11faaaa25a33da89d504'
         'b504a75cd0f789a3046bf2041067b18b'
         '6536ab2e31e3f58618ba79d9fddc7f76')

build() {
  cd $srcdir/Amaya$pkgver
  patch -p1 < $srcdir/amaya-fix-thotlib-png15.patch 
  patch -p1 < $srcdir/amaya-wakeupidle.patch 
  patch -p1 < $srcdir/amaya-splitmode.patch
  patch -p1 < $srcdir/amaya-wxyield.patch
  patch -p1 < $srcdir/explicite_linking2.patch
  patch -p1 < $srcdir/gzread.patch
  patch -p1 < $srcdir/amaya-11.4.4-socketbufsize.patch
  
  cd Mesa/configs
  rm current
  [[ $CARCH == x86_64 ]] && ln -s linux-x86-64 current
  [[ $CARCH == i686 ]] && ln -s linux-x86 current
  cd ../../Amaya
  
  if [ -d ./WX ]; then
    rm -rf WX
  fi
  mkdir WX; cd WX
  
  ../configure --prefix=/usr/share --exec=/usr/share \
    --datadir=/usr/share --enable-system-raptor \
    --enable-system-wx --enable-system-libwww 
  make
}

package() {
  cd $srcdir/Amaya$pkgver/Amaya/WX
  install -d $pkgdir/usr/share/Amaya/resources/{svg,icons}
  make prefix=$pkgdir/usr/bin install

  install -Dm755 $pkgdir/usr/bin/Amaya/wx/bin/amaya $pkgdir/usr/bin/amaya
  rm $pkgdir/usr/bin/Amaya/wx/bin/amaya
  sed -i s+share+bin+ $pkgdir/usr/bin/amaya

  cd $srcdir
  for _i in Dutch German Italian Spanish Swedish
  do
    bsdtar xf $srcdir/${_i}.tgz
  done
  for _i in Gprinc.dic Iprinc.dic Nprinc.dic Sprinc.dic	Wprinc.dic
  do
    install -Dm644 ${_i} $pkgdir/usr/share/Amaya/dicopar/${_i}
  done
  install -d $pkgdir/usr/share/doc/amaya
  cp -r $srcdir/Amaya$pkgver/Amaya/doc/* $pkgdir/usr/share/doc/amaya
}
