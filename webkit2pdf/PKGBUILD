# Contributor: Robert Orzanna <orschiro@googlemail.com>
# Contributor: N30N <archlinux@alunamation.com>

pkgname="webkit2pdf"
pkgver=0.2
pkgrel=1
pkgdesc="A little tool designed to fetch web pages and export them to numbered PDF files (or to print them)."
url="http://webkit2pdf.sourceforge.net/"
license=("GPL2")
arch=("x86_64" "i686")
depends=("libwebkit" "poppler-glib")
source=("http://downloads.sf.net/${pkgname}/$pkgname-$pkgver.tar.gz" \
	"poppler-0.18.patch::http://sourceforge.net/tracker/download.php?group_id=264450&atid=1127720&file_id=430643&aid=3458283")
md5sums=("81f069a1d998b9d4f0edef0ba280ede1" "34e0c6972202bfe2bb5cf58c4f6fba74")

build() {
	cd "${srcdir}/$pkgname-$pkgver"
	patch -p1 -i "${srcdir}/poppler-0.18.patch"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/$pkgname-$pkgver"
	make DESTDIR="${pkgdir}" install
}

# vim: set noet ff=unix:
