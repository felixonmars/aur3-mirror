#Contributor: Dmitry Batenkov <dima dot batenkov at gmail dot com>

pkgname=culmus-latex
pkgver=0.7.1
pkgrel=1
pkgdesc="Culmus Hebrew fonts for LaTeX"
arch=('i686' 'x86_64')
url="http://ivritex.sourceforge.net/"
depends=('culmus' 'texlive-core' 'texlive-bin')
install=culmus-latex.install
license=('GPL')
source=(http://downloads.sourceforge.net/project/ivritex/culmus-latex/culmus-latex-0.7/culmus-latex-0.7-r1.tar.gz)
md5sums=('0c6f6d5b9e7a0d6ba59fc55680ed48a5')

build(){
	cd ${srcdir}/${pkgname}-0.7-r1 || return 1
	mkdir -p $pkgdir/usr/share/texmf || return 1
	make DESTDIR=$pkgdir pkginstall
}
