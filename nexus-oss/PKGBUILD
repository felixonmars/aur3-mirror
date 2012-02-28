# Maintainer: Illarion Kovalchuk <illarion.kovalchuk@gmail.com>
# Author: Yahya Mohajer <yaya_2013 at yahoo.com>
pkgname=nexus-oss
pkgver=2.0
pkgrel=2
epoch=
pkgdesc="Maven repository manager"
arch=(any)
url="http://www.sonatype.org/nexus"
license=('EPL')
groups=()
depends=('java-environment')
makedepends=()
checkdepends=()
optdepends=('maven')
provides=('java-nexus' 'nexus2' 'nexus-oss')
conflicts=()
replaces=('nexus-oss' 'nexus-pro')
backup=()
options=(!strip !docs)
install='nexus.install'
changelog=
source=(http://www.sonatype.org/downloads/nexus-$pkgver-bundle.tar.gz
        nexus
        nexus.sh)
noextract=(nexus-$pkgver-bundle.tar.gz)
md5sums=('e63dc8a99d75d2afdcbf51d86ba74745'
         'ddc5532d79d82d4e533b3882e3042c0d'
         'c146e43506bf287b404b2f0951780847')

package() {
  pushd .
  mkdir -p $pkgdir/opt/
  cd $pkgdir/opt/
  tar xvzf $srcdir/nexus-$pkgver-bundle.tar.gz
  ln -s nexus-$pkgver nexus 
  popd
  install -D -m 755 nexus $pkgdir/opt/nexus/bin/nexus
  install -D -m 755 nexus.sh $pkgdir/etc/profile.d/nexus.sh
}

# vim:set ts=2 sw=2 et:
