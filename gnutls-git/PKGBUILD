# $Id: PKGBUILD 191197 2013-07-19 17:34:12Z andyrtr $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor : Mark Lee <mark@markelee.com>

## Editted to conduct git bisect

pkgname=gnutls-git
pkgdesc="A library which provides a secure layer over a reliable transport layer"
arch=('i686' 'x86_64')
pkgver='20130818'
pkgrel='1'
license=('GPL3' 'LGPL2.1')
url="http://www.gnutls.org/"
install=gnutls.install
options=('!libtool' '!zipman')
depends=('gcc-libs' 'libtasn1' 'readline' 'zlib' 'nettle' 'p11-kit')
makedepends=('valgrind' 'strace' 'datefudge')
conflicts=('gnutls')
        
## grab source from the git repo
_gitroot='git://gitorious.org/gnutls/gnutls.git';
_gitname='gnutls';

source=("$_gitname::$_gitroot")
md5sums=('SKIP')

# prepare() { ## prepare for git bissecting
   
#    [ -d "${srcdir}/$_gitname" ] && (
#       msg "Updating local git branch...";
#       cd "${srcdir}/$_gitname" &&
#       git pull origin;  ## update the source files from git
#       ) || ( ## check if the git repo already exists
#            msg "Connecting to GNUTLS GIT server";
#            git clone "${_gitroot}" "${_gitname}" && ## obtain the source files from git
#            msg "GIT checkout done."
#            )

################  CODE FOR GIT BISECTING  #########################################
## mark the last good git revision
# _gitgood='gnutls_3_2_1'; ## last commit that updated to v3.2.1
#
#    msg "Entering git source directory";
#    cd "${srcdir}/$_gitname" && ## enter local git repo directory
#    [ -e .git/BISECT_LOG ] && (  ## check if git bisect log exists
#       msg "Was the last revision good or bad?";
#       select ans in good bad; do
#          git bisect $ans;
# #          git stash;  ## stash changes
#          break;
#       done;
#       ) || (
#             msg "Starting git bisect...";
#             git bisect start &&
#             msg "Marking current revision bad...";
#             git bisect bad;
#             git bisect good ${_gitgood};  ## mark the last good revision
#             )
####################################################################################
  
# }

build() { ## enter the build directory

  cd "${srcdir}/$_gitname";
  make autoreconf # Will generate ./configure script (as per http://www.gnutls.org/devel.html)
  ./configure --prefix=/usr \
	--with-zlib \
	--disable-static \
	--disable-guile \
	--disable-valgrind-tests \
	--disable-doc 
	
  make clean && make;  ## clean the make directory and build
}

check() {
  cd "${srcdir}/$_gitname";
  #make -k check
  make -j1 check
}

package() {
  cd "${srcdir}/$_gitname";
  make DESTDIR="${pkgdir}" install
}