# Contributor: yannsen <ynnsen@gmail.com>
# Contributor: fnord0 <fnord0 AT riseup DOT net>

pkgname=aircrack-ng-cuda-svn
pkgver=1550
pkgrel=7
pkgdesc="Wifi security suite with NVIDIA GPU-enhanced (using CUDA) WPA/WPA2 key cracking"
arch=('i686' 'x86_64')
url="http://www.aircrack-ng.org"
license=('GPL2')
depends=('openssl' 'wireless_tools' 'libtool' 'cuda-toolkit' 'cuda-sdk' 'sqlite3' 'iw')
makedepends=('subversion' 'autoconf')
provides=('aircrack-ng-cuda')
conflicts=('aircrack-ng-cuda')
source=()
md5sums=()

_svnmod=aircrack-ng-cuda
_svntrunk="http://trac.aircrack-ng.org/svn/branch/aircrack-ng-cuda"

build() {
  cd ${srcdir}
  msg "Connecting to SVN server...."
  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up -r ${pkgver})
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  if [ -d "${srcdir}/${_svnmod}-build" ]; then
    rm -rf "${srcdir}/${_svnmod}-build"
  fi

  svn export ${_svnmod} ${_svnmod}-build
  cd ${_svnmod}-build

  # setting the right location of nvcc
  sed -i "s/#NVCCFLAGS/NVCCFLAGS/" src/Makefile || return 1

  if  test "$CARCH" == x86_64; then
    sed -i "s/lib -lcuda -lcudart/lib64 -lcuda -lcudart -lstdc++/" src/Makefile || return 1
  else
    sed -i "s/lib -lcuda -lcudart/lib -lcuda -lcudart -lstdc++/" src/Makefile || return 1
  fi

  sed -i "s/--compiler-options -fno-strict-aliasing --host-compilation=C/--compiler-options -fno-strict-aliasing --host-compilation=C --compiler-options -fpermissive/" src/Makefile || return 1

  # BUILD
  make clean
  make prefix=/usr/local CUDA_INSTALL_PATH=/opt/cuda-toolkit DESTDIR=${pkgdir}/ CUDA=true SQLITE=true UNSTABLE=true || return 1
}

package() {
  cd ${srcdir}/${_svnmod}-build
  mkdir -p ${pkgdir}/usr/local/share/aircrack-ng-cuda || return 1
  cp -R test/* ${pkgdir}/usr/local/share/aircrack-ng-cuda/ || return 1
  make prefix=/usr/local CUDA_INSTALL_PATH=/opt/cuda-toolkit DESTDIR=${pkgdir}/ CUDA=true SQLITE=true UNSTABLE=true install  || return 1

  #user notification
  echo -e ""
  echo -e "\e[1;31m[\e[0m\e[1;34m*\e[0m\e[1;31m]\e[0m \e[1;31mThis application is still under heavy development!\e[0m"
  echo -e "\e[1;31m[\e[0m\e[1;34m*\e[0m\e[1;31m]\e[0m \e[1;31mTo allow compatability with other '\e[0m\e[1;34maircrack-ng\e[0m\e[1;31m' packages, this \e[0m\e[1;34mCUDA\e[0m\e[1;31m-based version is installed under the '\e[0m\e[1;34m/usr/local/\e[0m\e[1;31m' folders\e[0m"
  echo -e "\e[1;31m[\e[0m\e[1;34m*\e[0m\e[1;31m]\e[0m \e[1;31mTo test functionality run '\e[0m\e[1;34m/usr/local/bin/aircrack-ng -p 1 /usr/local/share/aircrack-ng-cuda/wpa.cap -w /usr/local/share/aircrack-ng-cuda/password.lst\e[0m\e[1;31m'\e[0m"
  echo -e "\e[1;34m>>>\e[0m \e[1;31mMore information at the Aircrack-ng wiki @ \e[0m\e[1;32mhttp://www.aircrack-ng.org/doku.php\e[0m"
  echo -e ""
}
