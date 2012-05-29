# Contributor: Michael Asher <michael at wesolveeverything [dot] com>
# Maintainer: Michael Asher <michael at wesolveeverything [dot] com>
#
pkgname=gambas3-svn
pkgver=4790
pkgrel=1
pkgdesc="A free development environment based on a Basic interpreter - SVN version"
arch=('i686' 'x86_64')
url="http://gambas.sourceforge.net"
depends=('curl' 'qt' 'gtk3' 'librsvg') 
makedepends=('intltool' 'xdg-utils' 'libxtst' 'subversion') 
provides=("${pkgname%-svn}")
conflicts=("${pkgname%-svn}")
install=${pkgname}.install
license=('GPL2')
options=('ccache' '!makeflags' '!libtool')
source=('gambas3-svn.install')

optdepends=(
  'postgresql: postgresql server'
  'mysql: MYSQL server'
  'postgresql-libs: Postgresql database libraries'
  'libmysqlclient: MYSQL database client'
  'libfbclient: Firebird database client'
  'sqlite2: SQLite2 database'
  'sqlite3: SQLite3 database'
  'sdl_mixer: SDL requirements'
  'sdl_image: SDL requirements'
  'sdl_ttf: SDL requirements'
  'sdl_gfx: SDL requirements'
  'poppler: PDF manipulation'
  'glew: OpenGL/SDL  Support'
  'qtwebkit: WebKit Support'
  'libgtkwebkit: WebKit Support'
  'gtkglext:  GTK3/GL Support'
  'llvm:  JIT Support')


md5sums=('be333d42518a9ea7ea4e47e83ebd0d08')

_svntrunk=https://gambas.svn.sourceforge.net/svnroot/gambas/gambas/trunk/
_svnmod=${pkgname}
_cleanbuild=$1

build() {
  cd ${srcdir}
  if [ -d ${_svnmod}/.svn ]; then
		msg2 "Updating local source to latest revision..."
		(cd ${_svnmod} && svn -q up) 
  if [ $? == "0" ]; then
	    msg2 "SVN Update Complete"
  else
		msg "SVN Update Failed. Cleaning up."
		svn cleanup --config-dir ./ ${_svnmod} >>/dev/null 2>&1
		exit 1
	fi	
  else
		msg2 "Downloading from SVN repository"
		svn co -q ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
		if [ $? == "0" ]; then
			msg2 "SVN Download Complete"
		else
			msg "SVN Update Failed. Cleaning up."
			svn cleanup --config-dir ./ ${_svnmod} >>/dev/null 2>&1
			exit 1
		fi	
	fi

	svn export  -q --force ${_svnmod} ${_svnmod}-build
	cd ${_svnmod}-build
  
	# Put in routine to cleanup old files. I've run into issue with old libraries causing an issue.
	if [ -f .oldaurbuild ]; then
    msg2 "Previous build detected."
    if [ "${_cleanbuild}" == "clean" ]; then
      msg2 "Cleaning up old build" 
  	  make distclean >>/dev/null 2>&1
      msg2 "Running reconf (this takes some time)"
      ./reconf >>/dev/null 2>&1
	    msg2 "Running configure (This takes some time)"
	    ./configure --prefix=/usr >>/dev/null 2>&1
    else
      msg2 "Add 'clean' to the makepkg CLI to cleanup old build"
    fi
	else
	  touch .oldaurbuild
    msg2 "Running reconf (this takes some time)"
    ./reconf >>/dev/null 2>&1
	  msg2 "Running configure (This takes some time)"
	  ./configure --prefix=/usr >>/dev/null 2>&1
  fi
  
	msg2 "Compiling..."
	make >> /dev/null  2>&1
	msg2 "Running make install"
	make XDG_UTILS='' DESTDIR=${pkgdir} install >> /dev/null 2>&1
}

# vim: ts=2 sw=2 et:
