    # Contributor: Silvério Mantovaneli <silveriomm@bol.com.br>
    pkgname=dpacman-eng
    pkgver=2011.04
    pkgrel=0
    pkgdesc="A Simple Frontend (GUI interface), Using Dialog, For Pacman,
    the Archlinux Package Manager. English Version"
    arch=('i686')
    url="http://zpacman.sourceforge.net/"
    depends=('sakura' 'bash' 'sudo' 'mc' 'dialog')
    license=('GPL')
    source=()
    md5sums=()

    build() {
  	mkdir -p $startdir/pkg/usr/bin
  	install -D -m 755 $startdir/dpacman $startdir/pkg/usr/bin/
  	mkdir -p $startdir/pkg/usr/share/applications
	install -D -m 644 $startdir/dpacman.desktop $startdir/pkg/usr/share/applications/
	mkdir -p $startdir/pkg/usr/share/pixmaps
	install -D -m 644 $startdir/dpacman.png $startdir/pkg/usr/share/pixmaps/
    }

