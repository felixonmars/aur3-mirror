# Maintainer: schuay <jakob.gruber@gmail.com>
# Contributor: Jeremy Newton (Mystro256)
# Special thanks to the contributors of dolphin-emu-svn: for the icon, desktop file and some lines from the PKGBUILD
# Thanks to all that contributed! :)

pkgname=dolphin-emu
pkgver=3.5
pkgrel=2
epoch=1
pkgdesc='A Gamecube / Wii / Triforce Emulator'
arch=('i686' 'x86_64')
url='http://dolphin-emu.org'
license=('GPL2')

makedepends=('cmake' 'glproto' 'opencl-headers')
depends=('sdl' 'libxxf86vm' 'libao' 'wxgtk2.9' 'wiiuse' 'nvidia-cg-toolkit' \
         'glew' 'mesa' 'libgl' 'openal' 'portaudio' 'lzo2' 'ffmpeg')
optdepends=('soil' 'pulseaudio')

# Cannot be BUILT with sfml later than 1.6
# IF YOU NEED SFML>=1.7 FOR SOMETHING ELSE, TRY REMOVING THE CONFLICT
# BELOW AND ONLY TEMPORARY UNINSTALLING SFML TO BUILD/INSTALL DOLPHIN
conflicts=('dolphin-emu-git' 'sfml' 'sfml-git')

source=("http://dolphin-emu.googlecode.com/files/dolphin-${pkgver}-src.zip"
        'dolphin-emu.desktop'
        'Dolphin_Logo.png')

build() {
  cd "${srcdir}/dolphin-${pkgver}"

  mkdir -p build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-2.9
  make
}

package() {
  cd "${srcdir}/dolphin-${pkgver}/build"

  make DESTDIR=${pkgdir} install

  install -Dm644 "${srcdir}/dolphin-emu.desktop" "${pkgdir}/usr/share/applications/dolphin-emu.desktop"
  install -Dm644 "${srcdir}/Dolphin_Logo.png" "${pkgdir}/usr/share/pixmaps/dolphin-emu.png"
}

md5sums=('4d0429f1e10f0862256e0b4c4e2f44a3'
         'feed4580c2e6bfbc7f6c67dad861daae'
         'd15c51f547b4bd47e510faac40bcc9d6')
