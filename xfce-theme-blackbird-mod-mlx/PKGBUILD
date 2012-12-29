# Maintainer: Mike Krueger <info@memoryleakx.dudmail.com>

pkgname=xfce-theme-blackbird-mod-mlx
pkgver=0.3.3
pkgrel=1
pkgdesc="A dark, ink black Xfce theme, based off of Greybird. incl Darker Select Color"
arch=('any')
url="http://shimmerproject.org/"
license=('GPL3')
groups=('xfce-themes-shimmer-collection')
depends=('gtk-engine-murrine')
conflicts=('xfce-theme-blackbird')

source=("https://dl.dropbox.com/sh/l6b7tdyudg52phx/zDbyFrNPL_/blackbird_mod_mlx.tar.gz?dl=1")
md5sums=('d66648dfbd45295996d277b652a9b9f6')

package() {
  cd ${srcdir}
  mkdir -p $pkgdir/usr/share/themes/Blackbird/
  cp -R Blackbird/* $pkgdir/usr/share/themes/Blackbird
}
