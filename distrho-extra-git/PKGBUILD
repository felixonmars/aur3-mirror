# Maintainer : <dreamspepser at yahoo dot it>

pkgname=distrho-extra-git
pkgver=20120324
pkgrel=1
pkgdesc="Extras from Distrho Audio Plugins (HybridReverb2)"
arch=('any')
url="http://distrho.sourceforge.net/"
license=('GPL' 'GPL3' 'LGPL')
depends=('distrho-plugins')
provides=('distrho-extra')
conflicts=('distrho-extra')

_gitroot=git://distrho.git.sf.net/gitroot/distrho/distrho
_gitname=distrho

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

}

package() {
  cd "$srcdir/$_gitname-build"

  # HybridReverb2 data
  cd ports/hybridreverb2/data
  install -Dm644 HybridReverb2.conf \
    "$pkgdir/etc/HybridReverb2/HybridReverb2.conf"
  install -d "$pkgdir/usr/share"
  cp -a HybridReverb2 \
    "$pkgdir/usr/share"
}

# vim:set ts=2 sw=2 et:
