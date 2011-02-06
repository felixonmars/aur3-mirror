# Contributor: Slash <demodevil5[at]yahoo[dot]com>
# Modified for x86_64 by Gregory T. Helton <gt@fallendusk.org>

pkgname=bin32-teamspeak2
pkgver=rc2_2032
pkgrel=3
pkgdesc="TeamSpeak is software for quality voice communication via the Internet. For x86_64."
url="http://www.goteamspeak.com/"
license="custom"
depends=('lib32-libxext' 'lib32-libjpeg6' 'lib32-libsm' 'lib32-gcc-libs')
arch=('x86_64')
source=('teamspeak.desktop'
	'ts2-alsa'
	"ftp://ftp.freenet.de/pub/4players/teamspeak.org/releases/ts2_client_${pkgver}.tar.bz2")

md5sums=('14308ce2787df7b6673259b86179f319'
         '33efd899f14f5195a2d2a8c4698cdecc'
         'e93d17a25e07b1cbe400e4eb028ca8f8')

build() {
    # Modify Launcher Script
    cd $startdir/src/ts2_client_rc2_2032/setup.data/image/
    sed -i "s:%installdir%:/opt/teamspeak:" TeamSpeak

    # Install Desktop Icons
    install -D -m644 $startdir/src/teamspeak.desktop \
        $pkgdir/usr/share/applications/teamspeak.desktop
    install -D -m644 $startdir/src/ts2_client_rc2_2032/setup.data/image/icon.xpm \
        $pkgdir/usr/share/pixmaps/teamspeak.xpm

    # Install Custom License
    install -D -m644 $startdir/src/ts2_client_rc2_2032/setup.data/image/clicense.txt \
        $pkgdir/usr/share/licenses/$pkgname/clicense.txt

    # Move Program Data to Package Directory
    cd $startdir/src/ts2_client_rc2_2032/setup.data/
    install -d -m755 $pkgdir/opt/
    mv image/ $pkgdir/opt/teamspeak

    # Link in /usr/bin/
    install -d -m755 $pkgdir/usr/bin/
    ln -sf /opt/teamspeak/TeamSpeak $pkgdir/usr/bin/

    # Install alsa-oss wrapper #
    install -D -m755 $startdir/src/ts2-alsa $pkgdir/usr/bin/ts2-alsa
}