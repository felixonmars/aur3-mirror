# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>

pkgname=learn-c-the-hard-way-git
pkgver=20120307
pkgrel=1
pkgdesc="A book on C programming to anyone who has already learned other programming language."
arch=('any')
url="http://c.learncodethehardway.org/"
license=('Free')
depends=()
makedepends=('git' 'dexy' 'texlive-core' 'texlive-fontsextra' 'texlive-latexextra' 'texlive-htmlxml')
options=('!strip')

_gitroot="git://gitorious.org/learn-c-the-hard-way/learn-c-the-hard-way.git"
_gitname="learn-c-the-hard-way"

build() {
  cd "$srcdir"
  msg "Connecting to Git server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files were updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "Git checkout done or server timeout."

  export MAKEFLAGS="-j1"
  cd "$srcdir/$_gitname"
  sed -i "/gsed/d" Makefile

  dexy setup
  make book
  make html
}

package() {
  cd "$srcdir/$_gitname/output"
  install -d "$pkgdir/usr/share/doc/$pkgname/html"
  cp -f $_gitname.pdf "$pkgdir/usr/share/doc/$pkgname/"
  cp -fr *{.html,.css} "$pkgdir/usr/share/doc/$pkgname/html"
}
