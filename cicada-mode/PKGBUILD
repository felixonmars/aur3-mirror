
# Maintainer: XIE Yuheng <xyheme@gmail.com>

pkgname=cicada-mode
pkgver=20140731
pkgrel=1
epoch=
pkgdesc="emacs mode for cicada language"
arch=('x86_64')
url="https://bitbucket.org/cicada-language/cicada-mode"
license=('ISC')
groups=()
depends=('emacs' 'xyh-emacs-lib' 'mercurial' 'cicada')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('hg+https://bitbucket.org/cicada-language/cicada-mode')
noextract=()
md5sums=('SKIP')

package() {
  cd "$srcdir/$pkgname/"
  install -d $pkgdir/usr/share/emacs/site-lisp/
  # install the files in directory created above
  install -m644 cicada-mode.el -t $pkgdir/usr/share/emacs/site-lisp/
  install -m644 inferior-cicada-mode.el -t $pkgdir/usr/share/emacs/site-lisp/
}