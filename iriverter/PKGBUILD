# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=iriverter
pkgver=0.16
pkgrel=5
pkgdesc="Cross-platform mencoder frontend to convert videos for various multimedia players."
arch=('i686' 'x86_64')
url="http://iriverter.sourceforge.net/"
license=('GPL')
depends=('mplayer' 'java-runtime' 'swt')
makedepends=('fastjar')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2)

md5sums=('43b3e046479f4273851e6a450b6b28bf')

build() {
#in case not finding javac in $PATH, uncomment following line:
#export PATH=$PATH:/opt/java/bin || return 1

  cd "${srcdir}/$pkgname-$pkgver"

  ./configure --prefix=/usr --with-swt=/usr/share/java/swt.jar
  sed -i 's|${exec_prefix}/lib|${exec_prefix}/lib:/usr/share/java|' src/launcher/iriverter || return 1

  make || return 1
  make DESTDIR="${pkgdir}" install
}
