# Maintainer: Oguz Han Asnaz <O.Asnaz@gmx.net>
pkgname=subtle-contrib-hg
pkgver=113
pkgrel=1
pkgdesc="Contrib is just a collection of scripts for subtle."
arch=('any')
url="http://subforge.org/projects/subtle-contrib"
license=('GPL')
makedepends=('mercurial')
md5sums=() #generate with 'makepkg -g'

_hgroot=http://hg.subforge.org
_hgrepo=subtle-contrib

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [[ -d "$_hgrepo" ]]; then
    cd "$_hgrepo"
    hg pull -u
    msg "The local files are updated."
  else
    hg clone "$_hgroot" "$_hgrepo"
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  msg "Copying files..."
  mkdir -p "${pkgdir}/usr/share/${pkgname}/"
  cp -R ruby/* "${pkgdir}/usr/share/${pkgname}/"
}

# vim:set ts=2 sw=2 et:
