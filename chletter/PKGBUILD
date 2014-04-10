#Creator rousselot.loic@gmail.com

pkgname=chletter
pkgver=2.0
pkgrel=1
pkgdesc="A swiss letter layout for latex"
arch=('any')
url="http://www.ctan.org/tex-archive/macros/latex/contrib/chletter"
license=('GPL')
depends=('texlive-core' 'texlive-latexextra' 'texlive-fontsextra')
source=(chletter.zip::http://mirrors.ctan.org/macros/latex/contrib/chletter.zip)
md5sums=('21c31491329d0d4973c08b45344e5d84')
install=chletter.install

package() {
      cd "${srcdir}"
        install -dm755 "${pkgdir}/usr/share/texmf/tex/latex"
          cp -r chletter "${pkgdir}/usr/share/texmf/tex/latex"
      }
