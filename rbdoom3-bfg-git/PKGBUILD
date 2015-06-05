# Maintainer: M0Rf30

pkgname=rbdoom3-bfg-git
pkgver=461.a7c6f49
pkgrel=1
pkgdesc="Doom 3 BFG source code (Robert Beckebans repo)."
arch=(i686 x86_64)
url="https://github.com/RobertBeckebans/RBDOOM-3-BFG"
license=('GPL3')
groups=(games)
depends=(alsa-lib doom3bfg-data ffmpeg glu libgl libstdc++5 libxxf86vm openal sdl)
makedepends=('git' 'cmake' 'zip')
optdepends=('alsa-plugins: pulseaudio-support'
	    'libpulse: pulseaudio support')

install=rbdoom3-bfg-git.install
source=('rbdoom3-bfg::git://github.com/RobertBeckebans/RBDOOM-3-BFG.git'
	'rbdoom3.desktop' 
	'rbdoom3.png')

build() {
 msg "Starting configure & make..."
  cd rbdoom3-bfg/neo/
  cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=RelWithDebInfo \
	-DCMAKE_INSTALL_PREFIX=/usr -DOPENAL=1 -DSDL2=ON\
	-DUSE_SYSTEM_LIBGLEW=1 -DUSE_SYSTEM_LIBJPEG=1 \
	-DUSE_SYSTEM_ZLIB=1 ../neo
  make
}

package() {
  cd rbdoom3-bfg/neo
  install -Dm755 RBDoom3BFG $pkgdir/usr/bin/RBDoom3BFG
  install -Dm644 $srcdir/rbdoom3.png $pkgdir/usr/share/pixmaps/rbdoom3.png
  install -Dm644 $srcdir/rbdoom3.desktop $pkgdir/usr/share/applications/rbdoom3.desktop
}

pkgver() {
  cd rbdoom3-bfg
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP'
         '4dfb2229e95be564da9f3ace72d96acb'
         'aad66f68d95f9f40eb6ebe71c89f6bab')
