# Contributor: Artificial Intelligence <polarbeard@gmail.com>
# Special thanks to donvla for improving the script.

pkgname=phobia3
pkgver=1.1
pkgrel=3
pkgdesc="Shoot through a tons of bug, blood and guts all over the place. PhobiaIII is a fast paced Third Person Shooter."
arch=('i686' 'x86_64')
url='http://www.redlynx.com/phobiaIII/index.html'
license=('custom: "freeware"')
if [ "$CARCH" = "x86_64" ]; then
        depends=('lib32-libxext' 'lib32-libvorbis' 'lib32-sdl' 'lib32-sdl_mixer' 'lib32-libart-lgpl' 'lib32-libstdc++5' 'lib32-esound' 'lib32-smpeg')
else   
        depends=('libxext' 'libvorbis' 'sdl' 'sdl_mixer' 'libart-lgpl' 'libstdc++5' 'esound' 'smpeg')
fi          
source=("http://www.redlynx.com/phobiaIII/download/phobia3-linux.tar.bz2"
        "http://mirrors.kernel.org/ubuntu/pool/universe/g/gcc-2.95/libstdc++2.10-glibc2.2_2.95.4-24_i386.deb"
        "Phobia3.png"
        "phobia3.desktop"
        "phobia3.launcher")
md5sums=('d184426f643e3b2af9851ae9d5a6351c'
         'b2da87d562dc2078c8244e980a4722b4'
         '8ec7d56dbb4f006b906e96725fe9e89c'
         '27a9dce1e8787085a76261086389fc4c'
         'e2ee119c281b506a8285d78d0605713d')

build() {
    cd ${srcdir} 

    # Symblink of libs into Phobia3
    mkdir -p ${pkgdir}/opt/PhobiaIII/lib && cd ${pkgdir}/opt/PhobiaIII/lib || return 1
    if [ "$CARCH" = "x86_64" ]; then
            ln -s /opt/lib32/usr/lib/libart_lgpl_2.so ./libartsc.so.0 || return 1
            ln -s /opt/lib32/usr/lib/libvorbisfile.so ./libvorbisfile.so.0 || return 1

    else
            ln -s /usr/lib/libart_lgpl_2.so ./libartsc.so.0 || return 1
            ln -s /usr/lib/libvorbisfile.so ./libvorbisfile.so.0 || return 1

    fi

    cd ${srcdir} 

    # Installing an old forgotten lib to Phobia3 lib folder. Only found .deb of this lib.
    bsdtar -xvf libstdc++2.10-glibc2.2_2.95.4-24_i386.deb || return 1
    bsdtar -xvf data.tar.gz || return 1
    install -m 0644 ${srcdir}/usr/lib/libstdc++-3-libc6.2-2-2.10.0.so ${pkgdir}/opt/PhobiaIII/lib/libstdc++-libc6.2-2.so.3 || return 1

    # Install the data
    rm -rf ${srcdir}/phobia3/src
    cp -r ${srcdir}/phobia3/* ${pkgdir}/opt/PhobiaIII || return 1
    # set right perms
    find ${pkgdir}/opt/PhobiaIII -type f -exec chmod 644 '{}' \;
    find ${pkgdir}/opt/PhobiaIII -type d -exec chmod 755 '{}' \;
    chmod 755 ${pkgdir}/opt/PhobiaIII/phobia3

    # Install Icon
    install -D -m 644 ${srcdir}/Phobia3.png \
        ${pkgdir}/usr/share/pixmaps/Phobia3.png || return 1

    # Install .desktop file
    install -D -m 644 ${srcdir}/phobia3.desktop \
        ${pkgdir}/usr/share/applications/phobia3.desktop || return 1

    # Install Game Launcher
    install -D -m 755 ${srcdir}/phobia3.launcher \
        ${pkgdir}/usr/bin/phobia3 || return 1
}