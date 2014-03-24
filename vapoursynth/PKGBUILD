# Maintainer: sl1pkn07 <sl1pkn07@gmail.com>
# Contributor: jackoneill <cantabile dot desu at gmail dot com>

pkgname=vapoursynth
pkgver=r23
_pkgver=R23
pkgrel=2
pkgdesc="A frame server for the 21st century - a portable replacement for Avisynth"
arch=('i686' 'x86_64')
url="http://www.vapoursynth.com/"
license=('LGPL2.1' 'custom:OFL')
depends=('ffmpeg' 'tesseract' 'python')
makedepends=('cython' 'yasm' 'python-sphinx')
source=("https://github.com/vapoursynth/vapoursynth/archive/${_pkgver}.tar.gz"
        "https://waf.googlecode.com/files/"waf-1.7.15{,.sig})
sha1sums=('6bc39362e38083cd8daa53acaab4ac847b2fc430'
          'c5c2ed76b72a81ee0154265cbb55d6c7cdce434f'
          'SKIP')
_python_ver="$(python -c "import sys; print('%d.%d' % sys.version_info[:2])")"

prepare() {
  rm -fr build
  cp -R "${pkgname}-${_pkgver}" build
  cd build
#  ./bootstrap.py
  cp ../waf-1.7.15 waf
  chmod +x waf
  mkdir -p doc/_static
  rm -fr _test
}

build() {
  cd build
  ./waf --prefix="/usr" --docs="true" --filters="true" --mode="release" --examples="true" --pipe="true" --script="true" --core="true" configure build
  python setup.py build
}

check() {
  cd build
  LD_LIBRARY_PATH="${srcdir}/build/build" PYTHONPATH="${srcdir}/build/build/lib.linux-${CARCH}-${_python_ver}" ./waf test
}

package() {
  cd build
  ./waf install --destdir="${pkgdir}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 ofl.txt "${pkgdir}/usr/share/licenses/${pkgname}/ofl.txt"
}
