# Maintainer: Christos Tsolakis <youkol123 at gmail dot com>
pkgname=sympytex
pkgver=1.0
pkgrel=1
pkgdesc="Embed sympy commands within a LaTeX document."
arch=('i686' 'x86_64')
url="http://elec.otago.ac.nz/w/index.php/SympyTeX"
license=('GPL2')
depends=('python2-sympy' 'python2-matplotlib' 'texlive-core')
#provides=()
#conflicts=()
install='sympytex.install'

source=('https://github.com/tmolteno/SympyTeX/archive/master.zip')
md5sums=('ce0ced3276cfa321305b61ab4fd1a689')

#build() {

#}

package() {
	mkdir -p $pkgdir/usr/share/texmf/tex/latex/sympytex
	install -D -m644 $srcdir/SympyTeX-master/sympytex.sty $pkgdir/usr/share/texmf/tex/latex/sympytex/sympytex.sty
	install -D -m644 $srcdir/SympyTeX-master/sympytex.py $pkgdir/usr/lib/python2.7/site-packages/sympytex.py
}
