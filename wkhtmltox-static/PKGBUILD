# Maintainer: Simon Lipp <sloonz+aur@gmail.com>

pkgname=wkhtmltox-static
pkgver=0.12.0
pkgrel=1
pkgdesc="Simple shell utility to convert html to pdf or image using the webkit rendering engine, and qt (upstream static build)"
arch=('i686' 'x86_64')
url="http://wkhtmltopdf.org/"
license=('GPL3')
conflicts=('wkhtmltopdf')
options=('!strip')
if [ "$CARCH" = "i686" ]; then
  _arch="i386"
  sha256sums=('56ff37c4554a6d93f5e9df5ea3625c50878bc28709e99fe77f24ccfdab8dd471')
else
  _arch="amd64"
  sha256sums=('f8e97fdc444f8a0045aad1ff871d4b29c1788efe13f006c4864ac17e65478846')
fi
source=(http://downloads.sourceforge.net/project/wkhtmltopdf/0.12.0/wkhtmltox-linux-${_arch}_${pkgver}-03c001d.tar.xz)

package() {
  cd "$srcdir/wkhtmltox"

  for f in bin/* include/wkhtmltox/* lib/libwkhtmltox.so.0.12.0 ; do
    install -D $f "$pkgdir/usr/$f" || return 1
  done

  (cd "$pkgdir/usr/lib/" &&
  ln -s libwkhtmltox.so.0.12.0 libwkhtmltox.so.0.12 &&
  ln -s libwkhtmltox.so.0.12.0 libwkhtmltox.so.0) || return 1

  # Generate and install man page
  install -d "$pkgdir/usr/share/man/man1"
  ./bin/wkhtmltopdf --manpage >"$pkgdir/usr/share/man/man1/wkhtmltopdf.1" || return 1
}
