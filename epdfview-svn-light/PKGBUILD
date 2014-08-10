# Contributor (non-svn version): Tom K <tomk@runbox.com>
# Contributor: Xyne <xyne at archlinux dot us>
# Contributor: Joel Almeida <aullidolunar at gmail dot c0m>

_pkgrealname='epdfview'
_pkgrealversion='0.1.8'
pkgname=${_pkgrealname}-svn-light
pkgver=1
pkgrel=3
pkgdesc="A free lightweight PDF document viewer without doxygen and libcups dependencies (svn is no longer supported)"
url="http://freecode.com/projects/epdfview"
license=('GPL')
arch=('i686' 'x86_64')
depends=('gtk2>=2.6.0' 'poppler-glib>=0.5.0')
source=(
	"http://ftp.de.debian.org/debian/pool/main/e/epdfview/epdfview_${_pkgrealversion}.orig.tar.gz"
	"configure.patch"
	"Makefile.patch"
	"epdfview.desktop.patch"
)
md5sums=(
	'0c57d5e33adbfba047ffa13e570f79d6'
	'013cb9c8d9e971495cb1239f477d99af'
	'f04a394e74865508e3553ef83739cfef'
	'92af79231159391294e26f621d279fda'
)

build() {
	cd "$srcdir/${_pkgrealname}-${_pkgrealversion}/data"
	msg "Patching desktop file"
	patch < ../../epdfview.desktop.patch
	cd "$srcdir/${_pkgrealname}-${_pkgrealversion}"
	msg "Patching Makefile.am"
	patch < ../Makefile.patch
	msg "Patching configure..."
	patch < ../configure.patch
	msg "Adding dummy file: ChangeLog"
	touch ChangeLog
	msg "Recreating configure script"
	autoreconf -fi
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${_pkgrealname}-${_pkgrealversion}"
	make DESTDIR="$pkgdir" install
}
