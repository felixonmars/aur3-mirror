# Maintainer: Maribu

pkgname=texlive-esvect
pkgver=2011.24706
_revnr=${pkgver#2011.}
pkgrel=1
pkgdesc="TeX Live - Font for writing vectors"
license=('GPL')
arch=(any)
depends=('texlive-core')
conflicts=('texlive-fontsextra')
groups=('texlive-most')
url='http://tug.org/texlive/'
source=("esvect.tar.xz" "$pkgname.maps")
options=('!emptydirs')
options=(!strip)
install=texlive.install
md5sums=('ef58c1cace8681e8402be45035a3a2d3'
         '63842e9f07aad0541b6428b847105100')

build() {
   cd $srcdir
   mkdir -p $pkgdir/usr/share
   mkdir -p $pkgdir/var/lib/texmf/arch/installedpkgs
   cp -R $srcdir/esvect/texmf-dist $pkgdir/usr/share
   install -m644 $pkgname.maps $pkgdir/var/lib/texmf/arch/installedpkgs/
}
