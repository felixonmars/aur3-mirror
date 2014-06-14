# Maintainer: xylosper <darklin20@gmail.com>

_name="unfonts-extra"
_ktug="http://ftp.ktug.org/KTUG/texlive/tlnet/archive"
_dest="/usr/share/texmf-dist"

pkgname=("texlive-$_name")
pkgver=100
pkgrel=2
pkgdesc="extra Type1/TTF of unfonts"
arch=('i686' 'x86_64')
url="http://project.ktug.org/ko.TeX"
license=('GPL')
depends=('texlive-core' 'texlive-bin')
source=($_ktug/$_name.tar.xz)
md5sums=('034089d3b93e9dbf0a72b932c038400f')
install="texlive.install"

build() {
  cd "$srcdir"
  echo "Map unfonts-extra.map" > $pkgname.maps
}

package() {
  cd "$srcdir"
  install -d -m755 $pkgdir/var/lib/texmf/arch/installedpkgs
  install -d -m755 "$pkgdir$_dest"

  install -m644 $pkgname.maps $pkgdir/var/lib/texmf/arch/installedpkgs/
  cp -a fonts tex "$pkgdir$_dest"
}
