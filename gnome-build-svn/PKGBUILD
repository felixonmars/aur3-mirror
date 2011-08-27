# Contributor: Arun Chaganty <arunchaganty@gmail.com>
pkgname=gnome-build-svn
pkgver=587
pkgrel=1
pkgdesc="The GNOME Build framework. SVN version"
arch=('i686' 'x86_64')
url="http://www.gnome.org/projects/devtools/"
license=('GPL')
#options=('!LIBTOOL')
provides=('gnome-build=0.3.0')
replaces=('gnome-build')
depends=('perl' 'perl-locale-gettext' 'gdl')
makedepends=('gettext' 'intltool' 'pkgconfig' 'subversion')
source=()
md5sums=()
_svntrunk=svn://svn.gnome.org/svn/gnome-build/trunk
_svnmod=gnome-build

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

