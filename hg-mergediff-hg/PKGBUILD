
# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from Mercurial(hg) sources.

# Maintainer: Your Name <youremail@domain.com>
pkgname=hg-mergediff-hg
_pkgname=hg-mergediff
pkgver=14
pkgrel=1
pkgdesc="Show the changes introduced by a merge."
arch=('i686' 'x86_64')
url="https://bitbucket.org/wolever/hg-mergediff/overview"
license=('unknown')
makedepends=('mercurial')
md5sums=() #generate with 'makepkg -g'

_hgroot="https://bitbucket.org/wolever/$_pkgname"
_hgrepo="$_pkgname"

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
}

package() {
  install -m755 -d "$pkgdir/usr/lib/python2.7/site-packages/"
  install -m644 "$srcdir/$_pkgname/mergediff.py" "$pkgdir/usr/lib/python2.7/site-packages/"
}

# vim:set ts=2 sw=2 et:
