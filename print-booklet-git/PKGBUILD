# Maintainer: Wilhelm Matilainen <wilhelm.matilainen@gmail.com>
pkgname=print-booklet-git
pkgver=20111104
pkgrel=2
pkgdesc="Print booklets from pdf and postscript files."
arch=(any)
url="https://gitorious.org/scripd/print-booklet"
license=('AGPL3')
groups=()
depends=('psutils')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot="git://gitorious.org/scripd/print-booklet.git"
_gitname="print-booklet"

indir="$srcdir/$_gitname"
outdir="$pkgdir/usr/bin/"

function inbin()
{
  install -Dm755 "$indir/$1" "$outdir/$1" 
}

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

  #
  # BUILD HERE
  #

  inbin print-booklet-ps
  inbin print-booklet-pdf
  inbin print-booklet-allindir
}

# vim:set ts=2 sw=2 et:
