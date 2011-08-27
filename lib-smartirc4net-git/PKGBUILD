# Contributor: Tribal <tr1bal0000@gmail.com>
# Maintainer:  Tribal <tr1bal0000@gmail.com>
pkgname=lib-smartirc4net-git
pkgver=20100616
pkgrel=3
pkgdesc="SmartIrc4net is a multi-threaded and thread-safe IRC library written in C#"
arch=('i686' 'x86_64')
url="http://smartirc4net.meebey.net/jaws/"
license=('GPL')
source=(Makefile.patch)
makedepends=('git' 'mono' 'log4net')
md5sums=('a3a39d4e3a3746b2201a29b1f5f5b20d')

_gitroot="git://git.qnetp.net/smartirc4net.git"
_gitname="smartirc4net"

build() {
  cd $srcdir
  msg "Connecting to GIT Server..."
  
    if [ -d $_gitname ] ; then
	cd $_gitname && git pull origin
	msg "The local files are updated."
    else
	git clone $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    cd $srcdir/$_gitname

    sh autogen.sh
    patch -Np1 src/Makefile ../../Makefile.patch || return 1
    make || return 1
    make DESTDIR="$pkgdir/" install
}
