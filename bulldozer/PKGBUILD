# Contributor: Mark Rosenstand <mark@borkware.net>
pkgname=bulldozer
pkgver=0.2.3
pkgrel=1
pkgdesc="Tell Nautilus about your build system"
url="http://taschenorakel.de/mathias/bulldozer/"
depends=('nautilus')
makedepends=('gtk-doc')
source=(http://taschenorakel.de/svn/repos/bulldozer/releases/$pkgname-$pkgver.tar.bz2)
md5sums=('beaf8be845bd09a959650a9ca3c552a8')

build() {
  cd $startdir/src/$pkgname-$pkgver
  make prefix=/opt/gnome || return 1
  make prefix=/opt/gnome DESTDIR=$startdir/pkg install

  # not needed (makepkg will kill /usr/share/doc)
  rm -rf $startdir/pkg/usr
}
