# Maintainer: James Tappin <jtappinatgmaildotcom>
# Contributor: Gergely Imreh <imrehgATgmailDOTcom>
# Contributor: Eric Belanger <eric@archlinux.org>

pkgname=plplot-svn

pkgver=12912

pkgrel=1
pkgdesc="A cross-platform software package for creating scientific plots, SVN version"
arch=('i686' 'x86_64')
url="http://plplot.sourceforge.net/"
license=("GPL" "custom")
provides=('plplot')
conflicts=('plplot')
depends=('libtool' 'tk')
makedepends=('cmake' 'svn')
optdepends=('qhull: calculating convex hulls'
            'agg: high quality rendering engine in C++'
            'swig: connects Plplot C library to Python, Java and Lua'
            'gd: ability to output png, jpeg and gif files'
            'qt: display plots, output various formats  using the Qt UI framework'
            'wxgtk: displays plots using wxWidgets library'
            'freetype2: ttf fonts and some drivers'
            'ttf-freefont: ttf fonts for some drivers'
            'cairo: displays plots and save to different file formats')
options=('!libtool' '!makeflags')

_svntrunk=http://svn.code.sf.net/p/plplot/code/trunk
_svnmod=plplot

# This updates the revision to the current version.
pkgver() {
    local ver=`svn info $_svntrunk | grep -i revision | awk '{print $2}'`
    printf "%s" "${ver//[[:alpha:]]}"
}

build() {
  cd ${srcdir}

  # Checkout or update SVN
  if [ -d $_svnmod/.svn ]; then
    (cd ${_svnmod} && svn up -r ${pkgver})
  else
    svn co ${_svntrunk} ${_svnmod} --config-dir ./ # -r ${pkgver}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."


  # Setting CMAKE environmental parameters
  export PKG_CONFIG_PATH=/usr/bin/pkg-config
  export CC="gcc -O2"
  export CXX="g++ -O2"
  export FC="gfortran -O2"

  cd ${srcdir}/${_svnmod}

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
  cd ${srcdir}/${_svnmod}/build_dir
  make DESTDIR=${pkgdir} install
  install -D -m644 ../Copyright ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
