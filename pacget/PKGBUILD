# Contributor: Vladimir Ermakov <vooon341@gmail.com>
# Contributor: Aurel Canciu <aurelcanciu@gmail.com>

pkgname=pacget
pkgver=20110531
pkgrel=1
pkgdesc="Aria2 Mirror Script"
arch=('i686' 'x86_64')
url="http://wiki.archlinux.org/index.php/Improve_Pacman_Performance#Pacget_.28aria2.29_Mirror_Script"
license=('FDL')
depends=('aria2')
backup=(etc/pacget.conf)
install=$pkgname.install
source=(pacget pacget.conf)
md5sums=('78420c591e970519c2ea7cb8207cf195'
         'd0a90dbe184a727163732428abcd0624')

build() {

  install -D -m755 $srcdir/pacget $pkgdir/usr/bin/pacget
  install -D -m644 $srcdir/pacget.conf $pkgdir/etc/pacget.conf

}

