# Maintainer: Cameron Will <cwill747@gmail.com>
# Contributor: zhuqin <zhuqin83@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=dia-git
pkgver=DIA_0_97_0.1100.gbd53261
pkgrel=1
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
source=($pkgname.install)
noextract=()
md5sums=('7352454e14410bfd7cc70d8c8b0da03f')
options=('!emptydirs' '!libtool')
source=(package.patch)
_gitroot="git://git.gnome.org/dia"
_gitname="dia-git"


pkgver() {
  cd "${_gitname}"
  git describe --always | sed -e 's|-|.|g'
}

build() {
  cd $srcdir
  msg "Connecting to the GIT server...."
  
  if [[ -d "$_gitname" ]] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi
  
  msg "GIT checkout done or server timeout"
  msg "Starting make..."
#
   rm -rf $srcdir/$_gitname-build
   git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
   cd "$srcdir/$_gitname-build"
   export PYTHON=/usr/bin/python2
    patch -p1 <$srcdir/package.patch
  ./autogen.sh --prefix=/usr \
    --with-cairo \
    --disable-gnome \
    --with-hardbooks
  make
  #cd doc
  #make html

 }

package(){
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
