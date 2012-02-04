# Contributor: jiribb <jiribb@gmail.com>

pkgname=rabbit
_pkgname=RabbIT
pkgver=3.16pre2
_pkgver=3.16-pre2
pkgrel=3
pkgdesc="HTTP/1.1 compliant caching and filtering proxy written in Java"
arch=('i686')
url="http://www.khelekore.org/rabbit/"
license=('custom:AS-IS' 'custom:BSD')
groups=()
depends=('jre')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=('etc/rabbit/rabbit.conf')
options=()
install=rabbit.install
source=(http://www.khelekore.org/rabbit//$_pkgname$_pkgver-bin.tar.gz rabbit rabbit.install rc-rabbit)
noextract=()
md5sums=('8fac6f9855a1619b94e59228d882e206'
         '9a2c3a7048a6091792159ef179a08924'
         '590ee66a3ca50eabab8baa2a98602dad'
         '51ec5f8f310990d80d7640407bfdcaf9')

build() {
  cd "$srcdir/RabbIT3"

# prepare directories
  mkdir -p $pkgdir/etc/rabbit
  mkdir -p $pkgdir/var/{cache/rabbit,lib/rabbit,log/rabbit}
  mkdir -p $pkgdir/usr/share/licenses/$pkgname

# install license
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

# install jar
  install -D -m644 jars/rabbit3.jar $pkgdir/var/lib/$pkgname/jars/rabbit3.jar

# install files
  cp -R htdocs external_libs $pkgdir/var/lib/$pkgname/
  cp -R conf/* $pkgdir/etc/rabbit/
  sed -i 's/directory=\/tmp\/rcache/directory=\/var\/cache\/rabbit/' $pkgdir/etc/rabbit/rabbit.conf
  sed -i 's/=logs/=\/var\/log\/rabbit/g' $pkgdir/etc/rabbit/rabbit.conf
  sed -i 's/=conf/=\/etc\/rabbit/g' $pkgdir/etc/rabbit/rabbit.conf

# install rc script
  install -D -m755 $srcdir/rc-rabbit $pkgdir/etc/rc.d/rabbit

# install arguments file
  install -D -m644 $srcdir/rabbit $pkgdir/etc/conf.d/rabbit

# chmod
  chmod 770 $pkgdir/etc/rabbit
  chmod 770 $pkgdir/var/{cache/rabbit,log/rabbit}
}

# vim:set ts=2 sw=2 et:
