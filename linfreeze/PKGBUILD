# Maintainer: Ryan Peters <sloshy45 _AT_ sbcglobal _DOT_ net>
# If you have any bugs with the project, please check out its URL and report them.
pkgname=linfreeze
pkgver=0.9.4
pkgrel=1
pkgdesc="A utility to prevent permanent file changes."
arch=('any')
url="http://github.com/sloshy/LinFreeze"
license=('GPL')
makedepends=(gzip)
depends=('filesystem' 'bash' 'sed' 'aufs2')
source=("https://github.com/sloshy/LinFreeze/tarball/v0.9.4")
md5sums=('89d71b64d1a3b7553c188b48a9048093')

build() {
  cd "$srcdir/sloshy-LinFreeze-42cc688"
  mkdir -p usr/share/locale/es/LC_MESSAGES/
  msgfmt -o usr/share/locale/es/LC_MESSAGES/linfreeze.mo es.po
  mkdir -p usr/bin/
  mkdir -p usr/share/man/man1/
  mv linfreeze usr/bin/
  mv linfreeze.1 usr/share/man/man1/linfreeze.1
  cp -R usr $pkgdir/
}
# vim:syntax=sh
