# Maintainer: garion < garion @ mailoo.org >
# Contributor: Alessandro Nakamuta <alessandro dot ufms at gmail dot com>

pkgname=mysecureshell
pkgver=1.33
pkgrel=2
pkgdesc="A shell that add several features to sftp-server"
arch=('arm' 'i686' 'x86_64')
url="http://mysecureshell.sourceforge.net"
install=$pkgname.install
depends=('openssh')
backup=(etc/ssh/sftp_config)
license=('GPL')
source=(http://mysecureshell.free.fr/repository/index.php/source/mysecureshell_$pkgver.tar.gz)
md5sums=('ce8abdb5cb3cc972f70a233999f0c3c7')

build(){
    cd "$srcdir"/"$pkgname"_"$pkgver"
    ./configure
    make all
}

package(){
    cd "$srcdir"/"$pkgname"_"$pkgver"
    USER=root
    sed -i -e 's!MANDIR=/share/man!MANDIR=/usr/share/man!g' ./install.sh
    ./install.sh yesall "$pkgdir"

    chmod a+r "$pkgdir/usr/bin/sftp-kill"
    chmod a+r "$pkgdir/usr/bin/sftp-admin"
    chmod a+r "$pkgdir/usr/bin/sftp-state"

    cp -pvR man/fr $pkgdir/usr/share/man/
}
