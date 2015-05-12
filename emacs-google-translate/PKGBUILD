# Maintainer: Marko Vojvodic <markovojvodic84@gmail.com>
pkgname=emacs-google-translate
pkgver=0.1
pkgrel=1
pkgdesc="Google translate in emacs. Easy translate of marked text. Enjoy. Installation instructions here: http://aur.pastebin.com/raw.php?i=XLEcw7jB"
arch=('i686' 'x86_64')
url="http://old.nabble.com"
license=('GPL3')
depends=('emacs')
source=(http://old.nabble.com/attachment/26564629/0/gtranslate.el)
md5sums=('3d4c13688824e6ba29c86f3fe8d690ea')

package() {
   cd $startdir/
   install -Dm644 $startdir/gtranslate.el $startdir/pkg/usr/share/emacs/site-lisp/gtranslate.el
}
