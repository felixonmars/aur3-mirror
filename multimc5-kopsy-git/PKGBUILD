# Maintainer: kopsy69@net.hr

pkgname=multimc5-kopsy-git
pkgver=666001
pkgrel=1
pkgdesc="Minecraft launcher with ability to manage multiple instances. Plus patch for costume clients and nonpremium accounts."
arch=('i686' 'x86_64')
url="http://multimc.org/"
license=('Apache')
depends=('qt5-base' 'qt5-x11extras' 'jre7-openjdk')
makedepends=('git' 'cmake' 'qt5-tools' 'qt5-x11extras' 'jdk7-openjdk')
source=('multimc5.sh' 'multimc5.desktop')
sha512sums=('450bde6dbd804361270ffb922ba02be34a2f29e2e7b118e24938b5defbe6169111c9510f6d894a21bfb7de263a57522541ea393c6453e621f1abe2ea29da2052' 'a8751c7da8c81e6e438e554c0ee8ed7b7e2322a519f7c6d2ce804797a78fc2de8f806ea4a5f37b25e3bfb414b6708b30872a59a05dca391b2295e4aadf4041cb')

giturl=https://github.com/kopsy/MultiMC5
gitreponame=MultiMC5

build() {
  msg "Remove old git repo.."
  rm -rf "$srcdir/$gitreponame"
  
  msg "Clone git repo..."
  cd "$srcdir"
  git clone "$giturl"
  cd "$gitreponame"
  git checkout kopsy-release
  
  msg "Start build process"
  mkdir build
  cd build
  cmake $srcdir/$gitreponame
  make
}

package() {
 cd "$srcdir/$gitreponame/build"
 install -D MultiMC $pkgdir/usr/lib/multimc5-kopsy/MultiMC5-kopsy
 install -D $srcdir/multimc5.sh $pkgdir/usr/bin/multimc5-kopsy
 install -D $srcdir/$gitreponame/resources/icons/multimc.svg $pkgdir/usr/share/pixmaps/multimc5-kopsy.svg
 install -D $srcdir/multimc5.desktop $pkgdir/usr/share/applications/multimc5-kopsy.desktop
}
