# Maintainer: Michael Henry <arch at drmikehenry dot com>

pkgname=wmiface
pkgver=2.1
pkgrel=2
pkgdesc="controls window manager from command line (more general than DCOP)"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php?content=40425"
license=('GPL')  # Compilation as a whole; MIT/X11 for wmiface sources.
depends=('qt4')
makedepends=('cmake')
source=(ftp://ftp.gr.freebsd.org/pub/linux/gentoo/distfiles/$pkgname-$pkgver.tar.gz)
md5sums=('54b9959e9b53c41839c1b93718e1015c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DQT_QMAKE_EXECUTABLE=qmake-qt4 || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
  local _DOC_DIR="$pkgdir/usr/share/doc/$pkgname-$pkgver"
  mkdir -p -m 755 "$_DOC_DIR" || return 1
  for doc in README LICENSE*; do
    install -m 644 $doc $_DOC_DIR/$doc || return 1
  done
}

# vim:set ts=2 sw=2 et:
