# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Submitter: Sebastien Binet <binet@farnsworth>
# Maintainer: Joshua Taylor "deficite" <taylor.joshua88@gmail.com>
pkgname=ldc-bin  
pkgver=0.9.2
pkgrel=3
pkgdesc="A D Compiler based on the LLVM Compiler Infrastructure including D runtime and tango library and imports"
url="http://www.dsource.org/projects/ldc"
arch=('i686' 'x86_64')
license=('BSD')
depends=('llvm' 'gcc-libs')
conflicts=('ldc')
replaces=('ldc')
provides=('ldc')
if [[ $CARCH == "i686" ]]; then
  source=(http://www.incasoftware.de/~kamm/ldc/ldc-$pkgver-linux-x86_32.tar.bz2)
  md5sums=('88f919e5548dffe64270cbdb89048334')
elif [[ $CARCH == "x86_64" ]]; then
  source=(http://www.incasoftware.de/~kamm/ldc/ldc-$pkgver-x86_64.tbz2)
  md5sums=('87a68a215e2553c432468ffb9f6bc8c3')
fi

build() {

  if [[ $CARCH == "i686" ]]; then
    pkgver_arch=linux-x86_32
  elif [[ $CARCH == "x86_64" ]]; then
    pkgver_arch=x86_64
  fi

  cd $startdir/src/ldc-$pkgver-$pkgver_arch
  _srcdir=$startdir/src/ldc-$pkgver-$pkgver_arch

  # install ldc binary
  install -d -m755 $startdir/pkg/usr/bin
  install -m755 $_srcdir/bin/ldc $startdir/pkg/usr/bin
  install -m755 $_srcdir/bin/ldmd $startdir/pkg/usr/bin

  # install ldc.conf
  install -d -m755 $startdir/pkg/etc
  install -m755 $_srcdir/bin/ldc.conf $startdir/pkg/etc

  # install ldc libraries
  install -d -m755 $startdir/pkg/usr/lib
  install -m755 $_srcdir/lib/* $startdir/pkg/usr/lib
  
  # install ldc imports
  install -d -m755 $startdir/pkg/usr/include/d
  /bin/cp -r $_srcdir/import/{tango,object.di} $startdir/pkg/usr/include/d/.
  chmod -R 0755 $startdir/pkg/usr/include

  # install license
  install -d -m755 $startdir/pkg/usr/share/licenses/ldc-bin
  install -m755 $_srcdir/LICENSE_LDC $startdir/pkg/usr/share/licenses/ldc-bin
}
