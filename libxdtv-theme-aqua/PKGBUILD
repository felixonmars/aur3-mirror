# Contributor: XazZ <xazz.xazz@googlemail.com>
pkgname=libxdtv-theme-aqua
pkgver=2.4.0
pkgrel=1
pkgdesc="An Mac OS X like theme for xdtv. It's available in 11 languages."
arch=(i686)
url="http://sourceforge.net/projects/xawdecode/"
license=('GPL')
depends=(xdtv)
makedepends=()
source=(http://downloads.sf.net/xawdecode/$pkgname-ca-$pkgver.tar.gz
http://downloads.sf.net/xawdecode/$pkgname-cs-$pkgver.tar.gz
http://downloads.sf.net/xawdecode/$pkgname-de-$pkgver.tar.gz
http://downloads.sf.net/xawdecode/$pkgname-en-$pkgver.tar.gz
http://downloads.sf.net/xawdecode/$pkgname-es-$pkgver.tar.gz
http://downloads.sf.net/xawdecode/$pkgname-fr-$pkgver.tar.gz
http://downloads.sf.net/xawdecode/$pkgname-gl-$pkgver.tar.gz
http://downloads.sf.net/xawdecode/$pkgname-it-$pkgver.tar.gz
http://downloads.sf.net/xawdecode/$pkgname-pl-$pkgver.tar.gz
http://downloads.sf.net/xawdecode/$pkgname-ru-$pkgver.tar.gz
http://downloads.sf.net/xawdecode/$pkgname-sv-$pkgver.tar.gz)
md5sums=('88c99eb9857a2f6677a86007232ae953' 'ad7dc430574882e4098b84a1bf6b6b70'\
         '3d64d9705afcc31bcbab7e5ccfa5aa88' 'ee7156f30da521cd3899334a83ce8436'\
         '7bc789cf074d2b0c0895990971284532' '198324f8e48437a7483b7c5fe3ab3756'\
         'f5f91f80b231213cd3054d7674d0b2f7' 'daefb4a20166998dec35ab622a675e6c'\
         '3467cd42485f46b20fba89c501dd97d4' '150976d2e3ec9886d11148280717cf65'\
         '66a2302b078b910423d79f1500a31318')

build() {
  cd $startdir/src/$pkgname-ca-$pkgver
  ./configure
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  cd $startdir/src/$pkgname-cs-$pkgver
  ./configure
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  cd $startdir/src/$pkgname-de-$pkgver
  ./configure
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  cd $startdir/src/$pkgname-en-$pkgver
  ./configure
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  cd $startdir/src/$pkgname-es-$pkgver
  ./configure
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  cd $startdir/src/$pkgname-fr-$pkgver
  ./configure
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  cd $startdir/src/$pkgname-gl-$pkgver
  ./configure
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  cd $startdir/src/$pkgname-it-$pkgver
  ./configure
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  cd $startdir/src/$pkgname-pl-$pkgver
  ./configure
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  cd $startdir/src/$pkgname-ru-$pkgver
  ./configure
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  cd $startdir/src/$pkgname-sv-$pkgver
  ./configure
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1

  cd $startdir/pkg/usr/local
  mv * $startdir/pkg/usr/
  cd $startdir/pkg/usr
  rm -rf local
}
