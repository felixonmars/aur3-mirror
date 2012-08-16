# Contributor: [vEX] <niechift.dot.vex.at.gmail.dot.com>

# Split-package support hack for AUR.
pkgname='bsnes'

true && pkgbase='bsnes'
true && pkgname=('bsnes' 'bsnes-purify')
pkgver=091
pkgrel=1
pkgdesc='Super Nintendo Entertainment System (SNES) emulator focused on accuracy.'
arch=('i686' 'x86_64')
url='http://byuu.org/bsnes/'
license=('GPL3')
depends=('libao' 'libgl' 'libxv' 'openal' 'sdl' 'qt>=4.8.0')
makedepends=('pkgconfig' 'mesa')
install='bsnes.install'
changelog='bsnes.changelog'
source=('http://bsnes.googlecode.com/files/bsnes_v091-source.tar.xz' 'add-usr-share-fallback.patch')
md5sums=('ba53212c56990e83d7770393c4e2d173' 'f6c4d4baea352875de63de58ef1ef1d3')

__base_path="${srcdir}/${pkgbase}_v${pkgver}-source"
# Build the accuracy profile (you can also choose 'performance' or 'compatibility').
__profile='accuracy'

build() {
  cd "${__base_path}/${pkgname}"

  # Makefile hacks:
  # Disable pulseaudio.
  sed -e 's|audio.pulseaudio ||' \
      -e 's|audio.pulseaudiosimple ||' \
      -i 'target-ethos/Makefile'
  # Don't copy the cheat file.
  sed -e '/mkdir -p ~\/.config\/$(name)/{N;d}' \
      -e '/cp data\/cheats.xml/{N;d}' \
      -i 'target-ethos/Makefile'
  # Don't use sudo
  sed -e 's/sudo install/install/' \
      -i 'target-ethos/Makefile'

  # Fix building with QT >= 4.8.0.
  moc -i -Iphoenix/qt/ -o phoenix/qt/platform.moc phoenix/qt/platform.moc.hpp

  # Patch the code to fallback to looking for shaders in /usr/share/bsnes/shaders.
  patch -p0 -i "${srcdir}/add-usr-share-fallback.patch"

  # Compile bsnes.
  make flags="$CXXFLAGS -I. -DPROFILE_${__profile^^}" compiler=gcc platform=x \
       profile=${__profile} phoenix=qt target=ethos

  # Compile purify.
  cd "${__base_path}/purify"
  moc -i -Iphoenix/qt/ -o phoenix/qt/platform.moc phoenix/qt/platform.moc.hpp
  sed -e 's|link := -s|link := -s -lX11|' -i 'Makefile'
  make compiler=gcc platform=x phoenix=qt
}

package_bsnes-purify() {
  pkgver=01
  pkgdesc='ROM cleanup utility for bsnes.'
  install=''

  cd "${__base_path}/purify"
  install --directory "${pkgdir}/usr/bin"
  install --mode=755 "${__base_path}/purify/purify" "${pkgdir}/usr/bin/${pkgbase}-purify"
}

package_bsnes() {
  pkgver=091
  pkgrel=1
  pkgdesc='Super Nintendo Entertainment System (SNES) emulator focused on accuracy.'
  url='http://byuu.org/bsnes/'

  cd "${__base_path}/${pkgname}"
  make install profile=${__profile} DESTDIR="${pkgdir}" prefix=/usr

  # Install the shaders
  install --directory "${pkgdir}/usr/share/${pkgname}/shaders/"
  cp "${__base_path}/shaders"/*.shader "${pkgdir}/usr/share/${pkgname}/shaders/"

  # Install the user-profile into /usr/share/bsnes/profile.
  install --directory "${pkgdir}/usr/share/${pkgname}/profile"
  cp -R "${__base_path}/${pkgname}"/profile/* "${pkgdir}/usr/share/${pkgname}/profile"
}
