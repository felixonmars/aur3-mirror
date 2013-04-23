# Maintainer: Cameron Will <cwill747@gmail.com>
# Contributor: zhuqin <zhuqin83@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=dia-git
pkgver=0.97.0.1100.gbd53261
pkgrel=4
pkgdesc="DIAgram Editor from GIT"
arch=('i686' 'x86_64')
url="http://live.gnome.org/Dia"
license=('GPL')
depends=('libxslt' 'desktop-file-utils' 'libart-lgpl' 'gtk2' 'hicolor-icon-theme')
makedepends=('gettext' 'intltool' 'git' 'pkg-config' 'python2' 'docbook-xsl')
optdepends=('libpng: for png export support'
'libart-lgpl: for PNG export support'
'libxslt: for the XSLT plugin'
)
provides=('dia')
conflicts=('dia')
install=$pkgname.install
source=('git://git.gnome.org/dia' 
        'package.patch')
noextract=()
md5sums=('SKIP' 
         '7352454e14410bfd7cc70d8c8b0da03f')
options=('!emptydirs' '!libtool')
_gitroot="git://git.gnome.org/dia"
_gitname="dia"


pkgver() {
  cd "${_gitname}"
  git describe --always | sed -e 's/-/./g' -e 's/DIA_//' -e 's/_/./g'
}

prepare() {
   cd "$srcdir/${_gitname}"
   export PYTHON=/usr/bin/python2
   patch -p1 <$srcdir/package.patch
}

build() {
  cd "$srcdir/$_gitname"   
  ./autogen.sh --prefix=/usr \
    --with-cairo \
    --disable-gnome \
    --with-hardbooks
  make

 }

package(){
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
