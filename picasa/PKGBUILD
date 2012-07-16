# Contributor: Laurie Clark-Michalek <bluepeppers@archlinux.us>
# Contributor: escoand <escoand@freenet.de>
# Maintainer: yugrotavele <yugrotavele at archlinux dot us>
# Maintainer: execat

pkgname=picasa
pkgver=3.0_5744.02
pkgrel=6
pkgdesc="A software that helps you instantly find, edit and share all the pictures on your PC"
arch=('i686' 'x86_64')
url="http://picasa.google.com"
license=('custom:picasa')
conflicts=('picasa-beta')
provides=('picasa')
[ "$CARCH" = "i686" ] && depends=('freetype2' 'libgphoto2')
[ "$CARCH" = "x86_64" ] && depends=('freetype2' 'libgphoto2' 'lib32-libsm' 'lib32-nss' 'lib32-openssl')
makedepends=('rpmextract')
install=picasa.install
source=(ftp://ftp.pbone.net/mirror/www.pclinuxos.com/apt/pclinuxos/2010/RPMS.nonfree/picasa-3.0-current.i386.rpm
        picasa.desktop
        picasa.patch
        LICENSE
        uninstall.html)
md5sums=('5990be842062ca483239c9f1efca9614'
         'e0a5175084fb7aaf7a245f5d02592f28'
         'bad017cdf6c9770f8ec5137def0503d8'
         '67353beb3a9fdc3bd51f2940fb1fc9f4'
         'd4b3ad9a34e037c97feaea7a63b16e5c')

build() {
    local picasadir=opt/google/picasa/3.0

    # Extract the rpm
    install -d $srcdir/picasa && cd $srcdir/picasa
    rpmextract.sh $srcdir/picasa-3.0-current.i386.rpm || return 1

    # Patch the executable to work with x86_64
    patch -p1 < $srcdir/picasa.patch || return 1

    install -d $pkgdir/{$picasadir,usr/bin}

    # Copy needed wine files
    cp -rf $srcdir/picasa/$picasadir/wine $pkgdir/$picasadir

    # Install some needed executables in $picasadir/bin
    for file in picasa picasasplash setpicasascreensaver \
        showpicasascreensaver common.sh killpicasa showpicasascreensaver \
        wrapper fontinstall.sh picasafontcfg
    do
        install -Dm 755 $srcdir/picasa/$picasadir/bin/$file \
            $pkgdir/$picasadir/bin/$file
    done

    ln -s /$picasadir/bin/picasa $pkgdir/usr/bin/picasa

    # Desktop files
    install -Dm 644 $srcdir/picasa.desktop $pkgdir/usr/share/applications/picasa.desktop
    install -Dm 644 $srcdir/picasa/$picasadir/desktop/picasa.xpm $pkgdir/usr/share/pixmaps/picasa.xpm

    # Install hook files
    for file in email filemanager urlhandler mimehandler
    do
        install -Dm 755 $srcdir/picasa/$picasadir/desktop/picasa-hook-$file.sh.template \
            $pkgdir/$picasadir/info/picasa-hook-$file.sh
    done

    # Install license files
    install -Dm 644 $srcdir/picasa/$picasadir/bin/xdg-utils-1.0.2/LICENSE \
        $pkgdir/usr/share/licenses/$pkgname/LICENSE
    install -Dm 644 $srcdir/picasa/$picasadir/LICENSE.FOSS \
        $pkgdir/usr/share/licenses/$pkgname/LICENSE.FOSS
    install -Dm 644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/picasa.license

    # Remove some manpages, updater and uninstaller
    rm -rf $pkgdir/$picasadir/wine/share/man/ \
        $pkgdir/usr/wine/drive_c/Program\ Files/Picasa2/{Uninstall.exe,PicasaUpdate.exe,update,i18n}

    # Install ArchLinux specific uninstall documentation
    install -Dm 644 $srcdir/uninstall.html \
        $pkgdir/$picasadir/wine/drive_c/Program\ Files/Picasa2/i18n/uninstall.html
}
