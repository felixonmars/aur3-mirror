# Contributor: XazZ <xazz.xazz@googlemail.com>
pkgname=libxdtv-i18n
pkgver=2.4.0
pkgrel=1
pkgdesc="Locale/Language files for xdtv (i18n)"
arch=(i686)
url="http://sourceforge.net/projects/xawdecode/"
license=('GPL')
depends=(xdtv)
makedepends=()
source=(http://prdownloads.sourceforge.net/xawdecode/$pkgname-ca-$pkgver.tar.gz
http://prdownloads.sourceforge.net/xawdecode/$pkgname-cs-$pkgver.tar.gz
http://prdownloads.sourceforge.net/xawdecode/$pkgname-de-$pkgver.tar.gz
http://prdownloads.sourceforge.net/xawdecode/$pkgname-en-$pkgver.tar.gz
http://prdownloads.sourceforge.net/xawdecode/$pkgname-es-$pkgver.tar.gz
http://prdownloads.sourceforge.net/xawdecode/$pkgname-fr-$pkgver.tar.gz
http://prdownloads.sourceforge.net/xawdecode/$pkgname-gl-$pkgver.tar.gz
http://prdownloads.sourceforge.net/xawdecode/$pkgname-it-$pkgver.tar.gz
http://prdownloads.sourceforge.net/xawdecode/$pkgname-pl-$pkgver.tar.gz
http://prdownloads.sourceforge.net/xawdecode/$pkgname-ru-$pkgver.tar.gz
http://prdownloads.sourceforge.net/xawdecode/$pkgname-sv-$pkgver.tar.gz)
md5sums=('f18ffa0f7a83d74923c6605af98fa263' '62fe804d95de73138b6f99ac0d70ffb8'\
         '70d554e61d8607dd47109c62f3a55028' 'aeb82963e051e626cb9e97459ec4bac8'\
         '63fbc5021bb44416b4f39960dcd6d88a' 'f8e842f772063a68953292922f157845'\
         '1db5929bc0e93fd1059bd6c97b08ac0a' '2530752cccc6e2c703ff45c44c054054'\
         'f78945a98b1bde9f04cf8f52a1af1232' 'ac5a58fefa2b1a019cea2c67e22ba4a4'\
         '292dad1c0e31373f84a72b75235b4048')

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
