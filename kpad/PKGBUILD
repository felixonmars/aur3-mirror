# Contributor: shamrok <szamrok@gmail.com>

pkgname=kpad
pkgver=1.0.1
pkgrel=2
pkgdesc="This is a simple tabbed text editor for KDE that can do ftp, mail, spellcheck, find, and replace, go to line."
url="http://kde-apps.org/content/show.php?content=16492"
depends=('kdelibs')
source=("http://patriot.net/~gary/$pkgname-$pkgver.tar.bz2")
md5sums=('c38bb0064e1a5846c2a0051ff6accc0a')
arch=(i686)
license="GPL"

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure
  make || return 1
  make DESTDIR=$startdir/pkg install
}
