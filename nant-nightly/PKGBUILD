# $Id: PKGBUILD 356 2008-04-18 22:56:27Z aaron $
# Contributor: Ali H. Caliskan <ali.h.caliskan AT gmail DOT com>
# Contributor: Arjan Timmerman <arjan@soulfly.nl>
# Contributor: Daniel 'maniel' Kaminski <maniel.rulez//gmail.com>
# Contributer: L42y <423300@gmail.com>
# Last update: 2011.5.9

pkgname=nant-nightly
pkgver=0.91
_pkgreleasedate=2011-05-08
pkgrel=3
pkgdesc="A free .NET build tool, like make but without make's problems"
arch=('i686' 'x86_64')
url="http://nant.sourceforge.net"
license="GPL"
depends=('mono')
makedepends=('pkgconfig')
conflicts=('nant')
provides=('nant=0.91')
source=("http://nant.sourceforge.net/nightly/latest/nant-bin.tar.gz"
        'nant.sh')
md5sums=('8313200976d8b57d633fb0b5772ca198'
         '3de436c0b5b96ad22f6c71f2955b613e')
build() {
  export MONO_SHARED_DIR=$srcdir/.wabi
  mkdir -p "${MONO_SHARED_DIR}"
  mkdir $pkgdir/usr $pkgdir/usr/share $pkgdir/usr/share/NAnt $pkgdir/usr/bin

#  cd $srcdir/$pkgname-$pkgver-beta1/bin
#  make install prefix=$pkgdir/usr || return 1
  cp -R $srcdir/nant-$pkgver-nightly-$_pkgreleasedate/* $pkgdir/usr/share/NAnt/
  cp $startdir/nant.sh $pkgdir/usr/bin/nant
  chmod +x $pkgdir/usr/bin/nant
}
