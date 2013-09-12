# Contributor: Ivy Foster <joyfulgirl@archlinux.us>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Heeru Kiyura <M8R-p9i5nh@mailinator.com>

pkgname=conkeror-refactor-completions-git
pkgver=130817.1.14.g365e95f
pkgrel=1
pkgdesc="A highly programmable web browser. Branch 'refactor-completers'."
arch=('i686' 'x86_64')
url="http://conkeror.mozdev.org/"
license=('MPL' 'GPL' 'LGPL')
depends=('xulrunner' 'desktop-file-utils')
makedepends=('git' 'imagemagick')
provides=('conkeror-git')
conflicts=('conkeror-git')
source=(conkeror-refactor-completers::git://repo.or.cz/conkeror.git#branch=refactor-completers conkeror.sh)
md5sums=('SKIP' '11c6c76a2639254754b34a542f1965a1')
install=conkeror-git.install
_gitname=conkeror-refactor-completers

pkgver() {
  cd $_gitname
  git describe --tags|sed 's/-/./g'|cut -c20-
}

build() {
  cd "$srcdir"/${_gitname}
  make
}

package() { 
  cd "$srcdir"/${_gitname}

  install -d "$pkgdir"/usr/share/{conkeror,man/man1,pixmaps}
  cp -a "$srcdir"/${_gitname}/* "$pkgdir"/usr/share/conkeror

  install -Dm644 "$pkgdir"/usr/share/conkeror/contrib/man/conkeror.1 \
    "$pkgdir"/usr/share/man/man1/conkeror.1
  install -Dm644 "$srcdir"/${_gitname}/debian/conkeror.desktop \
    "$pkgdir"/usr/share/applications/conkeror.desktop
  install -Dm755 "$srcdir"/conkeror.sh "$pkgdir"/usr/bin/conkeror

  mv "$pkgdir"/usr/share/conkeror/conkeror-spawn-helper "$pkgdir"/usr/bin
  rm "$pkgdir"/usr/share/conkeror/conkeror-spawn-helper.c
  rm -r "$pkgdir"/usr/share/conkeror/contrib/man
  rm -r "$pkgdir"/usr/share/conkeror/debian
} 
