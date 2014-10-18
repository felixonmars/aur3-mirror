# Maintainer: Никола "hauzer" Вукосављевић <hauzer@gmx.com>
# Contributor: Harms <thotro at lyse dot net>
# Contributor: Pascal Grossé <pascal.grosse@gmail.com>

pkgname=tome4-git
pkgver=tome.1.2.3.r253.gc2ab8c2
pkgrel=1
pkgdesc="An open-source, single-player, role-playing roguelike game set in the world of Eyal. (git)"
arch=('i686' 'x86_64')
url="http://tome.te4.org/"
license=('custom' 'GPL3')
depends=('libgl' 'glu' 'openal' 'libvorbis'
        'sdl2>=2.0.3' 'sdl2_ttf>=2.0.12' 'sdl2_image>=2.0.0'
        'ttf-bitstream-vera' 'ttf-droid' 'libpng>=1.6' )
# another common font is ttf-fixedsys-excelsior-linux, but it is in AUR, so let it be
makedepends=('git' 'premake4' 'zip' 'unzip')
options=(!makeflags emptydirs)
source=('git+http://git.net-core.org/darkgod/t-engine4.git'
        'sdl_includes.patch'
        'tome4-git.desktop')
md5sums=('SKIP'
         'c970e45feebfeb119590b7d644356f98'
         '79384e860c48456af548c1c8bf1c713a')

pkgver() {
    cd "${srcdir}/t-engine4"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/t-engine4"

    patch -p1 < "${srcdir}/sdl_includes.patch"

    premake4 gmake
    make config=release
}

package() {
        # Generate the launcher.
        cat <<EOF > tome4-git
#!/bin/sh
cd "/opt/${pkgname}"
./t-engine
EOF

# Installing into /opt/${pkgname} because tome4 is a self-contained piece of software.
_inst_dir="${pkgdir}/opt/${pkgname}"

        # Install the icon.
        install -Dm644 "${srcdir}/t-engine4/game/engines/default/data/gfx/te4-icon.png" \
                        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

        # Install the documents.
        install -Dm644 "${srcdir}/t-engine4/CONTRIBUTING" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING"
        install -Dm644 "${srcdir}/t-engine4/CREDITS" "${pkgdir}/usr/share/doc/${pkgname}/CREDITS"

        # Install the custom license into standard location.
        install -Dm644 "${srcdir}/t-engine4/COPYING-TILES" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING-TILES"

        # Install the game executable, and the launcher.
        install -Dm755 "${srcdir}/t-engine4/t-engine" "${_inst_dir}/t-engine"
        install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
        install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

        # Install the game data.
        cp -r "${srcdir}/t-engine4/bootstrap" "${_inst_dir}/"
        cp -r "${srcdir}/t-engine4/game" "${_inst_dir}/"

        # Delete built-in fonts from the game.
        cd "${_inst_dir}/game/engines/default/data/font/"
        rm	Vera.ttf \
                VeraBd.ttf \
                VeraIt.ttf \
                VeraMono.ttf \
                VeraMoBd.ttf \
                DroidSans.ttf \
                DroidSansMono.ttf \
                DroidSans-Bold.ttf \
                DroidSerif.ttf \
                DroidSerif-Bold.ttf \
                DroidSerif-Italic.ttf \
                DroidSerif-BoldItalic.ttf
}

