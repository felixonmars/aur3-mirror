# Maintainer: masterkorp  <masterkorp@masterkorp.net>
# Submit any patches to https://github.com/masterkorp/pkgbuilds

pkgname=texlive-draftwatermark-git
_gitname=latex-draftwatermark
pkgver=26.651e525
pkgrel=1
license=('GPL')
depends=('texlive-core')
pkgdesc="draftwatermark – Put a grey textual watermark on document pages."
url="http://ctan.org/tex-archive/macros/latex/contrib/draftwatermark"
arch=('any')
install=texlive-draftwatermark-git.install
source=($_gitname::git+git://github.com/callegar/LaTeX-draftwatermark.git)
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$_gitname"
  pdflatex draftwatermark.ins
}
package() {
  cd "$_gitname"
	install -Dm644 draftwatermark.sty $pkgdir/usr/share/texmf/tex/latex/draftwatermark/draftwatermark.sty
	install -Dm644 README $pkgdir/usr/share/doc/texlive-draftwatermark-git/README
	install -Dm644 test_draftwatermark.tex $pkgdir/usr/share/doc/texlive-draftwatermark-git/test_draftwatermark.tex
}
