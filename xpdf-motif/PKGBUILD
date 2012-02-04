pkgname=xpdf-motif
_pkgname=xpdf
_srcver=3.03
pkgver=${_srcver}
pkgrel=1
pkgdesc="A viewer for Portable Document Format (PDF) files."
arch=(i686 x86_64)
license=('GPL')
depends=('gcc-libs' 'openmotif' 't1lib' 'gsfonts' 'libxt' 'desktop-file-utils')
optdepends=('poppler: pdf tools that used to be included in xpdf')
provides=('xpdf')
backup=(etc/xpdfrc)
url="http://www.foolabs.com/xpdf/"
options=('')
source=(ftp://ftp.foolabs.com/pub/${_pkgname}/${_pkgname}-${_srcver}.tar.gz)
md5sums=('af75f772bee0e5ae4a811ff9d03eac5a')

build() {
  cd "${srcdir}/${_pkgname}-${_srcver}"
  sed -i 's:/usr/share/fonts/type1/gsfonts:/usr/share/fonts/Type1:' xpdf/GlobalParams.cc || return 1
  ./configure                                                  \
    --prefix=/usr                                              \
    --sysconfdir=/etc                                          \
    --mandir=/usr/share/man                                    \
    --enable-multithreaded --enable-wordlist                   \
    --with-freetype2-library=/usr/lib                          \
    --with-freetype2-includes=/usr/include/freetype2           \
    --with-t1-library=/usr/lib                                 \
    --with-t1-includes=/usr/include                            \
    --x-includes=/usr/include                                  \
    --with-Xm-library=/usr/lib                                 \
    --with-Xm-includes=/usr/include || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install
  for tool in pdffonts pdfimages pdfinfo pdftoppm pdftops pdftotext ; do
    rm -f "${pkgdir}/usr/bin/${tool}"
    rm -f "${pkgdir}/usr/share/man/man1/${tool}.1"
  done
}
