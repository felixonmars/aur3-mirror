# Maintainer: Schnouki <thomas.jost@gmail.com>
pkgname=enigmail-tb2
_pkgname=enigmail
pkgver=0.96.0
_tb_ver=2.0.0.24
pkgrel=2
pkgdesc="OpenPGP security for Thunderbird 2"
arch=(i686 x86_64)
url="http://enigmail.mozdev.org/home/index.php"
license=('MPL/GPL')
depends=('gnupg' 'thunderbird<=2.1')
options=(!makeflags)
source=("http://www.mozilla-enigmail.org/download/source/${_pkgname}-${pkgver}.tar.gz"
        "http://releases.mozilla.org/pub/mozilla.org/thunderbird/releases/${_tb_ver}/source/thunderbird-${_tb_ver}-source.tar.bz2"
        "mozconfig")
md5sums=('cf8c38e8d33965706df383ab33b3923c'
         '6e09f74b25aac46705abb13ea4c26f67'
         '0dfcb312419968aabe01cf2e88395c07')
sha1sums=('ad9a28ab632a5480bd138a0f60e43a5c07a56646'
          '8a65daab259430bc70338a9048ecf00b397034cb'
          '56f980ae47d223b0ce98d808ca5a106b7343fb87')

build() {
  # The build guide is available online:
  # http://enigmail.mozdev.org/download/source.php

  # Compile needed parts of Thunderbird
  cd $srcdir/mozilla
  export MOZCONFIG="$srcdir/mozconfig"
  make -f client.mk export
  cd modules/libreg
  make
  cd ../../xpcom/string
  make
  cd ..
  make
  cd obsolete
  make

  # Now Enigmail
  mv $srcdir/enigmail $srcdir/mozilla/mailnews/extensions
  cd $srcdir/mozilla/mailnews/extensions/enigmail
  ./makemake -r
  make

  # Create the XPI... But we don't want to depend on zip, and bsdtar can't
  # create zip files on its own (only read them), so instead we create a
  # tar archive :)
  sed 's/^zip/bsdtar -c -L -f/' genxpi > genxpi-tar
  mv genxpi-tar genxpi
  chmod +x genxpi
  make xpi

  # Install to $pkgdir
  # If someone knows a better way to extract the em:id, please let me know :)
  emid=`grep em:id package/install.rdf | head -n1 | sed 's/.*>\(.*\)<.*/\1/'`
  mkdir -p $pkgdir/usr/lib/thunderbird-2.0/extensions/$emid
  cd $pkgdir/usr/lib/thunderbird-2.0/extensions/$emid
  tar -x -f $srcdir/mozilla/dist/bin/$_pkgname-$pkgver-linux-$CARCH.xpi
}

