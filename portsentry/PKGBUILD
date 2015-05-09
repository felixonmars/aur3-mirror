pkgname=portsentry
pkgver=1.2
pkgrel=8
pkgdesc="PortSentry runs as a daemon, listens to TPC/UDP ports and blocks scanning hosts from connecting to your machine."
url="http://sourceforge.net/projects/sentrytools/"
arch=('i686' 'x86_64')
license=('GPL')
groups=
provides=
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=(http://downloads.sourceforge.net/sentrytools/$pkgname-$pkgver.tar.gz portsentry portsentry.modes)
md5sums=('3ebd3618ba9abfea2525e236bd44cebd' '0aa474659dd106e97e6d7325df93fbb7' 'fd22cdc5bfc3572a923b445e67844b29')

package() {
  cd $startdir/src/portsentry_beta/
  #set configs
  sed -i -e 's/\/usr\/local\/psionic\/portsentry/\/etc\/portsentry/' portsentry_config.h portsentry.conf
  #patch portsentry.c
  sed -i -e 's/craigrowland at users dot/craigrowland at users dot\\/' portsentry.c
  make linux || return 1
  #perform manual instalation
  mkdir -p $startdir/pkg/usr/sbin
  mkdir -p $startdir/pkg/etc/portsentry
  chmod 700 $startdir/pkg/etc/portsentry


  install -m 600 portsentry.conf   $startdir/pkg/etc/portsentry/
  install -m 600 portsentry.ignore $startdir/pkg/etc/portsentry/
  install -m 600 $startdir/portsentry.modes $startdir/pkg/etc/portsentry/
  install -m 700 portsentry        $startdir/pkg/usr/sbin/

  #install init script
  mkdir -p $startdir/pkg/etc/rc.d
  install -m 700 $startdir/portsentry $startdir/pkg/etc/rc.d

}

