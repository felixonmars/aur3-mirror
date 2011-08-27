# Maintainer: Marko Vojvodic <markovojvodic84@gmail.com>
pkgname=emacs-gtranslate
pkgver=0.1
pkgrel=1
pkgdesc="Google translate in emacs. Easy translate of marked text. Enjoy. After installation visit: http://aur.pastebin.com/raw.php?i=XLEcw7jB for .emacs settings"
arch=('i686' 'x86_64')
url="http://old.nabble.com"
license=('GPL3')
depends=('emacs')
source=(http://old.nabble.com/attachment/26564629/0/gtranslate.el)
md5sums=('fe9d19489cc34cfb827e0f8b54a0e79b')

build() {
   cd $startdir/
   install -Dm644 $startdir/gtranslate.el $startdir/pkg/usr/share/emacs/site-lisp/gtranslate.el
}
