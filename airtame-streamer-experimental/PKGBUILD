# Maintainer: Lars Hagström <lars@foldspace.nu>
pkgname=airtame-streamer-experimental
pkgver=0.1.5
pkgrel=1
pkgdesc="Stream your display to an airtame dongle."
arch=('x86_64')
url="http://www.airtame.com"
license=('Proprietary')
groups=()
provides=("airtame-streamer")
conflicts=("airtame-streamer")
depends=("zlog-airtame-git" "ffmpeg-compat" "python" "python-pyqt5")
makedepends=()
install=
source=("http://builds.airtame.com/downloads/staging/lin-x64/airtame-installer-v0.1.5-x64.sh"
        "streamer.sh"
        "tray-cli.sh"
        "airtame-streamer.service"
        "airtame-tray"
        "logo.png")
sha1sums=('4b172d0663ce77655d25d5eb6b11e788e18aa97e'
          '1bd73a4d0b4acd9d14c24bf188ae57d57d182051'
          '7964ed3a8954488ccfc5b4feac363f72eb3468a0'
          '439181d522ef761638009f1bd20ce788e9d598b5'
          '5bd26b8f93eaee52c030e3bf3d8a1bca0e027b67'
          '6a396ae0060c1156f4bf887ec45346cc04bbab73')
backup=()

package() {
  cd "$srcdir"

  #unpack
  sh airtame-installer*.sh --noexec

  #create directories
  install -d ${pkgdir}/opt/airtame
  install -d ${pkgdir}/opt/airtame/bin
  install -d ${pkgdir}/opt/airtame/lib
  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/lib
  install -d ${pkgdir}/usr/lib/systemd/user

  #copy our own scripts
  cp streamer.sh ${pkgdir}/usr/bin/airtame-streamer
  cp tray-cli.sh ${pkgdir}/usr/bin/airtame-tray-cli
  cp airtame-tray ${pkgdir}/usr/bin/airtame-tray

  cp logo.png ${pkgdir}/opt/airtame/

  #install our systemd user service
  cp airtame-streamer.service ${pkgdir}/usr/lib/systemd/user/

  #copy the two executables we need to bin directory
  cp airtame-streamer/bin/airtame-server ${pkgdir}/opt/airtame/bin
  cp airtame-streamer/bin/airtame-tray-cli ${pkgdir}/opt/airtame/bin

  #copy the modules
  cp -r airtame-streamer/lib/airtame-modules ${pkgdir}/opt/airtame/modules

  #copy the airtame shared libraries only (the other libraries we use from our dependencies)
  cp airtame-streamer/lib/libairtame-* ${pkgdir}/usr/lib

  #copy the shared libraries that we can't reproduce on arch at the moment
  cp airtame-streamer/lib/libx264.so.144 ${pkgdir}/opt/airtame/lib
}
