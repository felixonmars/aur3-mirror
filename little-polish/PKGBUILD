# Contributor: Piotr Beling <qwak@w8.pl>
pkgname=little-polish
pkgver=0.7
pkgrel=2
pkgdesc="program (game) which plays Brazilian (classics, 8x8 with international rules) checkers (draughts)"
arch=(i686 x86_64)
url="http://warcaby.w8.pl/"
license=("freeware")
depends=('gcc-libs' 'libxft' 'libxext')

source=("http://warcaby.w8.pl/download/littlepolish${pkgver/./}_linux_${CARCH/_/-}.tar.gz"
				 "little-polish"
				 "little-polish.desktop"
				 "little-polish.png")

md5sums=('e3a44601848f907c1dd1a725ceee1921'
         '21d3f365911f074e1330083e443db159'
         '2f07e04240b210c699929ba5382ada8c'
	 '3f6dc6895e3b7e5a3db9bb6d029e7a18')
			   			   			   		  
[ "$CARCH" = "x86_64" ] && md5sums[0]='d49e4d9c92c5708fc5acc1bb89484605'

build() {
    local dstdir=$startdir/pkg/usr/share/games/$pkgname
    install -d $dstdir
    
    cd $startdir/src
    
    install -m 644 white.ouv $dstdir/white.ouv
    install -m 644 black.ouv $dstdir/black.ouv
    install -m 755 little_polish $dstdir/little_polish
    
    install -D -m644 little-polish.desktop \
            $startdir/pkg/usr/share/applications/little-polish.desktop
	    
    install -D -m644 little-polish.png \
            $startdir/pkg/usr/share/pixmaps/little-polish.png
	             
    install -D -m755 little-polish \
         $startdir/pkg/usr/bin/little-polish
			     
}