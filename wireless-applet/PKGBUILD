# Maintainer: corvolino <corvolino@archlinux.com.br>

pkgname=wireless-applet
pkgver=0.0.2
pkgrel=7
pkgdesc="Applet for the GNOME Panel for managing wireless networks using wpa_supplicant"
url="http://www.bitron.ch/software/wireless-applet.php"
depends=('gtk2' 'gnome-panel' 'gnome-keyring' 'wpa_supplicant' 'hal' 'libgcrypt')
license=('GPL')
source=(http://www.bitron.ch/downloads/$pkgname-$pkgver.tar.bz2)
arch=('i686' 'x86_64')
md5sums=('98db35d80c1514472d93f6770255f692')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr=/opt/gnome --sysconfdir=/etc || return 1
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}






