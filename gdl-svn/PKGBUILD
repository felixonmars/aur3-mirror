# Contributor: Arun Tejasvi Chaganty <arunchaganty@gmail.com>
pkgname=gdl-svn
pkgver=481
pkgrel=1
pkgdesc="GNOME Devtool Libraries. SVN version"
arch=('i686' 'x86_64')
url="http://www.gnome.org/projects/devtools/"
license=('GPL')
#options=('!LIBTOOL')
provides=('gdl=0.3.0')
replaces=('gdl')
depends=('gtk-doc')
makedepends=('gnome-common' 'gettext' 'intltool' 'pkgconfig' 'subversion')
source=()
md5sums=()
_svntrunk=svn://svn.gnome.org/svn/gdl/trunk
_svnmod=gdl

build() {
  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up -r $pkgver)
    else
    svn co ${_svntrunk} --config-dir ./ -r $pkgver ${_svnmod} 
  fi  
  cd $startdir/src/${_svnmod}
  ./autogen.sh --prefix=/usr 
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install

}

