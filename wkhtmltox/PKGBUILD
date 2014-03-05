# Maintainer: richardm <richard.mathot+arch@gmail.com>

pkgname=wkhtmltox
pkgver=0.12.0
pkgrel=1
pkgdesc="Simple shell utilities to convert html to pdf or image using the webkit rendering engine"
revid=03c001d
arch=('i686' 'x86_64')
url="http://wkhtmltopdf.org/"
license=('GPL3')
conflicts=('wkhtmltopdf')
options=('!strip')
if [ '$CARCH' = "i686" ]; then
  _arch="i386"
  sha1sums=('f294a8c00621b0f567b8cb82392a45aac415f8eb')
else
  _arch="amd64"
  sha1sums=('2f87a0a558edac98bf4c89f4afd15feac67a9cbb')
fi
source=(http://downloads.sourceforge.net/project/wkhtmltopdf/{$pkgver}/wkhtmltox-linux-{$_arch}_{$pkgver}-{$revid}.tar.xz)

package() {
  cd "$srcdir"

  # Development headers
  install -D "wkhtmltox/include/wkhtmltox/dllbegin.inc" "$pkgdir/usr/include/wkhtmltox/dllbegin.inc" || return 1
  install -D "wkhtmltox/include/wkhtmltox/dllend.inc" "$pkgdir/usr/include/wkhtmltox/dllend.inc" || return 1
  install -D "wkhtmltox/include/wkhtmltox/image.h" "$pkgdir/usr/include/wkhtmltox/image.h" || return 1
  install -D "wkhtmltox/include/wkhtmltox/pdf.h" "$pkgdir/usr/include/wkhtmltox/pdf.h" || return 1

  # Library
  install -D "wkhtmltox/lib/libwkhtmltox.so.$pkgver" "$pkgdir/usr/lib/libwkhtmltox.$pkgver" || return 1
  #install -D "wkhtmltox/lib/libwkhtmltox.so.0" "$pkgdir/usr/lib/libwkhtmltox.0" || return 1
  #install -D "wkhtmltox/lib/libwkhtmltox.so.0.12" "$pkgdir/usr/lib/libwkhtmltox.0.12" || return 1

  # Binaries
  install -D "wkhtmltox/bin/wkhtmltopdf" "$pkgdir/usr/bin/wkhtmltopdf" || return 1
  install -D "wkhtmltox/bin/wkhtmltoimage" "$pkgdir/usr/bin/wkhtmltoimage" || return 1

  # Generate and install man page
  install -d "$pkgdir/usr/share/man/man1"
  ./wkhtmltox/bin/wkhtmltopdf --manpage >"$pkgdir/usr/share/man/man1/wkhtmltopdf.1"
}

