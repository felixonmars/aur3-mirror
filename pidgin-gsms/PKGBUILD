# Contributor: Andrea Scarpino <bash.lnx@gmail.com>

pkgname=pidgin-gsms
pkgver=3.141
pkgrel=2
pkgdesc="A plugin for Pidgin that sends sms to your mobile while you were away."
url='http://code.google.com/p/g-sms/'
license=('GPL')
depends=('pidgin')
arch=('i686' 'x86_64')
source=(http://g-sms.googlecode.com/files/gsms-${pkgver}-src.tar.bz2)
md5sums=('feeaa6cf780ac26c3d6160ff92ed4738')

build() {
  cd "$srcdir/gsms"
  make || return 1
  make PREFIX="$pkgdir/usr" install
}
