# Contributor: markiza@gmail.com

pkgname=reoback
pkgver=1.0
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc="REOBack is a backup solution designed for Linux users and system administrators."
license=('GPL')
depends=('perl' 'tar' 'gzip')
makedepends=('')
options=('') 
url="http://reoback.sourceforge.net/"
source=("http://dfn.dl.sourceforge.net/sourceforge/reoback/$pkgname-1.0_r3.tar.gz http://surfnet.dl.sourceforge.net/sourceforge/reoback/$pkgname-1.0_r3.tar.gz")
md5sums=('864f8f44f2124be113838b85c405ffe1')
install=$pkgname.install
DOK="BUGS CHANGES LICENSE INSTALL MANUALS README TODO"

build() {
  mkdir -p $startdir/pkg/etc/$pkgname
  mkdir -p $startdir/pkg/usr/bin
  mkdir -p $startdir/pkg/usr/share/$pkgname
  mkdir -p $startdir/pkg/var/lib/$pkgname/tmp
  mkdir -p $startdir/pkg/var/lib/$pkgname/data

  cp $startdir/src/$pkgname-$pkgver/conf/*.conf $startdir/pkg/etc/reoback
  cp $startdir/src/$pkgname-$pkgver/reoback.pl $startdir/pkg/usr/bin
  cat $startdir/src/$pkgname-$pkgver/run_reoback.sh | sed -e 's/\/home\/sforge\/reoback\/settings.conf/\/etc\/reoback\/settings.conf/'  >  $startdir/src/tmp1
  cat $startdir/src/tmp1 | sed -e 's/\/home\/sforge\/reoback\/reoback.pl/\/usr\/bin\/reoback.pl/' > $startdir/pkg/usr/bin/run_reoback.sh
  chmod 755 $startdir/pkg/usr/bin/run_reoback.sh
  rm -f $startdir/src/tmp1
  for I in $DOK; do
    cp -r $startdir/src/$pkgname-$pkgver/docs/$I $startdir/pkg/usr/share/$pkgname
  done
  install -D -m644 $startdir/src/$pkgname-$pkgver/docs/man/$pkgname.1.gz $startdir/pkg/usr/man/man1/$pkgname.1.gz
  install -D -m644 $startdir/src/$pkgname-$pkgver/docs/man/$pkgname.pl.1.gz $startdir/pkg/usr/man/man1/$pkgname.pl.1.gz
}
