# Maintainer: Rene Schoebel (wesley) <schoebel.r at gmail dot com>

pkgname=jedioutcastlinux-git
_gitname=JediOutcastLinux
pkgver=169addd
pkgrel=1
pkgdesc="Singleplayer Jedi Knight II: Jedi Outcast. needs original media files."
arch=('i686' 'x86_64')
url="https://github.com/xLAva/JediOutcastLinux"
license=('GPL2')
depends=('openal' 'libxxf86vm' 'libxrandr' 'libgl')
[ "$CARCH" == "x86_64" ] && depends=('lib32-openal' 'lib32-libxxf86vm' 'lib32-libxrandr' 'lib32-libgl')
makedepends=('git' 'cmake')
[ "$CARCH" == "x86_64" ] && makedepends+=('gcc-multilib')
conflicts=('jedioutcastlinux')
provides=('jedioutcastlinux')
install=$pkgname.install
#source=('git+https://github.com/xLAva/JediOutcastLinux.git'
source=('git://github.com/xLAva/JediOutcastLinux.git'
        'jedioutcastlinux.png'
	'jedioutcastlinux.desktop'
	'jedioutcastlinux.sh'
	'jedioutcastlinux-git.install')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP'
         'f26b9520d5eb70de380717044d03abd7'
	 '7c0597077c36493f622972bbbe973a27'
	 '8bb530922e875f82dc97371294c44baf'
	 '84d72d788f2a6248934e4cf0642df080')

pkgver() {
  cd $_gitname

  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname

  cmake .
  make
}

package() {
  cd $_gitname

  install -Dm755 "$srcdir/$_gitname/jk2sp" "$pkgdir/opt/jedioutcastlinux/jk2sp"
  install -Dm755 "$srcdir/$_gitname/jk2gamex86.so" "$pkgdir/opt/jedioutcastlinux/jk2gamex86.so"

  install -Dm755 "$srcdir/jedioutcastlinux.sh" "$pkgdir/usr/bin/jedioutcastlinux"
  install -Dm755 "$srcdir/jedioutcastlinux.desktop" "$pkgdir/usr/share/applications/jedioutcastlinux.desktop"
  install -Dm644 "$srcdir/jedioutcastlinux.png" "$pkgdir/usr/share/pixmaps/jedioutcastlinux.png"
}
