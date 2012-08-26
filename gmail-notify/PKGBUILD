# Maintainer: jsteel <mail at jsteel dot org>
# Contributor: Gadget3000 <gadget3000 at msn dot com>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>

pkgname=gmail-notify
pkgver=1.6.1.1
pkgrel=6
pkgdesc="A Linux alternative for the notifier program released by Google"
arch=('any')
url="http://gmail-notify.sourceforge.net"
license=('GPL')
depends=('pygtk')
install=$pkgname.install
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
        $pkgname.patch)
md5sums=('7d62330064b3cc70c674cb721f36975a'
         '799286a4e34851e8a8fa0701dfa29ac8')

build() {
  cd "$srcdir"/$pkgname

  patch -Np1 -i "$srcdir"/$pkgname.patch

  rm pytrayicon.so
}

package() {
  install -dm755 "$pkgdir"/usr/bin
  install -dm755 "$pkgdir"/usr/share/gmail-notify

  cp -r "$srcdir"/$pkgname/*  "$pkgdir"/usr/share/gmail-notify/
  ln -s /usr/share/$pkgname/notifier.py "$pkgdir"/usr/bin/gmail-notify
}
