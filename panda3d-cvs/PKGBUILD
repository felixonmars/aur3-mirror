# Maintainer: David Radford <croxis gmail com>
# Contributor: Robin Baumgartner <robin@baumgartners.ch>
# Contributor: Hubert Grzeskowiak <arch at nemesis13 de>

pkgname=panda3d-cvs
pkgver=cvs
pkgrel=2
pkgdesc="A 3D game engine with Python bindings. SDK package. CVS Version. Optional dependencies you want to support need to be installed before panda3d."
url="http://www.panda3d.org"
arch=('i686' 'x86_64')
license=('BSD')
provides=('panda3d')
conflicts=('panda3d')

depends=('desktop-file-utils' 'shared-mime-info' 'libgl' 'python2'
         'openssl' 'freetype2' 'gtk2'
         'libxrandr' 'libxcursor' 'libxxf86dga')
makedepends=('python2' 'bison' 'subversion' 'cmake' 'cvs')

# NOTICE: please read http://www.panda3d.org/manual/index.php/Dependencies for
# more information. Optdepends you want your package to support need to be
# installed during compiletime! You don't need to change anything in the
# pkgbuild to get support; makepanda automatically detects available
# dependencies.
optdepends=(# Pretty much required
            'xorg-server: X11 support'
            'libgl: OpenGL support for X11'
            # Recommended
            'python2: python2 bindings'
            'python: Experimental python 3 bindings'
            'openssl: Provides some networking and encryption support'
            'ffmpeg: Required to load and play video textures'
            'libjpeg: Required to read and write jpeg images'
            'libpng: Required to read and write png images'
            'freetype2: Required to use dynamic fonts (such as TTF fonts)'
            'gtk2: PStats analysis and debugging tool'
            'libtiff: Required to read and write tiff images'
            'nvidia-cg-toolkit: shader support'
            'ode-compat: Support for the ODE physics engine'
            'openal: OpenAL audio'
            'zlib: Compression support'
            'libxxf86dga: Relative mouse mode'
            # Optional
            'bullet: Support for the physics engine'
            'eigen: Optimised linear algebra library'
            'fmodex: FMod audio'
            'libxcursor: Custom cursor icons'
            'libxrandr: Resolution switching'
            'librocket: Librocket GUI support'
            'libsquish: DXT support (AUR)'
            'artoolkit: library for augmented reality (AUR)'
            'opencv: alternative to ffmpeg for video texture support'
            'fftw: Lossy animation compression in bam files (Does not work)'
            'fcollada: used for dae2egg and for loading dae files directly into Panda (unavailable)'
            'vrpn: support for virtual reality trackers (unavailable)'
            # ARM stuff, not really applicable, stated for completeness
            # NOTE: if you have libgles, you _must_ install libegl for this package to compile
            'libgles: OpenGL ES support'
            'libegl: GLX for OpenGL ES'
            )

install='panda3d.install'
source=('panda3d.install')
md5sums=('781da785acb14d547624b505ef01e064')

_cvsroot=":pserver:anonymous@panda3d.cvs.sourceforge.net:/cvsroot/panda3d"
_cvsmod="panda3d"
# set to true to use a clean, seperate builddir
_builddir=false
JOBS=$(nproc)

build() {
  cd "$srcdir"
   if [ -d $_cvsmod/CVS ]; then
    msg "Found a dir, updating"
    (cd $_cvsmod && cvs -q up -AdP)
  else
    msg "Checking out."
    cvs -z3 -d $_cvsroot co -f $_cvsmod
  fi
  msg "CVS checkout done (or server timeout), copying for build"

  if $_builddir; then
    [ -d "${_cvsmod}-build" ] && rm -rf "$_"
    cp -r "${_cvsmod}" "${_cvsmod}-build"
    cd "${_cvsmod}-build"
  else
    cd "${_cvsmod}"
  fi
  
  msg "Starting makepanda"
  ls .
  # disable broken extensions
  python2 makepanda/makepanda.py --everything --no-opencv --no-maya2012 --no-fmodex --no-gles --no-gles2 --threads $JOBS
}

package() {
  if $_builddir; then
    cd "$srcdir/${_cvsmod}-build"
  else
    cd "$srcdir/${_cvsmod}"
  fi
  python2 makepanda/installpanda.py --prefix=/usr --destdir="$pkgdir"
  [ -e "$pkgdir/usr/bin/bin2c" ] && rm "$pkgdir/usr/bin/bin2c" # supposedly conflicts with collada
  install -D -m644 "$srcdir/$_cvsmod/doc/LICENSE" "$pkgdir/usr/share/licenses/${_cvsmod}-cvs/LICENSE"
}

post_install() {
	ldconfig
}
