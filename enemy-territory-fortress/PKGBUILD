# Maintainer: J. W. Birdsong  <jwbirdsong AT gmail DOT com>
# Contributor: Travis Nickles <ryoohki7@yahoo.com>

pkgname=enemy-territory-fortress
pkgver=1.60
pkgrel=3
pkgdesc="Class-based teamplay shooter"
url="http://teamfortress.wikia.com/wiki/Enemy_Territory_Fortress"
license="custom"
arch=('i686' 'x86_64')
depends=('enemy-territory')
makedepends=('unzip')
backup=(opt/enemy-territory/etf/etf_server.cfg)
source=(http://files.kgaming.eu/etf/linux/full/etf_1.6-english-2.run et-f.desktop \
et-f.sh et-fded.sh)
md5sums=('235b1a7e8153b1c0ed422f775d25d3ac' '2056bdd3570714a36ea9f834b29bf0db'\
         'e53691f51a18fc745a927b105c81225b' 'fc5f164f07219ef695e54f372cf917f2')
install=enemy-territory-fortress.install

build() {
  cd $startdir/src
  chmod +x etf_1.6-english-2.run
  ./etf_1.6-english-2.run --noexec --target etf

  rm -r etf/bin etf/enemy-territory.xml etf/README.etf \
etf/search.sh etf/setup.{data,sh} etf/uninstall
  tar -xzf etf/etf.tar.gz
  tar -xzf etf/cfgnormal.tar.gz
  rm etf/cfg{hi,low,normal,xtrahi}.tar.gz etf/etf.tar.gz
  chown root:root -R *
  find ${srcdir}/etf -type d -exec chmod 755 '{}' \;
  find ${srcdir}/etf -type f -exec chmod 644 '{}' \;
  install -D -m 755 et-f.sh etf/et-f
  install -D -m 755 et-fded.sh etf/et-fded

  mkdir -p ${pkgdir}/opt/enemy-territory ${pkgdir}/usr/bin
  mv etf ${pkgdir}/opt/enemy-territory
  install -D -m 644 et-f.desktop ${pkgdir}/usr/share/applications/et-f.desktop
  ln -sf /opt/enemy-territory/etf/{et-f,et-fded} ${pkgdir}/usr/bin/
}

