
# maintainer: perlawk

pkgname=mit_gnu_scheme
_pkgname=mit-scheme
pkgver=9.1.1
pkgrel=1
pkgdesc="MIT/GNU Scheme is an implementation of the Scheme programming language, providing an interpreter, compiler, source-code debugger, integrated Emacs-like editor, and a large runtime library."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/mit-scheme/"
license=('GPL')
depends=('gcc')
conflicts=()
options=('!makeflags')
if [ $CARCH == i686 ]; then
	source=("http://ftp.gnu.org/gnu/mit-scheme/stable.pkg/9.1.1/mit-scheme-9.1.1-i386.tar.gz")
	md5sums=(e35590a06549d71edba723a719329070)  
else
	source=("http://ftp.gnu.org/gnu/mit-scheme/stable.pkg/9.1.1/mit-scheme-9.1.1-x86-64.tar.gz")
	md5sums=('268cb5ac97646f34742828ebc370586d')
fi


build() {
  cd "${srcdir}"/${_pkgname}-${pkgver}/src
  ./configure --prefix=/usr
  make -j4 
}

package() {
  cd "${srcdir}"/${_pkgname}-${pkgver}/src
  make DESTDIR="${pkgdir}" install 
}

