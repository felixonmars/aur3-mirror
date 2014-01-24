# Maintainer: Nils Sommer <mail@nilssommer.de>
pkgname=treefrog
pkgver=1.7.5
pkgrel=2
epoch=
pkgdesc="High-speed and Full-stack C++ Framework for Web Applications"
arch=(i686 x86_64)
url="http://www.treefrogframework.org/"
license=('BSD')
groups=()
depends=('qt5-base')
makedepends=()
checkdepends=()
optdepends=('postgresql-libs: postgresql driver for QtSql')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://downloads.sourceforge.net/project/$pkgname/src/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('54841420ed28a0d72a806e5cf7fccbdc') #generate with 'makepkg -g'

# We don't install the framework before the tools, so we have to tell the tools sources where to look
# for the header files and the compiled libs. For that purpose, some sed scripts are running after configure.
prepare() {  
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  
  cd "$srcdir/$pkgname-$pkgver/tools"
  echo "Changing header include path for tools/"
  # popularize treefrog-$okgver/include as additional header location.
  sed -i "s/\/usr\/include\/$pkgname/..\/include/g" Makefile
  
  cd "$srcdir/$pkgname-$pkgver/tools/tfmanager"
  echo "Changing header include path for tools/tfmanager/"
  # popularize treefrog-$okgver/include and treefrog-$okgver/src as additional header location.
  sed -i -e "s/\/usr\/include\/$pkgname/..\/..\/include/g" Makefile
  sed -i -e "/INCPATH/a\ -I..\/..\/src" Makefile
  sed -i -e "/INCPATH/N;s/\n//" Makefile
  # popularize treefrog-$okgver/src as additional lib location.
  sed -i -e "/LIBS/a\ -L..\/..\/src" Makefile
  sed -i -e "/LIBS/N;s/\n//" Makefile
  
  cd "$srcdir/$pkgname-$pkgver/tools/tfserver"
  echo "Changing header include path for tools/tfserver/"
  # popularize treefrog-$okgver/include and treefrog-$okgver/src as additional header location.
  sed -i "s/\/usr\/include\/$pkgname/..\/..\/include/g" Makefile
  sed -i -e "/INCPATH/a\ -I..\/..\/src" Makefile
  sed -i -e "/INCPATH/N;s/\n//" Makefile
  # popularize treefrog-$okgver/src as additional lib location.
  sed -i -e "/LIBS/a\ -L..\/..\/src" Makefile
  sed -i -e "/LIBS/N;s/\n//" Makefile
  
  cd "$srcdir/$pkgname-$pkgver/tools/tmake"
  echo "Changing header include path for tools/tmake/"
  # popularize treefrog-$okgver/include and treefrog-$okgver/src as additional header location.
  sed -i "s/\/usr\/include\/$pkgname/..\/..\/include/g" Makefile
  sed -i -e "/INCPATH/a\ -I..\/..\/src" Makefile
  sed -i -e "/INCPATH/N;s/\n//" Makefile
  # popularize treefrog-$okgver/src as additional lib location.
  sed -i -e "/LIBS/a\ -L..\/..\/src" Makefile
  sed -i -e "/LIBS/N;s/\n//" Makefile
  
  cd "$srcdir/$pkgname-$pkgver/tools/tspawn"
  echo "Changing header include path for tools/tspawn/"
  # popularize treefrog-$okgver/include and treefrog-$okgver/src as additional header location.
  sed -i "s/\/usr\/include\/$pkgname/..\/..\/include/g" Makefile
  sed -i -e "/INCPATH/a\ -I..\/..\/src" Makefile
  sed -i -e "/INCPATH/N;s/\n//" Makefile
  # popularize treefrog-$okgver/src as additional lib location.
  sed -i -e "/LIBS/a\ -L..\/..\/src" Makefile
  sed -i -e "/LIBS/N;s/\n//" Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver/src"
  make
  cd "$srcdir/$pkgname-$pkgver/tools"
  make
}

# for most packages DESTDIR is the variable to use, but the treefrog makefiles use INSTALL_ROOT
package() {
  cd "$srcdir/$pkgname-$pkgver/src"
  make INSTALL_ROOT="$pkgdir/" install
  cd "$srcdir/$pkgname-$pkgver/tools"
  make INSTALL_ROOT="$pkgdir/" install
}