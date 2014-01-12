# Mainteners: Paolo <paolo.bolzoni.brown@gmail.com>
pkgname=darkradiant-git
pkgver=1.8.0.r135.gab66750
pkgrel=1
pkgdesc='Open-source fork of GtkRadiant: a level editor for Doom3 and The Dark Mod'
arch=(i686 x86_64)
url='http://darkradiant.sourceforge.net/'
license=('GPL')
groups=()
depends=('boost' 'freealut' 'glew' 'gtkglextmm' 'libgtksourceviewmm2' 'openal' 'python' 'ftgl')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('git://github.com/orbweaver/DarkRadiant.git')
noextract=()
md5sums=(SKIP)

_gitname=DarkRadiant

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}


prepare() {
  cd "$srcdir"
  rm -rf "$srcdir/$_gitname-build"
  git clone "$startdir/$_gitname" "$srcdir/$_gitname-build"

  cd "$srcdir/$_gitname-build"
}


build() {
  cd "$srcdir/$_gitname-build"

  # BUILD HERE
  ./autogen.sh
  boost_cv_lib_python='donottest' ./configure --prefix=/usr --enable-darkmod-plugins  --enable-python
  make
}


package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
