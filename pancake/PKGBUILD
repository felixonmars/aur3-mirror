# Contributor: Simon Brakhane <simon.brakhane at web dot de>

pkgname=pancake
pkgver=0.1
pkgrel=1
pkgdesc="pancake is a highly configurable, modular, themeable, GTK+-2.0-driven panel for X11"
arch=('i686' 'x86_64')
url="http://www.failedprojects.de/pancake/"
license=('GPL')
depends=('gtk2' 'libwnck' 'confuse')
source=(http://failedprojects.de/attachments/download/7/$pkgname-$pkgver.tar.bz2)
md5sums=('fe91fb634dbe75341d58dd02f4f9081e')
conflicts=('pancake-git')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}

