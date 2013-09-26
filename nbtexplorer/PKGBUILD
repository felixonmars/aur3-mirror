# Maintainer: Alan Jenkins <alan.james.jenkins@gmail.com>

pkgname=nbtexplorer
pkgver=latest
pkgrel=1
pkgdesc="NBTExplorer is a Minecraft NBT Editor for editing player and world files."
arch=('i686' 'x86_64')
url="http://www.minecraftforum.net/topic/840677-nbtexplorer-nbt-editor-for-windows-and-mac/"
license=('unknown')
depends=('mono' 'xorg-server-utils' 'unzip')
provides=('nbtexplorer')

source=(http://hocuspocus.taloncrossing.com/rii/NBTExplorer-2.4.0.zip nbtexplorer nbtexplorer.png nbtexplorer.desktop)
md5sums=('8b372bb87544bf4ab0b0e4a1f4937969'
         '49ae5eca65fe9ee7f546e7f518e98621'
         'ae0ef756dcb6f660e245a8b6bdc381d3'
         '62170849669e8c833c5929070eadd0f7')

package() {
    cd "$srcdir"
    unzip -o NBTExplorer-2.4.0.zip
    install -D -m555 "${srcdir}/nbtexplorer"             "${pkgdir}/usr/bin/nbtexplorer"
    install -D -m444 "${srcdir}/NBTExplorer.exe"         "${pkgdir}/usr/share/nbtexplorer/NBTExplorer.exe"
    install -D -m444 "${srcdir}/NBTExplorer.exe.config"  "${pkgdir}/usr/share/nbtexplorer/NBTExplorer.exe.config"
    install -D -m444 "${srcdir}/Substrate.dll"           "${pkgdir}/usr/share/nbtexplorer/Substrate.dll"

    # Desktop launcher with icon
    install -D -m444 "${srcdir}/nbtexplorer.desktop"     "${pkgdir}/usr/share/applications/nbtexplorer.desktop"
    install -D -m444 "${srcdir}/nbtexplorer.png"         "${pkgdir}/usr/share/pixmaps/nbtexplorer.png"
    
    # License
    #install -D -m644 "${srcdir}/LICENSE"           "${pkgdir}/usr/share/licenses/atlauncher/LICENSE"
}

# vim:set ts=4 sw=4 et:
