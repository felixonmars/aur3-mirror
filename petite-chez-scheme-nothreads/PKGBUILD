# Contributor: Mathieu Boespflug <mboes@tweag.net>
# Maintainer: Oleg Smirnov <oleg.smirnov@gmail.com>
pkgname=petite-chez-scheme-nothreads
pkgver=8.0
pkgrel=1 
pkgdesc="An efficient and robust implementation of R6RS Scheme and extensions. Non-threaded version."
url="http://www.scheme.com/"
arch=('i686' 'x86_64')
if [ $(uname -m) = 'x86_64' ]
then
  depends=('lib32-ncurses')
else
  depends=('ncurses')
fi
license=('custom')
source=(http://www.scheme.com/download/pcsv$pkgver-i3le.tar.gz)
md5sums=('2747d76d0437b635c3252644a0256706')
build() {
  cd $startdir/src/csv$pkgver/custom
  ./configure --nothreads --machine=i3le \
    --installprefix=/usr/ \
    --installman=/usr/share/man \
    --temproot=$startdir/pkg \
    --noforce-relink
  make install
# Install the license.
  mkdir -p $startdir/pkg/usr/share/licenses/$pkgname
  cp $startdir/src/csv$pkgver/petite.lic $startdir/pkg/usr/share/licenses/$pkgname/
  chmod -R a+r $startdir/pkg
}
