# Contributor: fauno <fauno@kiwwwi.com.ar>
# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>

pkgname=djvulibre-nogui
_pkgname=djvulibre
pkgver=3.5.23
pkgrel=1
pkgdesc="Suite to create, manipulate and view DjVu ('déjà vu') documents (without gui and qt dependency)"
arch=("i686" "x86_64")
license=('GPL')
url="http://djvu.sourceforge.net/"
depends=('libtiff' 'hicolor-icon-theme' 'desktop-file-utils' 'libdjvu' 'shared-mime-info')
makedepends=('pkgconfig')
conflicts=('djvulibre')
provides=('djvulibre')
install=djvulibre.install
source=(http://downloads.sourceforge.net/djvu/${_pkgname}-${pkgver}.tar.gz)

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr --without-qt
  make LIBDJVU="`pkg-config --libs ddjvuapi`" SUBDIRS_FIRST=tools
  make LIBDJVU="`pkg-config --libs ddjvuapi`" SUBDIRS_FIRST=tools \
       DESTDIR="${pkgdir}" plugindir=/usr/lib/mozilla/plugins \
       install-utils install-i18n

  #Install icons, launcher files, mime-types.
  install -m755 -d ${pkgdir}/usr/share/icons/hicolor/{22x22,32x32,48x48}/mimetypes
  install -m755 -d ${pkgdir}/usr/share/icons/hicolor/32x32/apps
  install -m755 -d ${pkgdir}/usr/share/mime/packages/
  install -m755 -d ${pkgdir}/usr/share/applications

  install -m644 desktopfiles/hi22-djvu.png "${pkgdir}/usr/share/icons/hicolor/22x22/mimetypes/image-vnd.djvu.mime.png"
  install -m644 desktopfiles/hi32-djvu.png "${pkgdir}/usr/share/icons/hicolor/32x32/mimetypes/image-vnd.djvu.mime.png"
  install -m644 desktopfiles/hi48-djvu.png "${pkgdir}/usr/share/icons/hicolor/48x48/mimetypes/image-vnd.djvu.mime.png"

  install -m644 desktopfiles/djvulibre-mime.xml "${pkgdir}/usr/share/mime/packages/"
}

md5sums=('0053b9908b9e3d57d0d89b3d065168e9')
