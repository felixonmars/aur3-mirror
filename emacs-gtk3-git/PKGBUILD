# Contributor: zhuqin <zhuqin83@gmail.com>
# Contributor: Mic92 <jthalheim@gmail.com>

pkgname=emacs-gtk3-git
pkgver=20120410
pkgrel=1
pkgdesc="Gnu Emacs with gtk3 enabled from Git"
url="http://www.gnu.org/software/emacs/emacs.html"
license=('GPL')
depends=('gtk3' 'texinfo' 'hicolor-icon-theme' 'giflib')
makedepends=('git')
optdepends=('alsa-lib'
	    'desktop-file-utils: provide the desktop entry'
	    'gconf: for detecting the default system font in gnome'
	    'ghostscript: for viewing pdf/ps'
	    'gpm: mouse support on console'
	    'librsvg'
	    'libotf: to use opentype fonts'
	    'libxpm')
arch=('i686' 'x86_64')
provides=('emacs')
conflicts=('emacs' 'emacs-bzr' 'emacs-gtk3-bzr')
install=emacs.install

_gitroot="http://git.savannah.gnu.org/r/emacs.git"
_gitname="emacs"

build() {
    cd $srcdir
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
	cd $_gitname && git pull origin
	msg "The local files are updated."
    else
	git clone $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    rm -rf $srcdir/$_gitname-build
    git clone $srcdir/$_gitname $srcdir/$_gitname-build

    cd $srcdir/$_gitname-build

    ./autogen.sh
    ./configure \
	--prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--libexecdir=/usr/lib \
	--without-sound \
	--with-x-toolkit=gtk3
    make
}

package() {
    cd $srcdir/$_gitname-build
    make DESTDIR=$pkgdir install

    # remove conflict with ctags packages
    mv $pkgdir/usr/bin/{ctags,ctags.emacs}
    mv $pkgdir/usr/bin/{etags,etags.emacs}
    mv $pkgdir/usr/share/man/man1/{etags.1.gz,etags.emacs.1.gz}
    mv $pkgdir/usr/share/man/man1/{ctags.1.gz,ctags.emacs.1.gz}

    # fix user/root permissions on usr/share files
    find $pkgdir/usr/share/emacs/24* -exec chown root.root {} \;
    # fix perms on /var/games
    chmod 775 $pkgdir/var/games
    chmod 775 $pkgdir/var/games/emacs
    chmod 664 $pkgdir/var/games/emacs/*
    chown -R root:games $pkgdir/var/games

}
