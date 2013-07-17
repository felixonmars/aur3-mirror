# Maintainer: Niels Martignène <niels.martignene@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=googlemock-svn
pkgver=437
pkgrel=1
pkgdesc="Google Mock (GMock) - A library for writing and using C++ mock classes"
arch=('i686' 'x86_64')
url="http://code.google.com/p/googlemock/"
license=('BSD')
options=('!libtool')
depends=('googletest-svn')
makedepends=('python2' 'subversion')
optdepends=('python2: gmock_gen.py support')
conflicts=('gmock' 'googlemock')
provides=('gmock' 'googlemock')
source=('gmock::svn+http://googlemock.googlecode.com/svn/trunk')
sha1sums=('SKIP')

_sitepackages=$(python2 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")

pkgver() {
  cd "${srcdir}/gmock"
  svnversion | tr -d [A-z]
}

prepare() {
  cd "${srcdir}/gmock"
  find -name "*.py" -exec sed -i 's/#!\/usr\/bin\/env python/#!\/usr\/bin\/env python2/' {} \;
}

build() {
  cd "${srcdir}/gmock"

  autoreconf -fvi
  ./configure --prefix=/usr --enable-external-gtest
  make
}

package() {
  cd "${srcdir}/gmock"

  mkdir -pm 0755 "${pkgdir}/usr/lib"
  install -m 0644 lib/.libs/libgmock{,_main}.so "${pkgdir}/usr/lib"

  mkdir -pm 0755 "${pkgdir}/usr/include/gmock/internal"
  install -m 0644 include/gmock/*.h "${pkgdir}/usr/include/gmock"
  install -m 0644 include/gmock/internal/*.h "${pkgdir}/usr/include/gmock/internal"

  mkdir -pm 0755 ${pkgdir}/usr/share/{doc,licenses}/${pkgname}
  install -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 0644 CHANGES CONTRIBUTORS README "${pkgdir}/usr/share/doc/${pkgname}"

  mkdir -pm 0755 "${pkgdir}/usr/bin/" "${pkgdir}/${_sitepackages}/cpp"
  install -m 0755 "scripts/generator/gmock_gen.py" "${pkgdir}/usr/bin"
  install -m 0644 scripts/generator/cpp/*.py "${pkgdir}/${_sitepackages}/cpp"

  mkdir -pm 0755 ${pkgdir}/usr/src/gmock/{src,include}
  install -m 0644 src/*.cc "${pkgdir}/usr/src/gmock/src"
  ln -s ../../../include/gmock "${pkgdir}/usr/src/gmock/include/gmock"
}
