# Maintainer: Jochen Immend�rfer <jochen dot immendoerfer at gmail dot com>
pkgname=alsa-tools
pkgver=1.0.23
pkgrel=1
pkgdesc="ALSA tools package"
arch=('i686' 'x86_64')
url="http://alsa-project.org/"
license=('GPL')
depends=('fltk' 'alsa-lib' 'gtk2' 'qt3')
source=(ftp://ftp.alsa-project.org/pub/tools/$pkgname-$pkgver.tar.bz2)
md5sums=('f286616cf781c81b1636899a104129d1')

build() {
  cd $startdir/src/$pkgname-$pkgver
  rm Makefile gitcompile
  for file in `ls -1`; do
    if [ $file = "seq" ]; then
      cd $file/sbiload;
    else
      cd $file;
    fi    
    ./configure --prefix=/usr --with-qtdir=/opt/qt --x-libraries=/usr/lib
    make UIC=/opt/qt/bin/uic MOC=/opt/qt/bin/moc|| return 1
    make DESTDIR=$startdir/pkg install || return 1
    cd -
  done
  
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
