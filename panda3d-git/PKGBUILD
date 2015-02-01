# Maintainer: Faule Socke <github@socker.lepus.uberspace.de>
# Contributor: David Radford <croxis gmail com>

pkgname=panda3d-git
pkgver=r19896.7b7a4ff
pkgrel=1
pkgdesc="A 3D game engine with Python bindings. SDK with Bullet physics engine included. Git version."
arch=('i686' 'x86_64')
url="https://www.panda3d.org/"
license=('BSD')
depends=('desktop-file-utils' 'shared-mime-info' 'xorg-server' 'libgl' 'python2'
         'openssl' 'libjpeg' 'libpng' 'libtiff' 'freetype2' 'gtk2'
         'nvidia-cg-toolkit' 'openal' 'libxrandr' 'libxcursor' 'libxxf86dga')
makedepends=('git' 'bison' 'subversion' 'cmake')
conflicts=('panda3d')
provides=('panda3d')
install='panda3d.install'


optdepends=(# Pretty much required
            'xorg-server: X11 support'
            'libgl: OpenGL support for X11'
            # Recommended
            'python: Experimental Python3 bindings'
            'openssl: Provides some networking and encryption support'
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
            'ffmpeg: Required to load and play video textures and play mp3s (broken)'
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

# The git repo is detected by the 'git:' or 'git+' beginning. The branch
# '$pkgname' is then checked out upon cloning, expediating versioning:
source=("$pkgname"::'git+https://github.com/panda3d/panda3d'
        "panda3d.install")
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP'
         '4fcb3501d3d340eafe0131979b600f4f')
sha256sums=('SKIP'
            'eb5ad9d0cb24d7cc21a7d8cd71ab6f2523f78bc407699d646781573b58631bfe')
pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

JOBS=$(nproc)

build() {
    cd "$srcdir/$pkgname"

    # disable broken/unwanted extensions
    # you can use PANDAFLAGS and BUILD_THREADS to control building
    # building is very memory intensive so you might want to use less threads
    python2 makepanda/makepanda.py --everything --no-opencv --no-ode --no-ffmpeg --no-maya2012 --no-fmodex --no-gles --no-gles2 ${PANDAFLAGS} --threads ${BUILD_THREADS:-$JOBS}
}

package() {
    cd "$srcdir/$pkgname"
    python2 makepanda/installpanda.py --prefix=/usr --destdir="$pkgdir"
    #rm "$pkgdir/usr/bin/bin2c"
    install -D -m644 "$srcdir/$pkgname/doc/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

