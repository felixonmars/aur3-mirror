# Maintainer: Niels Martignène <niels.martignene@gmail.com>
# Contributor: Jacob Emmert-Aronson <jacob at mlaronson dot com>
# Contributor: Xiao-Long Chen <chenxiaolong at cxl dot epac dot to>
# Contributor: Paul Viren <paul dot viren at ircameras dot com>

pkgname=gmock-svn
pkgver=r481
pkgrel=1
pkgdesc="Google Mock - A library for writing and using C++ mock classes"
arch=('i686' 'x86_64')
url="http://code.google.com/p/googlemock/"
license=('BSD')
depends=('python2' 'gtest-svn')
makedepends=('subversion' 'cmake')
optdepends=('python2: gmock_gen.py support')
conflicts=('gmock')
provides=('gmock')
source=('gmock::svn+http://googlemock.googlecode.com/svn/trunk')
sha1sums=('SKIP')

_sitepackages=$(python2 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")

pkgver() {
  cd gmock

  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd gmock
  find -name "*.py" -exec sed -i 's/#!\/usr\/bin\/env python/#!\/usr\/bin\/env python2/' {} \;
}

build() {
  cd gmock

  rm -rf build
  mkdir build
  cd build

  cmake -DBUILD_SHARED_LIBS=ON -DCMAKE_SKIP_RPATH=ON ..
  make
}

package() {
  cd gmock

  mkdir -pm 0755 "${pkgdir}/usr/lib"
  install -m 0644 build/libgmock{,_main}.so "${pkgdir}/usr/lib/"

  mkdir -pm 0755 "${pkgdir}/usr/include/gmock/internal"
  install -m 0644 include/gmock/*.h "${pkgdir}/usr/include/gmock/"
  install -m 0644 include/gmock/internal/*.h "${pkgdir}/usr/include/gmock/internal/"

  mkdir -pm 0755 "${pkgdir}/usr/share/"{doc,licenses}/${pkgname}
  install -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -m 0644 CHANGES CONTRIBUTORS README "${pkgdir}/usr/share/doc/${pkgname}/"

  mkdir -pm 0755 "${pkgdir}/usr/bin/" "${pkgdir}/${_sitepackages}/cpp"
  install -m 0755 "scripts/generator/gmock_gen.py" "${pkgdir}/usr/bin/"
  install -m 0644 scripts/generator/cpp/*.py "${pkgdir}/${_sitepackages}/cpp/"

  mkdir -pm 0755 "${pkgdir}/usr/src/gmock/src"
  install -m 0644 CMakeLists.txt "${pkgdir}/usr/src/gmock/"
  install -m 0644 src/*.cc "${pkgdir}/usr/src/gmock/src/"
}
