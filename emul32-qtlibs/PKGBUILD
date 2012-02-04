# Contributor: Enrico Morelli <morelli@cerm.unifi.it>
pkgname=emul32-qtlibs
pkgver=3.4.4
pkgrel=3
pkgdesc="Gentoo multilib QT 3"
arch=(i686)
url="http://www.gentoo.org"
license=('GPL')
groups=emul32
depends=('emul32-xlibs' 'emul32-baselibs')
install=(emul32.install)
source=(ftp://ftp.ibiblio.org/pub/linux/distributions/gentoo/distfiles/emul-linux-x86-qtlibs-immqt-${pkgver}.tar.bz2 '~emul32-qt.sh')
md5sums=('0184a38bd9a99985a8e652c760b193d4' 'f61a5a26544600636ee97871c0ba3337')

build() {
  cd $startdir/src
  rm *.tar.bz2
  mkdir -p $startdir/pkg/etc/profile.d
  # Beginning name with ~ to make sure we're last (we want to be after qt.sh)
  # Too bad there's no "10qt", "20gtk", etc. in our profile.d like in Gentoo.
  # But ~ is after all alphanumeric characters so we should be fine.
  mv ~emul32-qt.sh $startdir/pkg/etc/profile.d
  cp -RPf $startdir/src/* $startdir/pkg
}
