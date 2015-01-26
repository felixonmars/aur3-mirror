# Maintainer: Alexandre Becoulet <alexandre.becoulet@free.fr>

pkgname=splix-svn
pkgver=r315
pkgrel=2
pkgdesc="CUPS drivers for SPL (Samsung Printer Language) printers (svn)"
arch=('i686' 'x86_64' 'armv6h')
url="http://splix.ap2c.org/"
license=('GPL')
depends=('cups' 'libcups' 'gcc-libs' 'jbigkit' 'ghostscript>=9.02')
conflicts=('splix')
makedepends=('subversion')
source=('splix::svn+https://splix.svn.sourceforge.net/svnroot/splix/splix')
md5sums=("SKIP")

build() {
  cd "$srcdir/splix"
  make PSTORASTER=gstoraster || return 1
}

pkgver() {
  cd "$srcdir/splix"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

package() {
  cd "$srcdir/splix"
  install -d "$pkgdir/usr/lib/cups/filter"
  install -d "$pkgdir/usr/share/cups/model/samsung"
  make DESTDIR="$pkgdir/" install || return 1
}

