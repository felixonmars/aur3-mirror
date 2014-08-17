# Maintainer: Steve Engledow <steve at offend dot me dot uk>
pkgname='git-aux-git'
pkgver=0.3
pkgrel=1
pkgdesc="Use git to manage often-replicated files across computers"
arch=('i686' 'x86_64')
url="https://github.com/stilvoid/git-aux"
license=('MIT')
depends=('git' 'coreutils' 'findutils')
noextract=()
md5sums=() #generate with 'makepkg -g'

build() {
  cd "$srcdir"

  if [ -d git-aux ]; then
    cd git-aux
    git checkout master
    git pull
  else
    git clone git://github.com/stilvoid/git-aux.git git-aux
  fi
}

package() {
  cd "$srcdir/git-aux"
  PREFIX=${pkgdir}/usr make -e install
}
