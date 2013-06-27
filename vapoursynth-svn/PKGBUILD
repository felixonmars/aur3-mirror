# Maintainer: sl1pkn07 <sl1pkn07@gmail.com>
# Contributor: jackoneill <cantabile dot desu at gmail dot com>

pkgname=vapoursynth-svn
pkgver=513
pkgrel=1
pkgdesc="A frame server for the 21st century - a portable replacement for Avisynth (SVN version)"
arch=('i686' 'x86_64')
url="http://www.vapoursynth.com/"
license=('LGPL')
depends=('ffmpeg' 'python' 'qt4' )
makedepends=('cython' 'subversion' 'waf' 'yasm' 'python-sphinx' 'clang')
optdepends=('ffmpegsource: Avisynth/Vapoursynth plugin for easy frame accurate access')
provides=('vapoursynth')
conflicts=('vapoursynth')
source=('vapoursynth::svn+http://vapoursynth.googlecode.com/svn/trunk/')
md5sums=('SKIP')
_svnmod='vapoursynth'

pkgver() {
  cd "${SRCDEST}/${_svnmod}"
  svnversion
}

prepare() {
  cd "${_svnmod}"
  mkdir doc/_static
}

build() {
  cd "${_svnmod}"

  waf configure --prefix="/usr" --docs="true" --translate --filters="true" --mode="release" --examples="true"
  waf build ${MAKEFLAGS}
  python setup.py build
  cd "${srcdir}/${_svnmod}/src/vsscript"
  clang++ -Wall -Wextra -Wno-unused-parameter -o libvsscript.so -shared -fPIC vsscript.cpp -I../../include -I../../build/temp.linux-x86_64-3.3/pyrex/ `pkg-config --cflags python3` `pkg-config --libs python3 vapoursynth`
  cd "${srcdir}/${_svnmod}/src/vspipe"
  clang++ -Wall -Wextra -Wno-unused-parameter -o vspipe -fPIC vspipe.cpp -I../../include `pkg-config --cflags QtCore` -L../vsscript/ -lvsscript `pkg-config --libs QtCore`
}

check() {
  cd "${_svnmod}"
  waf test
}

package() {
  cd "${_svnmod}"
  waf install --destdir="${pkgdir}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 test/test.py "${pkgdir}/usr/share/vapoursynth/test/test.py"
  install -Dm644 test/filter_test.py "${pkgdir}/usr/share/vapoursynth/test/filter_test.py"

  install -Dm755 src/vsscript/libvsscript.so "${pkgdir}/usr/lib/libvsscript.so"
  install -Dm755 src/vspipe/vspipe "${pkgdir}/usr/bin/vspipe"
}
