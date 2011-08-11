# Contributor: Gadget3000 <gadget3000 at msn dot com>
# Contributor: Martin Berkemeier <phobinator[at]googlemail[dot]de>
# Thanks to original PKGBUILD from Contributor Hiz <hizdiez[at]gmail[dot]com>

pkgname=emerald-secondlife-bin
pkgver=1.23.5.1635
pkgrel=2
pkgdesc="Second Life is a 3-D virtual world entirely built and owned by its residents. Emerald is alternative viewer"
url="http://code.google.com/p/emeraldviewer/"
license=('GPL2')
[ "$CARCH" = "i686"   ] && depends=('gtk2' 'libgl' 'libidn' 'libjpeg6' 'mesa' 'nss' 'sdl')
[ "$CARCH" = "x86_64" ] && depends=('lib32-freealut' 'gtk2' 'lib32-gtk2' 'libgl' 'lib32-libgl' 'lib32-libjpeg6' 'lib32-libxdamage' 'mesa' 'lib32-mesa' 'lib32-nss' 'lib32-sdl')
[ "$CARCH" = "x86_64" ] && optdepends=('lib32-nvidia-utils: GL support for NVIDIA drivers')
arch=('i686' 'x86_64')
conflicts=('emerald-secondlife-bin-alpha')
install=emerald-secondlife.install
source=('emerald-secondlife.desktop' 'emerald-secondlife.launcher' \
"http://emeraldviewer.googlecode.com/files/Emerald-Viewer-i686-${pkgver}.tar.bz2")
md5sums=('1023dd352c15891e6bee667610543986'
         '0b8710704c8a6f2f7f33248fb5c0944c'
         '58ed2cd2d836e23e3f9096b777f1d468')

build() {
    cd $srcdir;

    # Rename Data Directory
    mv Emerald-Viewer-i686-${pkgver}/ Emerald-secondlife

    # Install Desktop File
    install -D -m644 $srcdir/emerald-secondlife.desktop \
        $pkgdir/usr/share/applications/emerald-secondlife.desktop

    # Install Icon File
    install -D -m644 $srcdir/Emerald-secondlife/secondlife_icon.png \
        $pkgdir/usr/share/pixmaps/emerald-secondlife.png

    # Install Launcher
    install -D -m755 $srcdir/emerald-secondlife.launcher \
        $pkgdir/usr/bin/emerald-secondlife

    # Move Data to Destination Directory
    install -d $pkgdir/opt/
    mv Emerald-secondlife/ $pkgdir/opt/

    # Change Permissions of files to root:games
    chown -R root:games $pkgdir/opt/Emerald-secondlife
    chmod -R g+rw $pkgdir/opt/Emerald-secondlife
#    chmod -R g+r $pkgdir/opt/Emerald-secondlife

    # Make Binary Group-Executable
    chmod g+x $pkgdir/opt/Emerald-secondlife/secondlife

    #Fix a download URL
    sed "s/\#URL=\"http:\/\/download/URL=\"http:\/\/download/" -i ${pkgdir}/opt/Emerald-secondlife/fetch_bins.sh
    sed "s/URL=\"http:\/\/modularsystems/\#URL=\"http:\/\/modularsystems/" -i ${pkgdir}/opt/Emerald-secondlife/fetch_bins.sh
}

