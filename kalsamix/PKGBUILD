# Maintainer: Nathan O <ndowens04 at gmail dot com> 
 
pkgname=kalsamix
pkgver=1.0.0beta2
pkgrel=1
pkgdesc="An ALSA mixer for KDE (formerly kamix)" 
url="http://kalsamix.sourceforge.net/" 
depends=('kdelibs3')
makedepends=('automake' 'perl')
arch=('i686' 'x86_64')
replaces=('kamix')
license="GPL"
source=("http://downloads.sourceforge.net/kalsamix/kalsamix/$pkgver/$pkgname-$pkgver.tar.gz" 'patch')
md5sums=('f81ba7798ce887b92c3a07ecfc879df4' '8687882ae1aea6fe1812ac487ca54c15')
build() {
 
cd $srcdir/$pkgname-$pkgver
./configure --prefix=/opt/kde --with-qt-dir=/opt/qt --without-arts --disable-rpath --disable-vumeter
patch -p1 < ../patch
make || return 1
make DESTDIR=$pkgdir install

}
