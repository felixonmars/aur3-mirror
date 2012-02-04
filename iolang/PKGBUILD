pkgname=iolang
pkgver=2011.09.12
pkgrel=1
pkgdesc="Io is a dynamic prototype-based programming language"
arch=('i686' 'x86_64')
license=('BSD')
url="http://www.iolanguage.com/"
makedepends=('cmake>=2.8' 'git')
md5sums=()

gitroot="https://github.com/stevedekorte/io.git"
gitname="io"
gitrev="f2503ba8" #23afbccc

build() {
  cd ${srcdir}

  if [[ -d ${gitname} ]] ; then
    cd ${gitname}
    git fetch -q
    git reset -q --hard origin/master
    git checkout -f -q ${gitrev}
  else
    git clone ${gitroot}
    cd ${gitname}
    git checkout -f -q ${gitrev}
  fi

  # hardcode install prefix to /usr (akojo)
  sed -i 's|\${CMAKE_INSTALL_PREFIX}|/usr|' libs/iovm/CMakeLists.txt
  sed -i '34,35d' CMakeLists.txt
  sed -i '34i\  SET(CMAKE_CXX_FLAGS_DEBUGFAST "-g -O0 -ldl")\n  SET(CMAKE_C_FLAGS_DEBUGFAST "-g -O0 -ldl")' CMakeLists.txt
  sed -i '114,$d' CMakeLists.txt # remove cpack
  sed -i '35,37d;49,50d' addons/Socket/source/IoEvOutRequest.h # revert commits dbf92ce5 and b6213118
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr .. || return 1
  make || return 1
  make install || return 1
  install -Dm644 ../license/bsd_license.txt ${pkgdir}/usr/share/licenses/${pkgname}/bsd_license.txt
}
