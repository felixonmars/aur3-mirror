# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: aparaatti <nikohuma at gmail dot com>
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Bernardo Barros <bernardobarros@NOSPAM.gmail.com>

pkgname=csoundqt-git
_pkgname=csoundqt
_gitname=qutecsound
pkgver=0.9.0.r12.gaa3f102
pkgrel=1
pkgdesc="cross platform editor and front-end for Csound with syntax highlighting and control widgets"
arch=('x86_64' 'i686')
url="http://qutecsound.sourceforge.net/"
license=('GPL3' 'LGPL2')
depends=('csound' 'qt4')
makedepends=('git')
optdepends=('csound-doc: html online manual, opcode lookups and more' )
provides=('csoundqt')
conflicts=('csoundqt')
replaces=('qutecsound')
install="${_pkgname}.install"
source=("git://qutecsound.git.sourceforge.net/gitroot/qutecsound/qutecsound"
        "${_pkgname}.desktop")
md5sums=('SKIP'
         'a352bbc3e071bfc1e4c5d17ffa4827a2')


pkgver() {
  cd "$_gitname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_gitname"
  # DEFAULT_HTML_DIR "/usr/share/doc/csound-doc/html"
  sed -e 's@"csdocdir", ""@"csdocdir", DEFAULT_HTML_DIR@' \
        -e 's@/usr/share/qutecsound/Examples/@/usr/share/csoundqt/Examples/@g' -i src/qutecsound.cpp
  sed 's@../../csoundqt/src/Scripts@/usr/share/csoundqt/Scripts@' -i src/types.h
}

build() {
  cd $_gitname

  qmake-qt4 qcs.pro
  make
}

package() {
  #  cd "$srcdir/$_gitname-build"
  #  make DESTDIR="$pkgdir/" install

  cd $_gitname

  # Prepare folders
  install -d $pkgdir/usr/{bin,share/{applications,{,doc}/${_pkgname}}}

  # Bin file
  install -Dm755 bin/CsoundQt-d "$pkgdir/usr/bin/${_pkgname}"

  # Examples docs and data

   cp -a examples $pkgdir/usr/share/${_pkgname}
   cp -a images $pkgdir/usr/share/${_pkgname}
   cp doc/* $pkgdir/usr/share/doc/${_pkgname}

  # Desktop file and pixmaps
   install -Dm644 $srcdir/${_pkgname}.desktop "$pkgdir/usr/share/applications"
   install -Dm644 images/qtcs.png "$pkgdir/usr/share/pixmaps/${_pkgname}.png"
}
