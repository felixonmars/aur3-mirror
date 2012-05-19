# Maintainer : <dreamspepser at yahoo dot it>

pkgname=distrho-standalone-git
pkgver=20120519
pkgrel=1
pkgdesc="Distrho Standalone Audio Plugins (TAL), using the JUCE Toolkit"
arch=('i686' 'x86_64')
url="http://distrho.sourceforge.net/"
license=('GPL' 'GPL3' 'LGPL')
depends=('alsa-lib' 'fftw' 'libxext' 'freetype2')
makedepends=('premake3' 'jack' 'libxinerama'
             'libxrender' 'libxcursor' 'qt')
optdepends=('jack: jack audio support'
            'distrho-extra-git: HybridReverb2 plugin')
provides=('distrho-standalone' 'distrho-plugins')
conflicts=('distrho-standalone')

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

  # generate build script
  scripts/premake-update.sh linux

  # --as-needed incompatible
  export LDFLAGS="${LDFLAGS//,--as-needed}"

  make standalone
}

package() {
  cd "$srcdir/$_gitname-build"

  # standalone bins
  install -d "$pkgdir/usr/bin"
  install -Dm755 bin/standalone/* "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
