# Contributor: Fortunato Ventre (voRia) <vorione@gmail.com>

pkgname=drm
pkgver=1.1.2
pkgrel=1
pkgdesc="Nintendo DS roms manager"
arch=('any')
url="http://www.voria.org/dsromsmanager/"
license=('GPL')
depends=('pygtk')
optdepends=('trim: for NDS roms trimming')
source=(http://www.voria.org/files/nds/drm/$pkgname-$pkgver.tar.gz fix_shebangs.patch fix_launcher.patch)
md5sums=('1bfbd795b91b51df719ce0a093dd4834'
         'aac8a8092b7da207543f92fed19ab339'
         '881a7cef3ad66c9b93ccf3d51e39a114')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p1 -i "$srcdir/fix_shebangs.patch"
  patch -p1 -i "$srcdir/fix_launcher.patch"

  make DESTDIR="$pkgdir/" install || return 1
}

