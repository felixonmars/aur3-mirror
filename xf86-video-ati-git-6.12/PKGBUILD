# Contributor: Flamelab <panosfilip@gmail.com>
# Modified by: Smith Dhumbumroong <zodmaner@gmail.com>

pkgname=xf86-video-ati-git-6.12
_realpkgname=xf86-video-ati
pkgver=20090512
pkgrel=1
pkgdesc="X.org ati video driver. 6.12 stable branch from freedesktop.org git repository."
arch=('i686' 'x86_64')
url="http://xorg.freedesktop.org/"
provides=('xf86-video-ati=6.12.2')
depends=('libdrm>=2.4.6' 'libpciaccess' 'ati-dri>=7.4')
makedepends=('pkgconfig' 'xorg-server>=1.6.0' 'fontsproto'
	         'glproto>=1.4.9' 'xf86driproto' 'diffutils' 'xorg-util-macros' 'xineramaproto' 'mesa' 'git')
conflicts=('xorg-server<1.6.0' 'xf86-video-ati=6.12.2')
options=('!libtool')
license=('custom')
source=('LICENSE')
md5sums=('75da66945980a43adf1e1856271b9d4a')

_gitroot="git://anongit.freedesktop.org/xorg/driver/xf86-video-ati"
_gitname="xf86-video-ati"
_gitbranch="6.12-branch"

build() {
    cd $srcdir
    msg "Connecting to git.freedesktop.org GIT server...."
 
    if [[ -d $srcdir/$_gitname ]]; then
    	cd $_gitname
    	git pull origin $_gitbranch || return 1
    	msg "The local files are updated."
    else
    	git clone $_gitroot 
        cd $_gitname 
        git checkout --track -b $_gitbranch origin/$_gitbranch || return 1
    fi
    
    msg "GIT checkout done or server timeout"
    msg "Starting make..."
    
    if [[ -d $srcdir/$_gitname-build ]]; then
       rm -rf $srcdir/$_gitname-build || return 1
    fi
    git clone $srcdir/$_gitname $srcdir/$_gitname-build || return 1
    
    cd $srcdir/$_gitname-build
    ./autogen.sh

    ./configure --prefix=/usr \
                --enable-dri || return 1
    make || return 1
    make DESTDIR=$pkgdir install || return 1
    install -D -m644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

