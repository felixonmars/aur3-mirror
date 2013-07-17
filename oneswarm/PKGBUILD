# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: The Green Arrow <revan@no-log.org>

pkgname=oneswarm
pkgver=0.7.5.2
pkgrel=1
pkgdesc="OneSwarm is a new peer-to-peer tool that provides users with explicit control over their privacy by letting them determine how data is shared."
url="http://oneswarm.org/"
license=('GPLv2')
arch=('i686' 'x86_64')
depends=('java-runtime')
options=(strip !docs)
install=${pkgname}.install



if [ "$CARCH" == "x86_64" ]; then
	myarch="x86_64"
	md5sums=('0af4efd9049d325ddb47f3df5f6343b9' '0e948133ccb6d4448d740940cf536ad4' '0e80f69aba114d5aa945e90c96a0d95e')
else
	myarch="x86"
	md5sums=('8b5d0fcc3ab2cea22cf983150e67c310' '0e948133ccb6d4448d740940cf536ad4' '0e80f69aba114d5aa945e90c96a0d95e')
fi



source=(http://www.oneswarm.org/builds/OneSwarm_linux_${myarch}.tar.gz \
	 oneswarm.jpg oneswarm.desktop)

package() {
  cd $srcdir
  mkdir $pkgdir/opt
  mv OneSwarm $pkgdir/opt/
  install -Dm644 oneswarm.jpg $pkgdir/usr/share/pixmaps/oneswarm.jpg
  install -Dm644 oneswarm.desktop $pkgdir/usr/share/applications/oneswarm.desktop
}

# vim:set ts=2 sw=2 et:
