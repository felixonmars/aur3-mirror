# $Id$
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Xpdf-nodrm: Mark Pustjens <pustjens@dds.nl>

pkgname=xpdf-nodrm
real_pkgname=xpdf
#pkgver=3.03_pl1
pkgver=3.04
pkgrel=1
pkgdesc='Viewer for Portable Document Format (PDF) files. Enforced DRM removed.'
url='http://www.foolabs.com/xpdf/'
license=('GPL2')
arch=('i686' 'x86_64')
depends=('lesstif' 'gsfonts' 'libxt')
optdepends=('poppler: tools that used to be included in xpdf'
            'desktop-file-utils: for desktop environments')
#       "ftp://ftp.foolabs.com/pub/${pkgname}/${pkgname}-${pkgver%_*}pl1.patch"
source=("ftp://ftp.foolabs.com/pub/${real_pkgname}/${real_pkgname}-${pkgver%_*}.tar.gz"
        'char.patch'
	'02-permissions.patch'
        'desktop')
md5sums=('af75f772bee0e5ae4a811ff9d03eac5a'
         '270b301a42124299ae05bb5afc34a690'
         '11e962cd8a39645fff38bc7a611ec32a'
         '6a2e1802dd03ce2fc004b13203919731')

provides=('xpdf')
conflicts=('xpdf')
install=install
backup=('etc/xpdfrc')

build() {
  cd "${srcdir}/${real_pkgname}-${pkgver%_*}"

#	patch -p1 -i "../${pkgname}-${_srcver}pl1.patch"
	#patch -p1 -i ../char.patch
	patch -p1 -i ../02-permissions.patch

	sed -i 's:/usr/share/fonts/type1/gsfonts:/usr/share/fonts/Type1:' xpdf/GlobalParams.cc
	sed -i 's:times-medium-r-normal--16:times-medium-r-normal--14:' xpdf/XPDFViewer.cc # FS#14217

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --mandir=/usr/share/man \
    --enable-multithreaded \
    --enable-wordlist \
    --with-freetype2-library=/usr/lib \
    --with-freetype2-includes=/usr/include/freetype2 \
    --x-includes=/usr/include \
    --with-Xm-library=/usr/lib \
    --with-Xm-includes=/usr/include \

  make
}

package() {
  cd "${srcdir}/${real_pkgname}-${pkgver%_*}"

  make DESTDIR="${pkgdir}" install

  install -Dm644 ../desktop "${pkgdir}/usr/share/applications/xpdf.desktop"
  install -Dm644 xpdf/xpdfIcon.xpm "${pkgdir}/usr/share/pixmaps/xpdf.xpm"

	# stuff provided by poppler
	for tool in pdfdetach pdffonts pdfimages pdfinfo pdftoppm pdftops pdftotext; do
		rm "${pkgdir}/usr/bin/${tool}" "${pkgdir}/usr/share/man/man1/${tool}.1"
	done
}
md5sums=('3bc86c69c8ff444db52461270bef3f44'
         '270b301a42124299ae05bb5afc34a690'
         '11e962cd8a39645fff38bc7a611ec32a'
         '6a2e1802dd03ce2fc004b13203919731')
