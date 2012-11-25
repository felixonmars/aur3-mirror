# Maintainer: <fero dot kiraly at gmail.com>

pkgname=pd-extended-svn
pkgver=0.43.4
pkgrel=1
pkgdesc="Pure Data Extended SVN version"
url="http://puredata.info/"
arch=('i686' 'x86_64' )
license=('BSD')
depends=('libv4l' 'fftw' 'jack' 'tk' 'freeglut' \
  'libquicktime' 'libdv' 'gsl' 'imagemagick' \
  'ftgl' 'libgl' 'dssi' 'git')
makedepends=('subversion' 'swig' 'automake' 'curl' )
conflicts=('pd' 'pdp' 'zexy')
provides=('pd' 'pd-extended' 'pd-gem' 'pdp' 'zexy')
replaces=(pd-extended)
backup=()
options=('!makeflags')
install=
source=()
md5sums=()



# MAIN SVN TRUNK
_svntrunk=https://pure-data.svn.sourceforge.net/svnroot/pure-data/trunk/
_svnmod=pd-extended-svn


# GEM SOURCES
_gitroot="git://pd-gem.git.sourceforge.net/gitroot/pd-gem/Gem"
_gitname="Gem"



build() {
  unset CFLAGS
  unset LDFLAGS
  unset INCLUDES
 
  #
  #downloading pd-extended----------------------------------------------------------
  #
  msg "Begin SVN checkout for pd-extended"
  cd $srcdir
  svn co $_svntrunk  $pkgname
  msg "SVN checkout done or server timeout"

  #  
  #downloading GEM to the pd-extended-svn/externals/Gem -------------------------------------- 
  #  
  cd $pkgname/externals
  msg "Connecting to GIT server for GEM...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi
  msg "GIT checkout done or server timeout"


  cd ..
  cd ..
  
  
  #
  #downloading pd-extended core -----------------------------------------------------
  #  
  
  msg "Core of Pd-extended from git"
   if [ -d pd-extended.git ] ; then
    cd pd-extended.git && git pull origin
    msg "The local files are updated."
  else
    git clone git://pure-data.git.sourceforge.net/gitroot/pure-data/pd-extended.git pd-extended.git
  fi
  msg "GIT checkout done or server timeout"
  
  cd $pkgname
  mv pd pd-original
  ln -s ../pd-extended.git pd

  
  #FIXES -----------------------------------------------------------------------------
  # fix #1
  msg "Fixing nonexisting file ninjacount-help.pd in externals/ekext ..."
  if [ -f externals/ekext/ninjacount-help.pd ] ; then
     msg "File exists already. hurra"
  else
     touch externals/ekext/ninjacount-help.pd #now it exist !
  fi

  # fix #2
  msg "Fixing makefile of pdlua with wrong lib num ..."
  sed -i 's/llua5.1/llua/g' externals/loaders/pdlua/src/Makefile
 

  if [ "$CARCH" = "x86_64" ]; then
  # fix -fPIC issue in PDP
    sed -e "s|CFLAGS =|CFLAGS = -fPIC|" \
      -i externals/pdp/opengl/Makefile.config || return 1
  # fix -fPIC issue in pddp
    sed -e "s|DEFINES =|DEFINES = -fPIC|" \
      -i externals/miXed/Makefile.common || return 1
  # setting additional variable
    FPIC_FLAG="-fPIC"
    else FPIC_FLAG=""
  fi


  #MAKE --------------------------------------------------------------------------
  cd ..
  cd "$srcdir/$pkgname/packages/linux_make" || return 1

  make BUILDLAYOUT_DIR=$srcdir/$pkgname/packages \
    GEM_EXTRA_CXXFLAGS="$FPIC_FLAG" \
    DESTDIR=$pkgdir \
    prefix=/usr \
    install || return 1
  


  
}


package() {
  cd "$srcdir/$pkgname"


  # PD License
  install -Dm644 pd/LICENSE.txt \
    $pkgdir/usr/share/licenses/pd-extended-svn/LICENSE.txt
  cd packages/
  install -p linux_make/default.pdextended $pkgdir/usr/lib/pd-extended/
# Gnome menu support
  install -d $pkgdir/usr/share/icons/hicolor/128x128/apps
  install -p -m0644 linux_make/pd-extended.png \
    $pkgdir/usr/share/icons/hicolor/128x128/apps/
  install -d $pkgdir/usr/share/icons/hicolor/48x48/apps
  install -p -m0644 linux_make/pd-extended-48x48.png \
    $pkgdir/usr/share/icons/hicolor/48x48/apps/pd-extended.png
  install -d $pkgdir/usr/share/applications/ 
  install -p linux_make/pd-extended.desktop \
    $pkgdir/usr/share/applications/
# files for /etc
  cd "$srcdir/$pkgname"
  install -d $pkgdir/etc/bash_completion.d/
  install -p scripts/bash_completion/pd $pkgdir/etc/bash_completion.d
# emacs mode for .pd files
  install -d $pkgdir/usr/share/emacs/site-lisp/
  install -p scripts/pd-mode.el $pkgdir/usr/share/emacs/site-lisp/
# Pd-related scripts
  install -p scripts/pd-diff $pkgdir/usr/bin/
  install -p scripts/config-switcher.sh $pkgdir/usr/bin/


}

# vim:set ts=2 sw=2 et:
