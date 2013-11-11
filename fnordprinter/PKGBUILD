# Maintainer:  Jan Krings <liquidsky42 || googlemail || com>

pkgname=fnordprinter
pkgver=20131110
pkgrel=2
pkgdesc="twitter to the shell or somewhere else"
arch=('i686' 'x86_64')
url="http://fNordeingang.de"
license=('BSD')
depends=('nodejs')
makedepends=('nodejs' 'git' )
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot=https://github.com/fNordeingang/fNordPrinter.git
_gitname=fNordPrinter

build() {
  cd "$srcdir"
  
  msg "Connecting to GIT server...."
  
  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi
  
  msg "GIT checkout done or server timeout"
  msg "Starting build..."
  
  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  npm install
}

package() {
  cd "$srcdir"
  ln -s "${srcdir}/${_gitname}-build/printer" "${pkgdir}/usr/bin/fNordPrinter"
  install -D -m644 "${srcdir}/${_gitname}-build/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
