# Contributor: portix <portix@gmx.net>

pkgname=dwb-gtk3-git
_gitname=dwb
pkgver=2013.11.19.g518ff30
pkgrel=1
pkgdesc="A webkit web browser with vi-like keyboard shortcuts, latest git-pull" 
url="http://portix.bitbucket.org/dwb-git"
arch=('i686' 'x86_64')
license=('GPL')
depends=('webkitgtk' 'desktop-file-utils')
provides=(dwb)
source=("git+https://portix@bitbucket.org/portix/dwb.git")
install=dwb.install
conflicts=('dwb' 'dwb-git' 'dwb-gtk3' 'dwb-gtk3-hg' 'dwb-hg')
makedepends=('git' 'json-c')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir"/$_gitname
    git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}
build() {
  cd "$srcdir/$_gitname"
  make GTK=3
}
package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="${pkgdir}" install \
      BASHCOMPLETION=/usr/share/bash-completion/completions
}
