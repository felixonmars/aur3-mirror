# Based on the Gmail Notifier project: http://sourceforge.net/projects/gmail-notify/
# Maintainer: Klim Drobnyh <klim.drobnyh@gmail.com>

pkgname=simple-gmail-notifier
pkgver=1.2.0
pkgrel=0
pkgdesc="A Linux alternative for the notifier program released by Google, use libnotify for notifications"
arch=('any')
url="https://github.com/kdrobnyh/simple-gmail-notifier"
license=('GPL')
depends=('pygtk' 'libnotify' 'alsa-utils')
install=$pkgname.install
source=(https://github.com/kdrobnyh/simple-gmail-notifier/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('2d592e16bb72d08f1ec626fdcc31add3')

build() {
  cd "$srcdir"/$pkgname
}

package() {
  install -dm755 "$pkgdir"/usr/bin
  install -dm755 "$pkgdir"/usr/share/$pkgname

  cp -r "$srcdir"/$pkgname/*  "$pkgdir"/usr/share/$pkgname/
  ln -s /usr/share/$pkgname/run.py "$pkgdir"/usr/bin/$pkgname
}
