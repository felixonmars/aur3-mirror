# Contributor: Drew Liszewski <drew dot liszewski at gmail dot com>
# Contributor: Daniel Varga <varga dot daniel at gmx dot de>
# Maintainer: SSF <punx69 at gmx dot net>

pkgname=emulationstation-full-git
_gitname=EmulationStation
pkgrel=1
pkgver=v1.0.2.r436.g721b02c
pkgdesc="A graphical front-end for emulators with controller navigation.(no debug git desktop build)"
arch=('i686' 'x86_64')
url="https://github.com/Aloshi/EmulationStation"
license=('custom')
makedepends=('git' 'boost' 'freetype2' 'eigen' 'cmake' 'mesa' 'libsm' 'coreutils' 'wget' 'unzip' 'make')
optdepends=('emulationstation-scraper-git')
depends=('alsa-lib' 'sdl2' 'boost-libs' 'freeimage' 'glu' 'sdl2')
source=('git://github.com/Aloshi/EmulationStation.git')
conflicts=('emulationstation-git' 'emulationstation-themes' 'emulationstation-git-unstable' 'emulationstation-git-unstable-rpi')
provides=('emulationstation' 'emulationstation-themes')
md5sums=('SKIP')
_themezip=http://www.emulationstation.org/downloads/themes/simple_latest.zip

pkgver() {
  cd "$srcdir/$_gitname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
    mkdir -p "$srcdir/$_gitname/build"
    cd "$srcdir/$_gitname/build"
    cmake -DCMAKE_BUILD_TYPE=Release ..
    make -j$(nproc)
    #####themes
    wget --progress=dot "$_themezip" -O "$srcdir/$_gitname/build/simple_latest.zip" 2>&1 | grep --line-buffered "%"
	unzip -o simple_latest.zip
}

package() {
    cd $_gitname
    install -Dm755 "$srcdir/$_gitname/emulationstation" "$pkgdir/usr/bin/emulationstation"
    install -Dm644 "$srcdir/$_gitname/LICENSE.md" "$pkgdir/usr/share/licenses/emulationstation-full-git/LICENSE"
    mkdir -p "$pkgdir/etc/emulationstation/themes"
    mv "$srcdir/$_gitname/build/simple" "$pkgdir"/etc/emulationstation/themes
    ###create a desktop file
    mkdir -p "$pkgdir/usr/share/applications"
cat <<EOF >> "$pkgdir/usr/share/applications/emulatorstation.desktop"
[Desktop Entry]
Name=EmulationStation
GenericName=Emulator front-end
Comment=A universal emulator front-end
Exec=emulationstation
Terminal=false
Type=Application
Icon=input-gaming
Categories=Application;Game;
StartupNotify=false
EOF
}
