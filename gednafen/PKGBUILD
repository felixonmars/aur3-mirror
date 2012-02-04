    # Contributor: Silvério Mantovaneli <silveriomm@bol.com.br>
    pkgname=gednafen
    pkgver=2011.11
    pkgrel=01
    pkgdesc="A Simple Frontend (GUI interface), Using Pygtk, For Mednafen, the Multi System Emulator"
    arch=('i686')
    url="http://zpacman.sourceforge.net/"
    depends=('python2' 'pygtk' 'mednafen')
    license=('GPL')
    source=()
    md5sums=()

    build() {
  	mkdir -p $startdir/pkg/usr/bin
  	install -D -m 755 $startdir/gednafen.py $startdir/pkg/usr/bin/
  	mkdir -p $startdir/pkg/usr/share/applications
	install -D -m 644 $startdir/gednafen.desktop $startdir/pkg/usr/share/applications/
	mkdir -p $startdir/pkg/usr/share/pixmaps
	install -D -m 644 $startdir/icon_mednafen.png $startdir/pkg/usr/share/pixmaps/
    }

