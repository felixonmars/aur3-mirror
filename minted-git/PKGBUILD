# Maintainer: blomblom <blomblom@openmailbox.org>

pkgname=minted-git
pkgver=2.0.r0.g8353b80
pkgrel=1
pkgdesc="Highlighted source code for LaTeX."
url="https://github.com/gpoore/minted"
arch=('any')
license=('LPPL')
depends=('texlive-latexextra' 'python2-pygments' 'texlive-humanities')
source=('minted-git::git://github.com/gpoore/minted'
        'minted.install')
md5sums=('SKIP' 'a573ca786bc416e905171f49abf3ba46')
install=minted.install

pkgver() {
  cd "$pkgname"
  git describe --long | sed -r 's/v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname}/source
  tex minted.ins
}

package() {
  mkdir -p ${pkgdir}/usr/share/texmf/tex/latex/${pkgname}
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
  install -Dm644 ${srcdir}/${pkgname}/source/minted.sty ${pkgdir}/usr/share/texmf/tex/latex/${pkgname}
  install -Dm644 ${srcdir}/${pkgname}/source/minted.pdf ${pkgdir}/usr/share/doc/${pkgname}
}
