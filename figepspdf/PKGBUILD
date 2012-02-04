# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Your Name <pqueiros@gmail.com>
pkgname=figepspdf
pkgver=20080601
pkgrel=1
pkgdesc="linux/unix scripts to convert FIG files to EPS and PDF"
arch=('i686' 'x86_64')
url="http://www.few.vu.nl/~wkager/tools.htm"
license=('unknown')
#groups=()
depends=('ghostscript')
conflicts=('fig2ps')
#options=()
source=(http://www.few.vu.nl/~wkager/download/FigEpsPdf2008-06-01.tar.gz)
md5sums=('156dee15764b54289257c6e5d90e0a94')

build() {
echo hello
mkdir -p $pkgdir/usr/local/bin
install -m771 $srcdir/fig2eps $pkgdir/usr/local/bin/
install -m771 $srcdir/fig2pdf $pkgdir/usr/local/bin/
}

