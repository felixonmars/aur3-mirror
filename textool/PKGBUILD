# Maintainer: TDY <tdy@gmx.com>

pkgname=textool
pkgver=1.4.3
pkgrel=1
pkgdesc="A QT suite for LaTeX"
arch=('i686' 'x86_64')
url="http://www.phenix.bnl.gov/WWW/publish/hpereira/software/index.php?page=package&package_list=software_list_qt4&package=textool-qt4&full=1"
license=('GPL')
depends=('qt')
optdepends=('ghostscript: postscript to pdf file converter plugin (ps2pdf)'
            'gv: postscript file viewer plugin'
            'nedit: text editor plugin'
            'texlive-bin: LaTeX plugin (latex/dvips/xdvi)'
            'xpdf: pdf file viewer plugin')
source=(http://www.phenix.bnl.gov/WWW/publish/hpereira/software/tgz/$pkgname-qt4_$pkgver.tar.gz)
md5sums=('ed380565e30fa686a8d7fb8df8911630')

build() {
  cd "$srcdir/$pkgname-qt4_$pkgver"
  ./autogen.sh --prefix=/usr --with-qt-dir=/usr
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-qt4_$pkgver"
  make DESTDIR="$pkgdir" install
}
