# Contributor: Roman G <chesercat@gmail.com>
# Contributor: Thomas Dahms <thdahms@gmx.de>

pkgname=renrot
pkgver=1.1.0
pkgrel=3
pkgdesc='Renames files according the DateTimeOriginal and FileModifyDate EXIF tags, if they exist. Additionally, it rotates files and their thumbnails, accordingly Orientation EXIF tag'
url="http://puszcza.gnu.org.ua/projects/renrot/"
depends=('perl' 'perl-exiftool') 
arch=('any')
license=('Artistic2.0')

source=(http://git.gnu.org.ua/cgit/renrot.git/snapshot/RENROT_1_1_0.tar.bz2)
md5sums=('79be12458906ef824be2505a47b99014')

src_subdir=RENROT_$(echo $pkgver | sed 's/\./_/g')

build() {
   cd "$srcdir/$src_subdir"
   perl Makefile.PL INSTALLSITESCRIPT=/usr/bin || return 1
   make || return 1
}

package() {
   cd "$srcdir/$src_subdir"
   make install DESTDIR=$pkgdir || return 1

   # Remove unused directories
   rm -rf "$pkgdir/usr/lib"
}
