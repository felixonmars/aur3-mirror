# Maintainer: rayjgu3<rayjgu3@gmail.com>

pkgname=etree-scripts
pkgver=3.1
pkgrel=1
pkgdesc="A collection of scripts (md5check, shn2mp3, flacify, unshn, burn-shns, make-toc) which will hopefully make your life a lot easier. "
url="http://etree-scripts.sourceforge.net/"
license="http://www.perl.com/language/misc/Artistic.html"
depends=('perl>=5' 'shorten' 'flac' 'lame' 'vorbis-tools')
arch=('i686' 'x86_64')

source=(http://sourceforge.net/projects/etree-scripts/files/etree-scripts/3.1/etree-scripts-3.1.tar.gz/download)
md5sums=('9ff1d6a40f611dbebeb5e5ca02f6aa2e')


build() {
  
  cd $startdir/src/$pkgname-$pkgver
  perl Makefile.PL
  make || return 1
  make DESTDIR=$startdir/pkg install
  }













 
