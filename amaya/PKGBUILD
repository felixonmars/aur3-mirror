# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Zerial <fernando@zerial.org>
# Contributor: Dalius <dagis@takas.lt>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
pkgname=amaya
pkgver=11.4.4
pkgrel=2
pkgdesc="W3C's WYSIWYG HTML Editor"
arch=('i686' 'x86_64')
url="http://www.w3.org/Amaya/"
license=('W3C')
depends=('wxgtk' 'mesa' 'raptor1')
options=('!makeflags')
install=$pkgname.install
source=(amaya-fix-thotlib-png14.patch \
  amaya-wakeupidle.patch \
  amaya-splitmode.patch \
  amaya-wxyield.patch \
  explicite_linking.patch \
  ftp://ftp.w3.org/pub/$pkgname/$pkgname-sources-$pkgver.tgz \
  http://www.w3.org/Amaya/Distribution/Dutch.tgz \
  http://www.w3.org/Amaya/Distribution/German.tgz \
  http://www.w3.org/Amaya/Distribution/Italian.tgz \
  http://www.w3.org/Amaya/Distribution/Spanish.tgz \
  http://www.w3.org/Amaya/Distribution/Swedish.tgz)
md5sums=('0418f3a614e6d0a8e27ae038c78d8c4d'
         '32347b32aded742b705a2038416f74de'
         'bc42d4b3ff7b43c8d0f7955dd1498b01'
         'c42175f9cc9e90277547828b9cf6a92a'
         '55687c985a1cab4a5d83f5aae9d06e34'
         'e8072c7b1d06b983951c56e9f51fbacf'
         '3edb9cce5ce160d7270b23808c1d5981'
         '400eeeae974a64d23de4fcdd609c30bc'
         '05e2d25ee8af11faaaa25a33da89d504'
         'b504a75cd0f789a3046bf2041067b18b'
         '6536ab2e31e3f58618ba79d9fddc7f76')
  noextract=('Dutch.tgz' 'German.tgz' 'Italian.tgz' 'Spanish.tgz' 'Swedish.tgz')

build() {
	cd $srcdir/Amaya$pkgver
	patch -p1 < $srcdir/amaya-fix-thotlib-png14.patch 
	patch -p1 < $srcdir/amaya-wakeupidle.patch 
	patch -p1 < $srcdir/amaya-splitmode.patch
	patch -p1 < $srcdir/amaya-wxyield.patch
	patch -p1 < $srcdir/explicite_linking.patch

	cd Amaya
	if [ -d ./WX ]; then
	  rm -rf WX
	fi
	mkdir WX; cd WX

	rm $srcdir/Amaya$pkgver/Mesa/Makefile # to use system's mesa
	../configure --prefix=/usr/share --exec=/usr/share \
	  --datadir=/usr/share --enable-system-raptor --enable-system-wx

	make
}

package() {
  cd $srcdir/Amaya$pkgver/Amaya/WX
  install -d $pkgdir/usr/share/Amaya/resources/{svg,icons}
  make prefix=$pkgdir/usr/share install
  install -Dm755 $pkgdir/usr/share/Amaya/wx/bin/amaya $pkgdir/usr/bin/amaya
  rm $pkgdir/usr/share/Amaya/wx/bin/amaya
  cd $pkgdir/usr/share/Amaya/dicopar
  bsdtar xvf $srcdir/Dutch.tgz 
  bsdtar xvf $srcdir/German.tgz 
  bsdtar xvf $srcdir/Italian.tgz 
  bsdtar xvf $srcdir/Spanish.tgz 
  bsdtar xvf $srcdir/Swedish.tgz
}
