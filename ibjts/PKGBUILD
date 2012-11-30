# Contributor: Allen Hoffmeyer <allen dot hoffmeyer at gmail dot com>

pkgname=ibjts
pkgver=933
pkgrel=3
pkgdesc="Interactive Brokers Trade Workstation"
arch=('i686' 'x86_64')
url=http://www.interactivebrokers.com/
license=('GPL2')
depends=('java-runtime>=6u10')

# IMPORTANT: To build this package, you need to obtain the unixmacosx.jar
#            file and add it to the directory that contains the PKGBUILD.
#            This package will NOT build without that file. You can obtain 
#            the file at the Interactive Brokers website.

source=('IBJts.desktop' 'IBJts.sh' 'IBJts_64x64.gif' 'unixmacosx.jar')
md5sums=('2478b7ab92b2e8532742c4e5dbe59e44'
         'a6a1cb7b478e9cc9490928f5662b8b8f'
         'de672919cfbcd4668a10db082517560a'
         'ed66264bebf0cabd9ef08d8ba67793bb')

build() {
    bsdtar -xf "$srcdir/${source[3]}"
}

package() {
    install -dm755 $pkgdir/opt/IBJts
    cp -dpr --no-preserve=ownership $srcdir/IBJts/* $pkgdir/opt/IBJts
    
    msg "Making it nice..."
    chmod 0644 $pkgdir/opt/IBJts/*
    install -Dm755 $srcdir/IBJts.sh $pkgdir/opt/IBJts/IBJts.sh
    install -Dm644 $srcdir/IBJts.desktop \
	    $pkgdir/usr/share/applications/IBJts.desktop
    install -Dm644 $srcdir/IBJts_64x64.gif \
	    $pkgdir/usr/share/pixmaps/IBJts_64x64.gif
}

# vim:set ts=4 sw=4 et:
