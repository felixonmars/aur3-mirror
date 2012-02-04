# Maintainer: Damnshock <damnshock-youknowwhatgoeshere-gmail.com>
pkgname=mailody
pkgver=0.5.0
pkgrel=1
pkgdesc="A mail client for KDE (an option to Kmail)"
arch=('i686' 'x86_64')
url="http://www.mailody.net"
depends=('kdelibs' 'qca-tls' 'sqlite3')
provides=('mailody')
source=(http://ovh.dl.sourceforge.net/sourceforge/mailody/mailody-$pkgver.tar.bz2)
md5sums=('346651631db05f99872ff7264908d7f9')
build() {
  cd $startdir/src/${pkgname}-$pkgver
    ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=$startdir/pkg install
}
