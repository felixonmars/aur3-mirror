# Maintainer: Dominik Heidler <dheidler@gmail.com>

pkgname=ols-git
_gitname=ols-git
pkgver=20140911
pkgrel=2
pkgdesc="A software client for the Open Bench Logic Sniffer logic analyser hardware."
arch=('x86_64' 'i686')
url="http://www.lxtreme.nl/ols/"
license=('GPL')
groups=()
provides=('ols')
conflicts=('ols')
depends=('java-runtime')
makedepends=('git' 'maven')
source=('ols' 'ols.desktop' 'ols.png' "$_gitname::git://github.com/jawi/ols.git#branch=ols_v0_9_7_1")
install=ols.install
md5sums=('74acd83f819dc1d2197bf8f45e86e58c'
         '4a6f1b6f4e8127e5bc7cfb68cbb9bbb4'
         'e22239705b9b8e6c29a5058ab863aa2b'
         'SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git log -1 --format="%cd" --date=short | tr -d '-'
}

build() {
  cd "$srcdir/$_gitname"
  mvn install -DskipTests=true -Dmaven.repo.local=$srcdir/m2
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p $pkgdir/opt
  cp -ax ols.distribution/target/ols-*/ols-*/ $pkgdir/opt/ols/
  cd "$srcdir"
  install -D -m755 ols "${pkgdir}/usr/bin/ols"
  install -D -m644 ols.desktop "${pkgdir}/usr/share/applications/ols.desktop"
  install -D -m644 ols.png "${pkgdir}/opt/ols/ols.png"
  # workaround to allow running application as non-root
  ln -s /tmp/ols "${pkgdir}/opt/ols/.fwcache"
}
