# Contributor: Joao Cordeiro <jlcordeiro at gmail dot com>
pkgname=brainparty-trunk
pkgver=0.61
pkgrel=1
pkgdesc="Brain Party is a puzzle game made up of 36 minigames designed to push your brain to its limits by testing memory, logic, mathematics, reaction time and more"
arch=('i686' 'x86_64')
url="http://www.tuxradar.com/brainparty"
license=('GPL3')
depends=(sdl_gfx sdl_ttf sdl_mixer sdl_image)
source=(http://launchpad.net/brainparty/trunk/0.61/+download/brainparty0.61.tar.gz
        brainparty.sh)
md5sums=('d6bcdf6261697d206dbbda3362632002'
         'cde30caf4a27e0776d710d5387149e7c')

build() {

  cd "$srcdir/brainparty"
 
  make || return 1
 
  mkdir -p "$pkgdir/usr/local/games/brainparty-trunk/Content" || return 1
  install -D -m 644 Content/* "$pkgdir/usr/local/games/brainparty-trunk/Content/"
  install -D -m 755 brainparty "$pkgdir/usr/local/games/brainparty-trunk/"
 
  install -T -D -m 755 "$srcdir/brainparty.sh" "$pkgdir/usr/bin/brainparty-trunk"
}

# vim:set ts=2 sw=2 et:
