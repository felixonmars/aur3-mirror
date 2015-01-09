# $Id$
# Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Storyteller <spiralsorrow@hotmail.com>

pkgname=lmms-vst
_pkgname=lmms
pkgver=1.1.0
pkgrel=1
pkgdesc='The Linux MultiMedia Studio (with vst-support for x86_64)'
arch=('i686' 'x86_64')
url='http://lmms.sourceforge.net/'
license=('GPL')
#'libtool-multilib'
depends=('sdl' 'glib2' 'fluidsynth' 'libpng' 'libvorbis' 'libxft' 'libxinerama' 'qt4' 'sdl_sound'
         'libsamplerate' 'shared-mime-info' 'fltk')
optdepends=('wine: VST support (experimental)'
            'fftw: SpectrumAnalyzer plugin'
            'stk: STK instruments plugins'
            'pulseaudio: PulseAudio output')
makedepends=('cmake' 'ladspa' 'libxft' 'freetype2' 'fftw' 'stk' 'wine')
[[ $CARCH = x86_64 ]] && makedepends+=('gcc-multilib')
provides=('lmms-extras')
conflicts=('lmms-extras' 'lmms')
options=('!makeflags')
install=lmms.install
source=("https://github.com/LMMS/${_pkgname}/archive/v${pkgver}.tar.gz")

sha256sums=('c574dad5b41bed51e50dfa27b0370ae51fa1d7e37c01d1f892a0067e9542934d')
prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  sed -i 's|lib64|lib|g' cmake/modules/DetectMachine.cmake

  cmake . -DCMAKE_INSTALL_PREFIX=/usr -USE=vst
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}
