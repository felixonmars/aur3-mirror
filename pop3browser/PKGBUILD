# Contributor: Gerhard Brauer <gerbra@archlinux.de>
pkgname=pop3browser
pkgver=0.4.1
pkgrel=1
pkgdesc="Tool to browse a pop3 mailbox, view and delete mail directly on server"
arch=('i686' 'x86_64')
url="http://packages.debian.org/sid/pop3browser"
license=('GPL')
depends=('perl')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
install=
source=(http://ftp.de.debian.org/debian/pool/main/p/pop3browser/${pkgname}_${pkgver}-$pkgrel.tar.gz)
noextract=()
md5sums=('30d4796ee37d165c2abfaa83780c7c16')

build() {
  cd $startdir/src/$pkgname-$pkgver
  install -D pop3browser $startdir/pkg/usr/bin/pop3browser
  install -D pop3browser.1 $startdir/pkg/usr/man/man1/pop3browser.1
  gzip $startdir/pkg/usr/man/man1/pop3browser.1
}

