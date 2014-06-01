
# Maintainer: XIE Yuheng <xyheme@gmail.com>

pkgname=xiaolinguist-mode
pkgver=20140531
pkgrel=1
epoch=
pkgdesc="emacs mode for xiaolinguist language"
arch=('x86_64')
url="https://bitbucket.org/xiaolinguist/xiaolinguist"
license=('ISC')
groups=()
depends=('emacs' 'xyh-emacs-lib' 'mercurial' 'xiaolinguist')
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
source=('hg+https://bitbucket.org/xiaolinguist/xiaolinguist-mode')
noextract=()
md5sums=('SKIP')

package() {
  cd "$srcdir/$pkgname/"
  install -d $pkgdir/usr/share/emacs/site-lisp/
  # install the files in directory created above
  install -m644 xiaolinguist-mode.el -t $pkgdir/usr/share/emacs/site-lisp/
  install -m644 inferior-xiaolinguist-mode.el -t $pkgdir/usr/share/emacs/site-lisp/
}