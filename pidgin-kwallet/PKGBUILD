# Maintainer: Mateusz Slazynski <ceceron@gmail.com>
pkgname=pidgin-kwallet
pkgver=1.1.0
pkgrel=1
pkgdesc="KWallet plugin for pidgin."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Pidgin+KWallet+Plugin?content=127136"
license=('GPL')
depends=('pidgin' 'kdelibs')
makedepends=('cmake')
options=(!libtool)
source=(http://kde-apps.org/CONTENT/content-files/127136-PidginKWallet-1.1.0.tar.bz2)
md5sums=('c8fde518d8058de8302124791d0d15c6')

build() {
  cd "$srcdir"/PidginKWallet-$pkgver
  mkdir -p build
  cd build	  
  cmake ..
  make
  mkdir -p "$pkgdir"/usr/lib/pidgin/
#  sed -i 's|GemRBPath=.*|GemRBPath=/usr/share/gemrb/|' "$pkgdir"/etc/GemRB.cfg.sample
  install -m644 plugin/libkwallet.so "$pkgdir"/usr/lib/pidgin/
}
