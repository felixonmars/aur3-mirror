# Creator: Cristóvão Duarte Sousa <crisjss@gmail.com>
pkgname=qpdfpresenterconsole-git
pkgver=20111213
pkgrel=1
pkgdesc="A Keynote-like presentation tool for PDF (e.g. beamer)"
arch=('i686' 'x86_64')
url="https://gitorious.org/qpdfpresenterconsole/"
license=('custom')
groups=()
depends=('poppler-qt')
makedepends=('git' 'cmake' 'asciidoc')
provides=()
conflicts=('qpdfpresenterconsole')
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot=https://git.gitorious.org/qpdfpresenterconsole/qpdfpresenterconsole.git
_gitname=qpdfpresenterconsole

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
  mkdir "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/$_gitname"
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
  
  install -d -m755 ${pkgdir}/usr/share/licenses/${_gitname}
  install -D -m644 ${srcdir}/${_gitname}/LICENSE.txt ${pkgdir}/usr/share/licenses/${_gitname}
}

# vim:set ts=2 sw=2 et:
