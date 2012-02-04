# Contributor: uastasi  <uastasi@archlinux.us>
pkgname=pidgin-webkit
pkgver=69
pkgrel=1
pkgdesc="WebKit-based message styles for Pidgin, similar to Adium"
url='https://code.launchpad.net/pidgin-webkit'
license=('GPL')
depends=('pidgin' 'libwebkit')
makedepends=('bzr')
arch=('i686' 'x86_64')
install=pidgin-webkit.install
source=(http://launchpadlibrarian.net/23856598/pidgin-webkit-tempfile-2.patch)
md5sums=('0fd5b4bd8ea58d8598e79307331a343e')

_bzrtrunk=https://code.launchpad.net/~simom/$pkgname/trunk

build() {
    cd $startdir/src/
    msg "Connecting to the server...."

    if [ ! -d ./$pkgname ]; then
      bzr co ${_bzrtrunk} $pkgname -r ${pkgver}
    else
      bzr up $pkgname
    fi
    msg "BZR checkout done or server timeout"
    msg "Starting make..."

    [ -d ./$pkgname-build ] && rm -rf ./$pkgname-build
    cp -r ./$pkgname ./$pkgname-build
    cd ./$pkgname-build
    patch -i ../pidgin-webkit-tempfile-2.patch || return 1

    make || return 1
    mkdir -p $startdir/pkg/usr/lib/pidgin/
    install -m 755 $startdir/src/$pkgname-build/webkit.so $startdir/pkg/usr/lib/pidgin/
    }
