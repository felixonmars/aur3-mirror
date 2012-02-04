pkgname=nerolinux3
pkgver=3.5.3.1
pkgrel=1
pkgdesc="Nero Burning ROM 3 for linux"
url="http://www.nero.com/eng/linux3.html"
license=('custom')
conflicts=(nerolinux)
depends=('gtk2')
makedepends=('rpmextract')
arch=('i686' 'x86_64')
source=(http://unix.oppserver.net/nero/nerolinux-${pkgver}-x86.rpm)
md5sums=('73c1090e85fbf7c1df130374117ce93b')
install=nerolinux.install

[ "$CARCH" = "x86_64" ] && source=(http://unix.oppserver.net/nero/nerolinux-${pkgver}-x86_64.rpm)
[ "$CARCH" = "x86_64" ] && md5sums=('e4c3bfb90b05f2717ef2d7974966c086')



build() {
    cd $startdir/pkg/

    if [ "$CARCH" = "x86_64" ]; then
        rpmextract.sh ${startdir}/src/nerolinux-${pkgver}-x86_64.rpm
    else
        rpmextract.sh ${startdir}/src/nerolinux-${pkgver}-x86.rpm
    fi

    chmod a+rx -R *
    find . -type f -exec chmod -x \{\} \;
    chmod +x usr/bin/{nero,nerocmd}

    mkdir -p usr/share/licenses/nerolinux
    mv usr/share/doc/nero/EULA* usr/share/licenses/nerolinux
}
