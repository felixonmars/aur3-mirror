# Maintainer: Jakub Kozisek <nodevel at gmail dot com>

pkgname=backupdec
pkgver=0.1
pkgrel=1
pkgdesc="A tool that decrypts encrypted Nokia N900 (Maemo) backup files. Usage: 'backupdec <input.zip> <output.zip> <password>'"
arch=('any')
url="http://talk.maemo.org/showthread.php?t=82801"
license=('GPL')
depends=('glib2' 'libgsf' 'openssl')
makedepends=('gcc' 'unzip')
source=(http://www.cncmods.net/files/$pkgname.zip)
sha512sums=('d85122754155828759e40427540f8b9c7990153cad6436f8a8713388c51293b8afb07ece316a3d99c47d05e3de00750ec314032125b421c649795b3b2602c163')

build() {
  cd ${srcdir}
 
  msg "Building..."
  mkdir -p $pkgdir/usr/bin/
  gcc -g -o $pkgdir/usr/bin/backupdec main.c ob-utils.c gsf-input-crypt.c `pkg-config --libs --cflags glib-2.0` `pkg-config --libs --cflags libgsf-1` -lcrypto -lssl
}


