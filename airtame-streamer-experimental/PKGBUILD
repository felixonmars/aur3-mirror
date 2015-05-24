# Maintainer: Lars Hagström <lars@foldspace.nu>
pkgname=airtame-streamer-experimental
pkgver=1.0.0_b2_6
pkgrel=1
pkgdesc="Stream your display to an airtame dongle."
arch=('x86_64')
url="http://www.airtame.com"
license=('Proprietary')
groups=()
provides=("airtame-streamer")
conflicts=("airtame-streamer")
depends=("ffmpeg-compat" "python" "python-pyqt5")
makedepends=("unzip" "yasm")
install=
source=("http://downloads.airtame.com/update/beta/lin_x64/AIRTAME-v${pkgver//_/-}_x64.tar.gz"
        "jsonrpcc::git+https://github.com/airtame/jsonrpc-c.git"
        "enet::git+https://github.com/airtame/enet.git#branch=development"
        "zlog::git+https://github.com/airtame/zlog.git"
        "x264::git+git://git.videolan.org/x264.git"
        "streamer.sh")
md5sums=('3cb4a74a0cf2127761d98d89a6930e37'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         '785d2c8f992b595a1bff48d6ec82c058')

#not updated yet
#        "airtame-tray")
#        "airtame-streamer.service"

backup=()

build() {
  cd "$srcdir/jsonrpcc"
  autoreconf -i
  ./configure
  make

  cd "$srcdir/enet"
  autoreconf -vfi
  ./configure
  make

  cd "${srcdir}/zlog"
  make CFLAGS=-Wno-error=cpp

  cd "${srcdir}/x264"
  ./configure --enable-shared
  make

}

package() {
  cd "$srcdir"
  #unpack
  unzip AIRTAME || true

  #create directories
  install -d ${pkgdir}/opt/airtame
  install -d ${pkgdir}/opt/airtame/bin
  install -d ${pkgdir}/opt/airtame/lib
  install -d ${pkgdir}/usr/bin
  #install -d ${pkgdir}/usr/lib
  #install -d ${pkgdir}/usr/lib/systemd/user

  #copy our own scripts
  cp streamer.sh ${pkgdir}/usr/bin/airtame-streamer
  #cp airtame-tray ${pkgdir}/usr/bin/airtame-tray
  cp views/assets/tray/icon-blue@2x.png ${pkgdir}/opt/airtame/logo.png

  #install our systemd user service
  #cp airtame-streamer.service ${pkgdir}/usr/lib/systemd/user/

  #copy the two executables we need to bin directory
  cp streamer/bin/airtame-streamer ${pkgdir}/opt/airtame/bin

  #copy the modules
  cp -r streamer/lib/airtame-modules ${pkgdir}/opt/airtame/modules

  #copy the airtame shared libraries only (the other libraries we use from our dependencies)
  cp streamer/lib/libairtame-* ${pkgdir}/opt/airtame/lib

  #copy the libraries that airtame have forked or used newer versions of,
  #and that we've built in the build() function
  cp jsonrpcc/src/.libs/libjsonrpcc.so.0.0.0 ${pkgdir}/opt/airtame/lib/libjsonrpcc.so.0
  cp enet/.libs/libenet.so.7.0.0 ${pkgdir}/opt/airtame/lib/libenet.so.7
  cp zlog/src/libzlog.so.1.2 ${pkgdir}/opt/airtame/lib
  cp x264/libx264.so.146 ${pkgdir}/opt/airtame/lib
}
