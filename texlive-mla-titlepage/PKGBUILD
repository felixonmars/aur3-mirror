# Original author: Eric Jiang
# Submitter: Ian Brunton  <iandbrunton @gmail.com>
# Maintainer: Ian Brunton  <iandbrunton @gmail.com>
# Last edited: 18 September 2011

pkgname=texlive-mla-titlepage
pkgver=1
pkgrel=1
license=('GPL')
depends=('texlive-core')
pkgdesc="A LaTeX package to create documents in MLA style with a titlepage"
url="http://notes.ericjiang.com/posts/37"
arch=('any')
install=texlive-mla-titlepage.install
source=(http://files.aztekera.com/schoolwork/mlawithtitle.sty)

build()
{
	mkdir -p $pkgdir/usr/share/texmf/tex/latex/mlawithtitle
	cp $srcdir/mlawithtitle.sty $pkgdir/usr/share/texmf/tex/latex/mlawithtitle
}
md5sums=('aca2edddab788d9abf66f326cf71d675')
