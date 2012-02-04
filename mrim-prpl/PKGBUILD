# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Kirill Omelchenko <twisted@online.ua>
pkgname=mrim-prpl
pkgver=0.1.28
builddir=$pkgname-$pkgver
pkgrel=1
pkgdesc="MRIM plugin for libpurple-based IM clients like Pidgin, Audium, etc."
arch=('i686' 'x86_64')
url="http://mrim-prpl.googlecode.com"
license=('GPLv2')
depends=('libpurple>=2.4.1')
optdepends=('pidgin: Pidgin - The Universal Chat Client')
provides=('mrim-prpl')
source=(http://mrim-prpl.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('2c2338ee71870adde2fe7be874a51b58')

build() {
  tar xfvz $builddir.tar.gz

  cd "$srcdir/$builddir"

  ./configure --gtk

  make
}

package() {
  cd "$srcdir/$builddir"

  make DESTDIR="$pkgdir/" install
}
