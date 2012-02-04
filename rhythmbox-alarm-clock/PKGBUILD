# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Mathias Nedrebø <mathias@arch>
pkgname=rhythmbox-alarm-clock  
pkgver=0
pkgrel=7
pkgdesc="Alarm clock plugin for Rhythmbox"
url="http://www.nedrebo.org/code/rhythmbox/alarm_clock/"
arch=(i686 x86_64 ppc)
license=('GPL')
depends=('rhythmbox')
makedepends=('')
source=('http://folk.ntnu.no/nedrebo/rhythmbox-alarm-clock.tar.gz')
md5sums=()

build() {
  cd $startdir/src
  mkdir -p $startdir/pkg/usr/lib/rhythmbox/plugins/alarm-clock
  install -m 644 alarm-clock/* $startdir/pkg/usr/lib/rhythmbox/plugins/alarm-clock
}
