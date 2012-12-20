# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
# Contributor: Tucos <baspape@gmail.com>

pkgname=panda3d-bullet
pkgver=1.8.0
pkgrel=11
pkgdesc="A 3D game engine with Python bindings. SDK package with bullet physics engine included."
url="http://www.panda3d.org"
arch=('i686' 'x86_64')
license=('BSD')
depends=('desktop-file-utils' 'shared-mime-info' 'xorg-server' 'libgl' 'python2' 'openssl' 'ffmpeg-legacy' 'libjpeg' 'libpng' 'libtiff' 'freetype2' 'gtk2' 'nvidia-cg-toolkit' 'openal' 'libxrandr' 'libxcursor' 'libxxf86dga')
makedepends=('python2' 'bison' 'subversion' 'cmake')

# NOTICE: please read http://www.panda3d.org/manual/index.php/Dependencies for
# more information. Optdepends you want your package to support, need to be
# installed during compiletime! You don't need to change anything in the
# pkgbuild to get support; makepanda automatically detects available
# dependencies.
optdepends=('fmodex: FMod audio'
            'libsquish: DXT support (AUR)'
            'artoolkit: library for augmented reality (AUR)'
      			'librocket: GUI Library (AUR, but needs to be built with Python support)'
            'opencv: alternative to ffmpeg for video texture support (support currently broken)'
            'ode: open source, high performance library for simulating rigid body dynamics (support currently broken)'
            'fftw: Lossy animation compression in bam files (Does not work)'
            'fcollada: used for dae2egg and for loading dae files directly into Panda (unavailable)'
            'vrpn: support for virtual reality trackers (unavailable)'
            )

install='panda3d-bullet.install'
source=("$url/download/panda3d-$pkgver/panda3d-$pkgver.tar.gz"
        'panda3d-bullet.install'
        'fix_reassign_reference.patch')
md5sums=('e7befb116658119229dd4a6404fae5b6'
         '781da785acb14d547624b505ef01e064'
         '6ca0a53f1a304edfb0c0bcf695410e61')

build() {
  cd "$srcdir/panda3d-$pkgver"
  patch -Np1 -i "${srcdir}/fix_reassign_reference.patch"

  # bullet
  tpdir="../thirdparty/linux-libs-a/bullet"
  if [ "$CARCH" == "x86_64" ]; then
    tpdir="../thirdparty/linux-libs-x64/bullet"
  fi
  mkdir -p $tpdir/include

  svn checkout -r 2531 http://bullet.googlecode.com/svn/trunk/ bullet
  mkdir bullet-build
  cd bullet-build
  cmake ../bullet -G "Unix Makefiles"   \
    -DINSTALL_LIBS=ON -DBUILD_DEMOS=OFF \
    -DCMAKE_CXX_FLAGS="-fPIC" \
    -DCMAKE_INSTALL_PREFIX=${tpdir} \
    -DINCLUDE_INSTALL_DIR=${tpdir}/include/

  make -j2
  make install

  # end bullet
  cd ..

  # disable broken extensions
  python2 makepanda/makepanda.py --everything --no-opencv --no-ode --no-maya2012 --no-fmodex --use-bullet --threads 2
}

package() {
  cd "$srcdir/panda3d-$pkgver"
  python2 makepanda/installpanda.py --prefix=/usr --destdir="$pkgdir"
  rm "$pkgdir/usr/bin/bin2c" # file conflict
  install -D -m644 "$srcdir/panda3d-$pkgver/doc/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  if [ "$CARCH" == "x86_64" ]; then
    mv "$pkgdir/usr/lib64/panda3d" "$pkgdir/usr/lib/"
    rmdir "$pkgdir/usr/lib64"
    sed -i 's/lib64/lib/' "$pkgdir/usr/lib/python2.7/site-packages/panda3d.pth"
    sed -i 's/lib64/lib/' "$pkgdir/etc/ld.so.conf.d/panda3d.conf"
  fi
}
