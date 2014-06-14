# Maintainer: xylosper <darklin20@gmail.com>

_name="nanumbaruntype1"
_ktug="http://ftp.ktug.org/KTUG/texlive/tlnet/archive"
_dest="/usr/share/texmf-dist"

pkgname=("texlive-$_name")
pkgver=100
pkgrel=2
pkgdesc="Nanum Barun Gothic type1 subfonts"
arch=('i686' 'x86_64')
url="http://project.ktug.org/ko.TeX"
license=('GPL')
depends=('texlive-core' 'texlive-bin')
source=($_ktug/$_name.tar.xz)
md5sums=('f22091559008dadf1ac19e8b4f6923e1')
install="texlive.install"

build() {
  cd "$srcdir"
  echo "Map nnmbrfonts.map" > $pkgname.maps
}

package() {
  cd "$srcdir"
  install -d -m755 $pkgdir/var/lib/texmf/arch/installedpkgs
  install -d -m755 "$pkgdir$_dest"

  install -m644 $pkgname.maps $pkgdir/var/lib/texmf/arch/installedpkgs/
  cp -a fonts tex "$pkgdir$_dest"
}
