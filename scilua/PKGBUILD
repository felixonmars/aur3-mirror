# submitter: perlawk
# Maintainer: perlawk

pkgname=scilua
pkgver=1.0
pkgrel=1
pkgdesc="Scilua, a group of lua libraries to offer a framework for numerical computing which combines the ease of use of scripting languages (Matlab, R, ...) with the high performance typical of compiled languages (C/C++, Fortran, ...)."
url="http://scilua.org/"
arch=('any')
license=('GPLv3')
depends=( 'luajit' 'sqlite' 'r')
optdepends=()
makedepends=()
install=
source=(
'http://www.scilua.org/files/xsys-1.0.0.zip'
'http://www.scilua.org/files/sci-1.0-beta6.zip'
'http://www.scilua.org/files/rclient-1.0.0.zip'
'http://www.scilua.org/files/ljsqlite3-1.0.0.zip'
'http://www.scilua.org/files/time-1.0.0.zip'
)
 
build() {
  cd "${srcdir}/"
}
 
package() {
  luaver=5.1
  pth=$pkgdir/usr/share/lua/$luaver
  cd "${srcdir}/"
	mkdir -p "$pth/rclient"	
	cp -a xsys "$pth"	
	cp -a sci "$pth"	
	cp -a time "$pth"	
	cp -a ljsqlite3 "$pth"	
	cp rclient/*lua  "$pth/rclient"	
}
md5sums=('6db4d413fa09fa016114b7db20acdaf9'
         'bf2703aec4d49c7f86f9241ceb322169'
         'a0dfc63ced91b536a39c320e4913db69'
         '85d420ee96a1474efa15ac1fe2bbfad7'
         'e70ff70ea068877ea66b365d36d08ab2')
