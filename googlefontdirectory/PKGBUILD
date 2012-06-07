# Contributer: giacomogiorgianni@gmail.com 

pkgname=googlefontdirectory
pkgver=1
pkgrel=1
pkgdesc="Extra console fonts from google"
arch=(any)
makedepends=(unzip fontconfig)
install="$pkgname.install"
url="https://www.google.com/webfonts"
license=('GPL')
source=("http://sourceforge.net/projects/linuxfreedomfor/files/Font/$pkgname.zip")
md5sums=('b599f2903c3c17c97779f7d8b9369ef4')

# No need to extract this twice - the "build" is just extracting to $pkgdir
noextract=($pkgname.zip)

build() {
  mkdir -p $pkgdir/usr/share/fonts
  unzip "$srcdir/${pkgname}.zip" -d "$pkgdir/usr/share/fonts" || return 1
  #fc-cache -fv
  }

# vim:set ts=2 sw=2 et:
