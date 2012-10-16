pkgname=texlive-jlisting
pkgver=0.2
pkgrel=1
pkgdesc="Listings for Japanese."
arch=('any')
install="jlisting.install"

url="http://mytexpert.sourceforge.jp/index.php?Listings"

license=("public domain")
source=("http://sourceforge.jp/frs/redir.php?m=iij&f=/mytexpert/26068/jlisting.sty.bz2")
md5sums=("a8a5830151d7799fc0ce05132d205d44")
depends=('nkf' 'texlive-core' 'texlive-bin')
optdepends=()

build(){
    cd $srcdir/
}

package(){
    cd $srcdir/
    nkf -w --overwrite jlisting.sty
    mkdir -p $pkgdir/usr/share/texmf-dist/tex/latex/listings
    cp jlisting.sty $pkgdir/usr/share/texmf-dist/tex/latex/listings
}


