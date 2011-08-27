# Contributor: Jose Valecillos <valecillosjg (at) gmail (dot) com>
pkgname=bolzplatz2006
pkgver=1.0.3
pkgrel=2
pkgdesc="Nice 3D Soccer Game (Comic Style)"
arch=('i686')
url="http://www.bolzplatz2006.de/"
license=('GPL' 'CCPL')
depends=('java-runtime' 'sdl')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://downloads.sourceforge.net/bp2k6/$pkgname-linux.tar.gz
    bolzplatz2006.desktop
    bolzplatz2006-settings.desktop
    settings.sh.diff)

build() {
    cd $startdir/src/
    install -m755 -d $startdir/pkg/usr/share/games/bolzplatz2006
    touch $startdir/pkg/usr/share/games/bolzplatz2006/log.txt
    touch $startdir/pkg/usr/share/games/bolzplatz2006/log2.txt
    install -m755 -d $startdir/pkg/usr/bin
    
    tar xvzf bp2k6-linux.tar.gz
    cp -R bolzplatz2006  $startdir/pkg/usr/share/games/
    mkdir -p $startdir/pkg/usr/share/doc/bolzplatz2006
    
    cp -R bolzplatz2006/doc/* $startdir/pkg/usr/share/doc/bolzplatz2006
    chmod -R 644 $startdir/pkg/usr/share/doc/bolzplatz2006
    
    chmod -R 755 $startdir/pkg/usr/share/games/bolzplatz2006
    
    tar xvf bp2k6-startscript.gz
    mv bp2k6 $startdir/pkg/usr/bin/
    chmod 755 $startdir/pkg/usr/bin/bp2k6
    rm bp2k6*.gz install.sh
    
    cd $startdir
    install -m644 -D bolzplatz2006.desktop ${startdir}/pkg/usr/share/applications/bolzplatz2006.desktop
    install -m644 -D bolzplatz2006-settings.desktop ${startdir}/pkg/usr/share/applications/bolzplatz2006-settings.desktop
    patch pkg/usr/share/games/bolzplatz2006/settings.sh settings.sh.diff
    
    chmod 777 $startdir/pkg/usr/share/games/bolzplatz2006/log*.txt
    
}

md5sums=('537d5a08425403b3e4247e116eca4f6e'
         '3fe567c79c6dafbb3c9009829b592ceb'
         '44534e156a665a83c357eacb201bfffb'
         '2bac5b90ee05e5651025042d0c3beeb1')
