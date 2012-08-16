# contributor : Sabaku
pkgname=teamspeak
pkgver=3.0.8
pkgrel=1
pkgdesc="TeamSpeak is a proprietary Voice over IP software"
url="http://www.teamspeak.com/"
license=('custom')
depends=('qt' 'libpulse')
arch=('x86_64')
source=("http://teamspeak.gameserver.gamed.de/ts3/releases/${pkgver}.${pkgrel}/TeamSpeak3-Client-linux_amd64-${pkgver}.${pkgrel}.run" 'teamspeak.desktop' 'icon.xpm' 'teamspeak.launcher' 'teamspeak.png')
        
  build() {
    cd ${srcdir}

    # Create Destination Directories
	install -d ${pkgdir}/usr/share/${pkgname}
	
    # Make Installer Executable
    chmod +x TeamSpeak3-Client-linux_amd64-${pkgver}.${pkgrel}.run
    
    # Run Installer
    ./TeamSpeak3-Client-linux_amd64-${pkgver}.${pkgrel}.run

	# Copy source files and replace libss
	cp -r ${srcdir}/TeamSpeak3-Client-linux_amd64/* ${pkgdir}/usr/share/${pkgname}/
	cp /usr/lib/libQtCore.so.4 ${pkgdir}/usr/share/teamspeak/
	cp /usr/lib/libQtGui.so.4 ${pkgdir}/usr/share/teamspeak/
	cp /usr/lib/libQtNetwork.so.4 ${pkgdir}/usr/share/teamspeak/

    # Install Desktop File
    install -D -m644 $srcdir/teamspeak.desktop ${pkgdir}/usr/share/applications/teamspeak.desktop

    # Install Icon File
    install -D -m644 $srcdir/icon.xpm ${pkgdir}/usr/share/pixmaps/teamspeak.xpm
    install -D -m644 $srcdir/teamspeak.png ${pkgdir}/usr/share/pixmaps/teamspeak.png

    # Install Client Launcher
    install -D -m755 $srcdir/teamspeak.launcher ${pkgdir}/usr/bin/teamspeak
}

md5sums=('c4d6935625705cd9345a2b0f44feda16'
         '075ac77ae5643fb560d018443d3d008f'
         '19f103384e4c1a0aafc8fed44de0c87b'
         'e874c4aebc0a08bcd5f7e2bde98f6b29'
         'c9db18ecbc258a7306c78f41c6e7d95e')
