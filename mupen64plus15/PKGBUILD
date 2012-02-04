# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Zephyr

pkgname=mupen64plus15
pkgver=1.5
pkgrel=2
pkgdesc='Nintendo64 Emulator'
arch=('i686' 'x86_64')
url='http://code.google.com/p/mupen64plus/'
license=('GPL')
depends=('gtk2' 'sdl_ttf' 'yasm' 'mesa' 'libsamplerate')
makedepends=('qt')
optdepends=('qt: qt4 frontend')
provides=('mupen64plus')
conflicts=('mupen64plus')
source=("http://mupen64plus.googlecode.com/files/Mupen64Plus-${pkgver//./-}-src.tar.gz"
	'const.patch'
	'blight-input-linking.patch'
        'ftbfs-gvariant-type-conflicts.patch')
md5sums=('c224b045d343ff02f6f933d328861b01'
         'fdc6d95bade51b97ec194e5c2b511b33'
         '53f560301ee931c6e7593d765c9747e1'
         '0748445ce5df0a6cb72fd2cf93e4cbe0')

build() {
  cd Mupen64Plus-${pkgver//./-}-src

  # patching (provided by Yggdrasil) Thanks! Will remove when new version of mupen64plus comes out.
  patch -p1 <../const.patch
  patch -p1 <../blight-input-linking.patch
  # thanks to debian for having a patch :) http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=577329
  patch -p1 < ../ftbfs-gvariant-type-conflicts.patch

  make PREFIX=/usr all || return 1
  make PREFIX="$pkgdir/usr" install

  make PREFIX=/usr GUI=QT4 all
  install -m755 mupen64plus "$pkgdir/usr/bin/mupen64plus-qt"
  
  cd "$pkgdir/usr/share/applications"
  cp mupen64plus.desktop mupen64plus-qt.desktop
  sed -i "s#Name=Mupen64Plus#Name=Mupen64Plus (Qt)#" mupen64plus-qt.desktop
  sed -i "s#Exec=mupen64plus#Exec=mupen64plus-qt#" mupen64plus-qt.desktop
}
