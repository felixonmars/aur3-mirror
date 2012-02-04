# Contributor: Asa Marco <marcoasa90@gmail.com>

pkgname=accentuate-git
pkgver=20081024
pkgrel=1
pkgdesc="Presentation tool based on KeyJnote, shows pdf/png using openGL"
arch=('i686' 'x86_64')
url="http://www.cs.rit.edu/~jrm8005/accentuate.html"
license=('GPL')
depends=('python-opengl' 'python-pygame' 'pil' 'poppler')
makedepends=('git')
optdepends=('mplayer: needed to play audio and videos' 'pylirc: enable LIRC support' 'pdftk: enable hyperlinks')
source=()
md5sums=()

_gitroot="git://repo.or.cz/accentuate.git"
_gitname="accentuate"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  install -D -m755 accentuate ${startdir}/pkg/usr/bin/accentuate
}
