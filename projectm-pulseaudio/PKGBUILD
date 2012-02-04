# Contributor: Christopher Daley <crdaley (at) gmail>
# Contributor: Denis A. Altoé Falqueto <denisfalqueto (at) gmail>

pkgname=projectm-pulseaudio
pkgver=2.0.1
pkgrel=3
pkgdesc="A Qt based GUI for projectM that visualizes your PulseAudio output."
url="http://xmms-projectm.sourceforge.net"
arch=('i686' 'x86_64')
license=('GPL')
groups=('projectm-pulse')
depends=('projectm' 'projectm-qt' 'pulseaudio' 'glew' 'ftgl')
makedepends=('pkgconfig' 'xproto' 'cmake')
source=(http://downloads.sourceforge.net/sourceforge/projectm/projectM-pulseaudio-$pkgver-Source.tar.gz
    FindGLEW.cmake 
    CMakeLists-glew-ftgl.patch
    sysstat.patch
    remove_pulse_browser_h.patch)
md5sums=('3b6cad16f93617cdb073fc61dd48ccec'
         'f044c47dee31d5e4aeb5d8c9cf575882'
         '0bd7e893f7434538a7a94e55c5373f06'
         '67573c50d41196dcb371968eaabbe9c2'
         '20a257b99067faef95f559b8b2447acc')

build() {
  cd $srcdir/projectM-pulseaudio-$pkgver-Source

  patch CMakeLists.txt < ../CMakeLists-glew-ftgl.patch || return 1
  patch -p1 -i ../sysstat.patch
  patch -Np0 < ../remove_pulse_browser_h.patch
  cp ../FindGLEW.cmake . || return 1

  LDFLAGS='-Wl,--hash-style=gnu'
  cmake -DCMAKE_EXE_LINKER_FLAGS:STRING="${LINKER_FLAGS}" -DCMAKE_MODULE_LINKER_FLAGS="${LINKER_FLAGS}" \
      -DCMAKE_SHARED_LINKER_FLAGS="${LINKER_FLAGS}" -DCMAKE_INSTALL_PREFIX:PATH=/usr . || return 1
  make || return 1
}

package() {
  cd $srcdir/projectM-pulseaudio-$pkgver-Source
  make DESTDIR=$pkgdir install || return
}

