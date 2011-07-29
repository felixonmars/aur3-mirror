# created 19:40:23 - 22/09/09
# Maintainer: Frikilinux <frikilinux at frikilinux.com.ar>

pkgname=aarni
pkgver=0.2.0.2
pkgrel=1
pkgdesc="Small and easy-to-use file encryptor"
arch=('i686' 'x86_64')
url="http://code.google.com/p/aarni/"
license=('LGPL')
depends=('qt')
makedepends=()
replace=()
source=(http://aarni.googlecode.com/files/$pkgname-$pkgver-src.tar.gz
	aarni.desktop)
md5sums=('f8b483edb77b8773ecd9236869093e9d'
         '7ce2e99e84e6b2316bd1c1f23c0b0439')

build() {

  cd $srcdir/$pkgname

  qmake || return 1
  make || return 1

  install -Dm755 aarni $pkgdir/usr/bin/aarni || return 1
  install -Dm644 ../aarni.desktop $pkgdir/usr/share/applications/aarni.desktop|| return 1

}