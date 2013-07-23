# Maintainer: Krzysztof Wloch <wloszekk [at] gmail [dot] com>
# Contributor: Christophe LAVIE <christophe.lavie@laposte.net>

pkgname=wiibafu-git
pkgver=2.0
pkgrel=1
pkgdesc="The complete and simple to use backup solution for your Wii games"
arch=('i686' 'x86_64')
if [ "${CARCH}" = "x86_64" ]; then
  depends=('qt5-base' 'gcc-libs-multilib' 'wit>=2.2')  
else
  depends=('qt5-base' 'wit>=2.2')  
fi 
url="http://sourceforge.net/projects/wiibafu/"
license=('GPL3')
makedepends=('git')
provides=()
conflicts=('wiibafu-hg')
replaces=('wiibafu-hg')
install=

__gitrepo=wiibafu-code
source=("$__gitrepo::git+http://git.code.sf.net/p/wiibafu/code")
noextract=()


build() {
  cd "$srcdir/$__gitrepo"
  qmake-qt5
  make
}

package() {
  cd "$srcdir/$__gitrepo"
  mkdir -p $pkgdir/usr/bin
  install -m 755 bin/WiiBaFu $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/applications
  install -Dm644 "$srcdir/$__gitrepo/resources/WiiBaFu.desktop" "$pkgdir/usr/share/applications/WiiBaFu.desktop"
  mkdir -p $pkgdir/usr/share/icons
  install -Dm644 "$srcdir/$__gitrepo/resources/images/appicon.png" "$pkgdir/usr/share/icons/WiiBaFu.png"
}

md5sums=('SKIP')
