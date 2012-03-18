# Contributor: Unknown47 <unknown47r@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Peter Feuerer <peter@piie.net>

pkgname=pcmanfm_with_search
pkgsrcname=pcmanfm
pkgver=0.9.10
pkgrel=1
pkgdesc="File manager of the LXDE Desktop with search extension"
arch=('i686' 'x86_64')
url="http://pcmanfm.sourceforge.net/"
license=('GPL')
groups=('lxde')
depends=('gtk2' 'desktop-file-utils' 'libfm' 'lxmenu-data' 'foosearch')
makedepends=('intltool' 'pkgconfig')
provides=('pcmanfm')
conflicts=('pcmanfm')
source=(http://downloads.sourceforge.net/${pkgsrcname}/${pkgsrcname}-$pkgver.tar.gz http://piie.net/files/foosearch.patch)
md5sums=('d34a3530a6c5dcd674d23021d71c3e95'
         '4b166bddbde664558561ff0b290c0d73')


build() {
  cd "$srcdir/$pkgsrcname-$pkgver"
  patch -p1 < $srcdir/foosearch.patch
  ./configure --sysconfdir=/etc --prefix=/usr 
  make 
}

package() {
  cd "$srcdir/$pkgsrcname-$pkgver"
  make DESTDIR="$pkgdir" install 
}
