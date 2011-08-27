# Maintainer: corvolino <corvolino@archlinux.com.br>

pkgname=notification-daemon-engine-nodoka
pkgver=0.1.0
pkgrel=3
pkgdesc="Nodoka theme for gnome-notification-daemon"
arch=('i686' 'x86_64')
url="https://hosted.fedoraproject.org/nodoka/wiki"
license=('GPL3')
depends=('libsexy' 'gtk2')
source=(https://fedorahosted.org/releases/n/o/nodoka/$pkgname-$pkgver.tar.gz)
md5sums=('ba207b7bf7f980b17fca7d18abced652')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}



