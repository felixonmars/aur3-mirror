# Maintainer: rcy <young at math dot umass dot edu>
# Contributor: rcy <young at math dot umass dot edu>

pkgname=hyperlatex
pkgver=2.9a
pkgrel=1
pkgdesc="Hyperlatex - generate HTML from (modified) LaTeX source"
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/hyperlatex/'
license=('GPL')
depends=('texlive-core' 'emacs')
install=texlive.install
source=("http://downloads.sourceforge.net/hyperlatex/Hyperlatex-$pkgver.tar.gz")
md5sums=('71ce79adda7315a65c011929b4434659')

build() {
   cd $srcdir/Hyperlatex-$pkgver
   install -m755 -d $pkgdir/usr/share/texmf-dist/tex/latex/hyperlatex/
   install -m644 etc/hyperlatex.sty \
        $pkgdir/usr/share/texmf-dist/tex/latex/hyperlatex/ || return 1

   mv hlx/contrib/longtable.hlx hlx/newlongtable.hlx
   install -m755 -d $pkgdir/usr/share/texmf-dist/hyperlatex
   install -m644 hlx/*.hlx \
	hlx/contrib/*.hlx \
	hlx/contrib/rhxhlx/*.hlx \
	bin/normalize-eps.awk \
	hlx/hyperlatex.el \
	$pkgdir/usr/share/texmf-dist/hyperlatex || return 1

   sed -i '/HYPERLATEX_SYS_DIR=/s#\".*\"#"/usr/share/texmf-dist/hyperlatex"#' bin/hyperlatex || return 1
   install -m755 -d $pkgdir/usr/bin/
   install -m755 bin/hyperlatex bin/ps2image $pkgdir/usr/bin/ || return 1

   install -m755 -d $pkgdir/usr/share/texmf-dist/hyperlatex/doc
   install -m644 doc/* \
	$pkgdir/usr/share/texmf-dist/hyperlatex/doc || return 1
   
   install -m755 -d $pkgdir/usr/share/texmf-dist/hyperlatex/doc/rhxhlx/
   install -m644 hlx/contrib/rhxhlx/*x hlx/contrib/rhxhlx/pics/* \
	$pkgdir/usr/share/texmf-dist/hyperlatex/doc/rhxhlx || return 1

   cd $pkgdir/usr/share/texmf-dist/hyperlatex
   emacs -batch -q -no-site-file -l hyperlatex.el -f hyperlatex-compile

}
