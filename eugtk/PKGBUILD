# Maintainer:  perlawk

pkgname=eugtk
_pkgname=euphoria
pkgver=4.7.2
pkgrel=1
pkgdesc="A fast and easy-to-use 'wrapper' for GTK and Euphoria on Linux."
url="https://sites.google.com/site/euphoriagtk/Home"
license=('custom:"OpenEuphoria License"')
depends=('euphoria64' 'gtk3')
arch=('x86_64')
source=( "https://sites.google.com/site/euphoriagtk/EuGTK${pkgver}.tar.bz2?attredirects=0" )

package() {
  cd "${srcdir}/demos"

  mkdir -p "${pkgdir}/usr/share/${_pkgname}/include"
	cp  Gtk*.e "${pkgdir}/usr/share/${_pkgname}/include" 
}

md5sums=('5dfb456f71f89d0dbcc0f0ce60318d54')
