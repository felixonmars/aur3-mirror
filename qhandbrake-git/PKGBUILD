 # Contributor: Mariano Copetti <marianocopetti@gmail.com>

pkgname=qhandbrake-git
pkgver=20090712
pkgrel=1
pkgdesc="A Qt frontend for HandBrake, an open-source, GPL-licensed, multiplatform, multithreaded DVD to MPEG-4 converter."
arch=('i686' 'x86_64')
url="http://forum.handbrake.fr/viewtopic.php?f=4&t=6388"
license=('GPL')
depends=('qt')
makedepends=('ftjam' 'git' 'yasm' 'python' 'phonon')
source=('qhandbrake.desktop' 'A99-dvdread-aclocal-install.patch' 'A99-dvdnav-aclocal-install.patch')
md5sums=('5cfbaa7109266b7071aa63c5c6884686' '25fc6f654c4b792dc75d37b32ceee481' 'b4fbe1c505ce65cdb68d727ea31fd81d')

_gitroot="git://repo.or.cz/HandBrake.git"
_gitname="HandBrake"


build() {
    cd $srcdir

    if [[ -d $_gitname ]]; then
        (cd $_gitname && git pull origin)
    else
        git clone $_gitroot
	cd $_gitname
	git checkout  -b bonne/qhandbrake origin/bonne/qhandbrake
    fi
    
    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    cd $srcdir
    rm -rf $_gitname-build
    cp -r $_gitname $_gitname-build
    cd $_gitname-build

      # Add extra patches
  cp ${srcdir}/A99-dvdread-aclocal-install.patch ${srcdir}/$_gitname-build/contrib/libdvdread || return 1
  cp ${srcdir}/A99-dvdnav-aclocal-install.patch ${srcdir}/$_gitname-build/contrib/libdvdnav || return 1

    ./configure --disable-gtk || return 1
    cd build
    make || return 1
    cd qt
    install -D -m755 qtHB $startdir/pkg/usr/bin/qhandbrake
    install -D -m644 $srcdir/$_gitname-build/qt/gtkicons/hb-icon.128.png /$startdir/pkg/usr/share/pixmaps/qhandbrake.png
    install -D -m644 $startdir/qhandbrake.desktop $startdir/pkg/usr/share/applications/qhandbrake.desktop

}
