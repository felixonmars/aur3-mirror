# Contributor: adriano <adriano.src@gmail.com>
pkgname=qgmailnotifier
pkgver=2008.2
pkgrel=1
pkgdesc="A portable QT4 based GMail notifier"
arch=('i686' 'x86_64')
url="http://qt-apps.org/content/download.php?content=85979&id=2&tan=38027158"
license=('GPL')
depends=('qt')
source=(http://www.codef00.com/projects/qgmailnotifier-2008.2.tgz)

build() {
  cd "$srcdir/qgmailnotifier"
  qmake
  make || return 1
  install -Dm 755 $srcdir/qgmailnotifier/qgmailnotifier $pkgdir/usr/bin/qgmailnotifier
}


md5sums=('307ea8f9eb743b8ee9292c888fc57085')
