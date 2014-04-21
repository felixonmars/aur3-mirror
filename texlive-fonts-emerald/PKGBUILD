pkgname=texlive-fonts-emerald
pkgver=2006.01.29
pkgrel=1
pkgdesc="Provides the emerald fonts package for the TeX Live LaTeX distribution"
license=('GPL')
arch=(any)
depends=('texlive-core')
url='http://www.ctan.org/tex-archive/fonts/emerald/'
source=("http://mirrors.ctan.org/fonts/emerald.zip" "$pkgname.maps")
options=('!emptydirs')
options=(!strip)
install=texlive.install
md5sums=('9f97da04200bba282ca7f5a3788934be'
         '64e613ad60d66e36a72db045830b6700')

build() {
   cd "${srcdir}/emerald"
   rm -rf {README,doc}
}

package() {
   cd "${srcdir}/emerald"
   install -m755 -d "${pkgdir}/var/lib/texmf/arch/installedpkgs"
   install -m644 "../${pkgname}.maps" "${pkgdir}/var/lib/texmf/arch/installedpkgs/"
   install -m755 -d "${pkgdir}/usr/share/texmf-dist"
   for folder in fonts other tex
   do
      cp $folder "${pkgdir}/usr/share/texmf-dist/" -R
   done
}
