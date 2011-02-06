# Contributor: catalyst <catalyst@xaker.ru>

pkgname=abiword-svn
pkgver=29400
pkgrel=1
pkgdesc="A fully-featured word processor (SVN Version)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.abisource.com"
depends=('fribidi>=0.10.9' 'enchant>=1.3.0' 'libgnomeprintui' 
         'wv>=1.2.4' 'libgnomeui>=2.22.01' 'libgsf-gnome>=1.14.14' 'redland>=1.0.10' 'rasqal>=0.9.17')
makedepends=('pkgconfig' 'cmake' 'subversion' )
optdepends=('goffice-devel')
options=('!makeflags' 'force')
provides=('abiword')
conflicts=('abiword')
source=()
md5sums=()
_svntrunk=http://svn.abisource.com/abiword/trunk/
_svnmod=abiword

build() {
svn co $_svntrunk $_svnmod
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
     cd ${srcdir}/$_svnmod
  ./autogen.sh --prefix=/usr \
              --with-libxml2 \
	      --disable-gucharmap \
              --enable-dynamic || return 1
make || return 1
make DESTDIR="$pkgdir" install || return 1
rm -rf ${srcdir}/$_svnmod
}
