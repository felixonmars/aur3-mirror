# Contributor: 0mark <mark@unserver.de>

pkgname=dwb_collect-git
_gitname=dwb_collect
pkgver=2014.12.03.g6f27667
pkgrel=1
pkgdesc="A webkit web browser with vi-like keyboard shortcuts (with patches), latest git-pull"
url="https://bitbucket.org/0mark/dwb_collect"
arch=('i686' 'x86_64')
license=('GPL')
depends=('webkitgtk2' 'desktop-file-utils')
provides=(dwb)
source=("git+https://bitbucket.org/0mark/dwb_collect.git")
install=dwb.install
conflicts=('dwb' 'dwb-gtk3-git' 'dwb-gtk3' 'dwb-gtk3-hg' 'dwb-hg' 'dwb-git')
makedepends=('git' 'json-c')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir"/$_gitname
    git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}
build() {
  cd "$srcdir/$_gitname"
  make 
}
package() {
    cd "${srcdir}/${_gitname}"
    make DESTDIR="${pkgdir}" install \
        BASHCOMPLETION=/usr/share/bash-completion/completions
}
