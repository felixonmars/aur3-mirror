# Contributor: Cedric Marie <cedric.marie[at]yahoo[dot]fr>
# Maintainer: examon <examon.mail[at]gmail[dot]com>
pkgname=emacs-ide
pkgver=1.8
pkgrel=2
pkgdesc="Integrated Development Environment (IDE) interface for Emacs (code browsing, compilation, debug...)."
url="http://emacs-ide.tuxfamily.org/index.html"
arch=('any')
license=('GPL3')
depends=('emacs' 'ctags' 'cscope')
install=emacs-ide.install
source=("http://download.tuxfamily.org/eide/${pkgname}_${pkgver}.tar.bz2")
md5sums=('869baa4815ef89ae314e5f604ddd0925')
     
build() {
  cd ${pkgname}_${pkgver}
  rm -vf src/*.elc
  emacs -batch -nw -q -l compile-eide.el
}

package() {
  cd ${pkgname}_${pkgver}/src
  install -d $pkgdir/usr/share/emacs/site-lisp
  for _i in *
  do
    install -m644 ${_i} $pkgdir/usr/share/emacs/site-lisp/
  done
}
