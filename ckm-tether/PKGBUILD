# Maintainer: Marty Plummer (The_NetZ) <ntzrmtthihu777 (at) gmail (dot) com>

pkgname=ckm-tether
pkgver=1.0.1.5
pkgrel=2
pkgdesc="clockworkmod tethering app for linux"
arch=('i686' 'x86_64')
url="http://www.clockworkmod.com"
license=("gpl")
makedepends=("python2")
depends=("gksu" "xterm" "android-tools")
source=("http://download.clockworkmod.com/tether/tether-linux.tgz"
        "python2-fix.patch" "adb.js.patch" "run.sh.patch"
        "ckm-tether.desktop" "ckm-tether.png")
md5sums=('98d68c0a6b3e199fa15c7d0a76339d5b'
         '9c68861b927ebcc3d9c5a611bb1ab3c1'
         '1d3a3b54640d4ec1abc99a653a88b0c3'
         '2ae83e660e11b60664a7ad3e70a2fa65'
         '7dbd400d62d700d5bad74928a05846cd'
         '20991f84d093eebeb761029649c4120e')

prepare() {
  cd "${srcdir}/Tether"
  patch -Np2 -i "${srcdir}/adb.js.patch"
  patch -Np2 -i "${srcdir}/python2-fix.patch"
  patch -Np2 -i "${srcdir}/run.sh.patch"
}

build() {
  cd "${srcdir}/Tether/node"
  ./configure
  make
}

package() {  
  install -D -m755 "${srcdir}/Tether/node/out/Release/node" \
    "${pkgdir}/opt/ckm-tether/node"

  cd "${srcdir}/Tether/"
  cp -ar node-tuntap "${pkgdir}/opt/ckm-tether"
  rm -rf "${pkgdir}/opt/ckm-tether/node-tuntap/darwin"

  cd "${srcdir}/Tether/linux"
  install -D -m 755 run.sh \
    "${pkgdir}/usr/bin/ckm-tether"

  cd "${srcdir}/"
  install -D -m 664 ckm-tether.desktop \
    "${pkgdir}/usr/share/applications/ckm-tether.desktop"

  install -D -m 664 ckm-tether.png \
    "${pkgdir}/usr/share/icons/ckm-tether.png"
}

# vim:set ts=8 sts=2 sw=2 et:
