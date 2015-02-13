# Maintainer: James Tappin <jtappinatgmaildotcom>
# Contributor: Gergely Imreh <imrehgATgmailDOTcom>
# Contributor: Eric Belanger <eric@archlinux.org>

pkgname=plplot-git

pkgver=20150212

pkgrel=1
pkgdesc="A cross-platform software package for creating scientific plots, GIT   version"
arch=('i686' 'x86_64')
url="http://plplot.sourceforge.net/"
license=("GPL" "custom")
provides=('plplot')
conflicts=('plplot')
replaces=('plplot-svn')
depends=('libtool' 'tk')
makedepends=('cmake' 'git')
optdepends=('qhull: calculating convex hulls'
            'agg: high quality rendering engine in C++'
            'swig: connects Plplot C library to Python, Java and Lua'
            'gd: ability to output png, jpeg and gif files'
            'qt4: display plots, output various formats  using the Qt UI framework'
            'wxgtk: displays plots using wxWidgets library'
            'freetype2: ttf fonts and some drivers'
            'ttf-freefont: ttf fonts for some drivers'
            'cairo: displays plots and save to different file formats')
options=('!libtool' '!makeflags')

_gitroot="git://git.code.sf.net/p/plplot/plplot"
_gitname="plplot"
_gitbranch="master"

# This updates the revision to the current version.
pkgver() {
    # Note that we must ensure that the tree has been checked out before 
    # we can generate the version number (and pkgver() is called before build())
    cd "$srcdir"
    msg "Connecting to GIT server...."
    if [[ -d "$_gitname" ]]; then
	cd "$_gitname" && git pull --depth=1 origin
	msg "The local files are updated."
    else
	git clone --single-branch --branch=$_gitbranch --depth=1 \
	    "$_gitroot" "$_gitname"
	cd "$_gitname"
    fi
    date --date=@`git rev-list --timestamp --max-count=1 HEAD | awk '{print$1}'` +%Y%m%d
}

build() {
  cd ${srcdir}

  # Checkout or update GIT
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
      cd "$_gitname" && git pull --depth=1 origin
      msg "The local files are updated."
  else
      git clone --single-branch --branch=$_gitbranch --depth=1 \
	  "$_gitroot" "$_gitname"
  fi
  
  msg "GIT checkout done or server timeout"
  msg "Starting build..."
  
  # Setting CMAKE environmental parameters
  export PKG_CONFIG_PATH=/usr/bin/pkg-config
  export CC="gcc -O2"
  export CXX="g++ -O2"
  export FC="gfortran -O2"

  cd ${srcdir}/${_gitname}

  # Separate build directory, remove old one if exists
  if [ -d "build_dir" ]; then
    rm -rf "build_dir"
  fi    
  mkdir build_dir
  cd build_dir
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
      -DENABLE_octave=off \
      -DENABLE_tcl=ON \
      -DENABLE_tk=ON \
      -DPL_FREETYPE_FONT_PATH=/usr/share/fonts/TTF \
      ../ 
  make
}

package() {
  cd ${srcdir}/${_gitname}/build_dir
  make DESTDIR=${pkgdir} install
  install -D -m644 ../Copyright ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
