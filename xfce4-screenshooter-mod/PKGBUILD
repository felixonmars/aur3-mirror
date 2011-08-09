# Maintainer: Bl00drav3n <bl00drav3n@universe-modding.org>
basename=xfce4-screenshooter
majorver=1.7
pkgname=$basename-mod
pkgver=$majorver.9
pkgrel=1
pkgdesc="modified xfce4-screenshooter that automatically copies the images URL to clipboard when using the -u option (zimagez upload)"
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/applications/xfce4-screenshooter"
license=('GPL2')
groups=(xfce4-goodies)
depends=('xfce4-panel' 'libsoup' 'hicolor-icon-theme')
makedepends=('intltool' 'pkg-config')
conflicts=(xfce4-screenshooter)
replaces=(xfce4-screenshooter)
source=(http://archive.xfce.org/src/apps/xfce4-screenshooter/$majorver/$basename-$pkgver.tar.bz2)
install=
md5sums=('c01d1cf3830bf8d60e09c0cdd223034c')

build() {
  cd "$srcdir/$basename-$pkgver"
  patch -p0 < $startdir/clipboard.patch
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$basename-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$basename-$pkgver"
  make DESTDIR="$pkgdir/" install
}
