pkgname=ut2004-goty
pkgver=3369.2
pkgrel=1
pkgdesc="Futuristic first person shooter by Epic Games, Game of the Year Edition (requires GOTY DVD)."
arch=('i686' 'x86_64')
url="http://www.unrealtournament2004.com"
license=('custom')
depends=('sdl' 'openal' 'unshield' 'libstdc++5')
install=ut2004.install
provides=('ut2004')

source=('http://downloads.unrealadmin.org/UT2004/Patches/Linux/ut2004-lnxpatch3369-2.tar.bz2'
        'ut2004.desktop'
        'data-install.sh'
        'ut2004.sh'
        'ut2004.png')

md5sums=('0fa447e05fe5a38e0e32adf171be405e'
         '4d82299d7078da02feb29e571d63dd18'
         'ca13c34441006d0234a053147b78f5d0'
         '85623fe9fecd0678e4f12902c22d7272'
         'ae0c25b321f327a465ad3580a53d7b61')

build() {
    install -d ${pkgdir}/usr/share/{applications,pixmaps}
    install -d ${pkgdir}/usr/bin
    install -d ${pkgdir}/opt/ut2004/{System,Scripts}

    cp -a ${srcdir}/UT2004-Patch/{Animations,Help,Speech,System,Textures,Web} ${pkgdir}/opt/ut2004/

    if [ "$CARCH" == "x86_64" ]
    then
        sed -i 's/ut2004-bin/&-linux-amd64/g' ${srcdir}/ut2004.sh
    else
        rm ${pkgdir}/opt/ut2004/System/*-amd64
    fi

    install -Dm755 ${srcdir}/ut2004.sh ${pkgdir}/usr/bin/ut2004
    install -Dm755 ${srcdir}/data-install.sh ${pkgdir}/opt/ut2004/Scripts/data-install
    install -Dm644 ${srcdir}/ut2004.desktop ${pkgdir}/usr/share/applications/ut2004.desktop
    install -Dm644 ${srcdir}/ut2004.png ${pkgdir}/usr/share/pixmaps/ut2004.png
    ln -s /usr/lib/libSDL-1.2.so.0 ${pkgdir}/opt/ut2004/System/ || return 1
    ln -s /usr/lib/libopenal.so ${pkgdir}/opt/ut2004/System/openal.so || return 1
}
