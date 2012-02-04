# Maintainer: vania <vania.rupeni@gmail.com>

pkgname=kaffeine-sc-plugin
pkgver=0.4.0
pkgrel=2
pkgdesc="Plugin for Kaffeine player for viewing DVB-S encoded channels"
arch=('i686' 'x86_64')
url="http://new-cms.org/"
license=('GPL')
depends=('kaffeine-kde3')
makedepends=('openssl' 'gcc-libs' 'autoconf')
source=(http://kaffeine-sc-plugin.googlecode.com/files/kaffeine-sc-plugin-0.4.0.tar.gz)
md5sums=('780d15b31e3292ce7d7d5c143baef145')

build() {
  cd  $srcdir/kaffeine-sc-plugin-0.4.0
  ./configure --prefix=/opt/kde --with-qt-dir=/opt/qt --without-arts
  make 
  make prefix=$pkgdir/opt/kde install
}
