# Contributor: Smith Dhumbumroong <zodmaner at gmail dot com>

pkgname=lha-autoconfiscated
_realname=lha
pkgver=1.14i_ac20050924p1
_realver=1.14i-ac20050924p1
pkgrel=4
pkgdesc="Autoconfiscated version of the lha compression and archive utility"
arch=('i686' 'x86_64')
license=('custom')
depends=('glibc')
provides=('lha=1.17')
conflicts=('lha')
source=(http://dl.sourceforge.jp/lha/22231/$_realname-$_realver.tar.gz
        copyright)
url="http://lha.sourceforge.jp/"
md5sums=('9f52430410928ba4390a73a41a36d56f'
         'a269181a01b7f3fe659f52033485db74')

build() {
  cd "$srcdir/$_realname-$_realver"
  ./configure --prefix=/usr --mandir=/usr/share || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
  # install license
  install -Dm644 $srcdir/copyright $pkgdir/usr/share/licenses/$pkgname/copyright
}

