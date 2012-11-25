# Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=git-term
pkgver=1.3.1
pkgrel=3
pkgdesc="Git is a fast interpreter for the Glulx virtual machine."
arch=(i686 x86_64)
url="http://diden.net/if/git/"
license=('BSD')
groups=(inform)
source=(http://mirror.ifarchive.org/if-archive/programming/glulx/interpreters/git/git-131.zip http://mirror.ifreviews.org/if-archive/programming/glk/implementations/glktermw-104.tar.gz)
    
md5sums=('1a73b352ed523e34fc2d3b11aedc00cc'
         '050aeb964140f7e11f555e06a23ccb1d')

build() {
	cd $srcdir/glkterm
	sed -i -e "s/<ncursesw\/ncurses.h>/<ncurses.h>/g" $srcdir/glkterm/gtncursesw.c
	sed -i -e "s/<ncursesw\/ncurses.h>/<ncurses.h>/g" $srcdir/glkterm/Makefile
	make
	#note: glktermw is a portable API (programming interface) for applications with text UIs (user interfaces.)
	#it is needed to compile git
	
	ln -s $srcdir/glkterm $srcdir/glktermw
	
    cd $srcdir/git-131
    
    make GLK=glktermw OPTIONS=-lm INSTALLDIR=/usr/bin  || return 1
    install -D -m644 $srcdir/git-131/git $pkgdir/usr/bin/git-term
	chmod +x $pkgdir/usr/bin/git-term

}

