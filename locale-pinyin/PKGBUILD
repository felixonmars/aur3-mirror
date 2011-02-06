# Contributor: sssslang <xofyarg@gmail.com>
pkgname=locale-pinyin
pkgver=0.1
pkgrel=1
pkgdesc="Change sort method to Chinese Pinyin order under UTF-8/GB18030 locale."
url="http://bbs.linuxsir.org/showthread.php?t=292623"
depends=('glibc')
makedepends=('perl>=5.8.1')
install=$pkgname.install
source=(http://gro.clinux.org/frs/download.php/1962/$pkgname-$pkgver.tar.gz)
md5sums=('7d584eb8bc4d9eb3f5ff2492be98f399')

build() {
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
  mkdir -p ../../pkg/usr/share/i18n/locales
  cp iso14651_t1.pinyin ../../pkg/usr/share/i18n/locales
}
