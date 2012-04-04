# Maintainer Thomas Schneider <maxmusterm@gmail.com>

pkgname=fish-irssi
pkgver=1.00_RC5
pkgrel=9
pkgdesc="This is an encryption addon for irssi, it is based on blowfish and is fully compatible to original 'blowcrypt' script."
url="http://fish.sekure.us/"
arch=('i686' 'x86_64' 'i386')
license=('GPL')
depends=('irssi')
makedepends=('glib2' 'gcc' 'unzip' 'patch')
source=(http://kleinerfeigling.kl.ohost.de/backup/FiSH-irssi.v${pkgver/_/-}-source.zip makefile.patch)
md5sums=(9ee14941eb4db813101236b1b6ae98cc 6e104029a7b096fc26378fbeef6d3a1b)

build() {
  cd $startdir/src/FiSH-irssi.v${pkgver/_/-}-source
  mkdir MIRACL
  cd MIRACL
  cp ../mir_amd64 amd64
  cp ../mir_macosx macosx
  cp ../mir_sparc32 sparc32
  cp ../mir_sparc64 sparc64
  wget www.certivox.com/wp-content/themes/certivox/res/miracl.zip
  echo "Unzipping miracl.zip"
  unzip -j -o -aa -L miracl.zip
  echo "miracl.zip was unzip now start compiling"
  if [ "$CARCH" == "x86_64" ];then
  bash amd64
  else
  bash linux # (or 'bash linux64' / 'bash amd64' / 'bash macosx' / 'bash sparc32/64');
  fi
  cp miracl.a ../
  cd ..
  echo "Compiled Miracl"
  patch -Np0 -i ../makefile.patch
  echo "Patch applied"
  if [ "$CARCH" == "x86_64" ];then
  make linux64 || return 1
  else
  make || return 1 #(or 'make macosx' / 'make linux64' / 'make amd64'  / 'make sparc32/64')
  fi
  mkdir -p $startdir/pkg/usr/lib/irssi/modules/
  cp libfish.so $startdir/pkg/usr/lib/irssi/modules/
  echo "Use /load fish to load the fish Module"
}
