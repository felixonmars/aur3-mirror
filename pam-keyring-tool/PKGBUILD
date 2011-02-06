# Contributor: astaroth <astaroth_@web.de>
pkgname="pam-keyring-tool"
pkgver=0.0.9
pkgrel=1
pkgdesc="command-line utility for handling gnome keyrings"
url="http://www.hekanetworks.com/index.php/publisher/articleview/frmArticleID/25/staticId/31/"
license="GPL"
arch=('i686')
depends=('gnome-keyring')
makedepends=('libtool')
source=("http://www.hekanetworks.com/opensource/pam_keyring/pam_keyring-0.0.9.tar.gz")
sha1sums=("5176540bff531e7aa81c973e90552d4262f9f6ab")
md5sums=("a5209121c8d91c6c0c4e12caf4e74934")

build() {
    cd $startdir/src/pam_keyring-$pkgver/
    #bugfix for wrong libtool path in the makefile
    ln -s `which libtool` libtool
    ./configure --prefix=/usr/
    make || return 1
    #remove symbolic link
    rm ./libtool
    install -d $startdir/pkg/usr/bin/
    install -m755 src/pam-keyring-tool $startdir/pkg/usr/bin/
}
