# Contributor: Enrico Morelli <morelli@cerm.unifi.it>
pkgname=gshield
pkgver=2.8
pkgrel=4
pkgdesc="iptables firewall configuration system"
arch=(i686)
url="http://muse.linuxmafia.org/gshield/"
license=('GPL-2')
depends=("iptables" "dnsutils")
install=($pkgname.install)
source=(http://ftp.nluug.nl/security/coast/firewalls/gshield/v2/gShield-$pkgver.tgz gshield.init)
md5sums=('46521eb1ffef68d5a9c45727a99e2baa' '90570b33d11bf8b81afd5f75953b8926')

build() {
  cd $startdir/src/gShield-${pkgver}
  mkdir -p $startdir/pkg/etc/gshield
  cp -pPR * $startdir/pkg/etc/gshield

  # get rid of docs from config
  rm -rf $startdir/pkg/etc/gshield/{Changelog,INSTALL,LICENSE,docs}

  # move non config stuff out of config
  mkdir -p $startdir/pkg/usr/share/gshield/routables
  for q in gShield-version gShield.rc tools sourced routables/routable.rules
  do
      mv $startdir/pkg/etc/gshield/$q $startdir/pkg/usr/share/gshield/
  done
  chmod -R u+rwX $startdir/pkg/etc/gshield

  mkdir -p $startdir/pkg/etc/rc.d
  cp ../../gshield.init $startdir/pkg/etc/rc.d/gshield
  chmod 755 $startdir/pkg/etc/rc.d/gshield
}
