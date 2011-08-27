    # Contributor: < silveriomm@bol.com.br >

    pkgname=zpacman
    pkgver=2010.06
    pkgrel=0
    pkgdesc="A Simple Frontend, Using Zenity, and Portuguese of Brazil, For Pacman, the Archlinux Package Manager"
    arch=('i686')
    url="http://zpacman.sourceforge.net/"
    depends=('bash' 'sudo' 'gedit' 'gnome-terminal' 'zenity')
    license=('GPL')
    source=()
    md5sums=()

    build() {
  	mkdir -p $startdir/pkg/usr/bin
  	install -D -m 755 $startdir/zpacman $startdir/pkg/usr/bin/
  	mkdir -p $startdir/pkg/usr/share/applications
  	install -D -m 644 $startdir/ZPacman.desktop $startdir/pkg/usr/share/applications/
	mkdir -p $startdir/pkg/usr/share/pixmaps
	install -D -m 644 $startdir/zpacman.png $startdir/pkg/usr/share/pixmaps/
    }
