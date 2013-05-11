# Maintainer: matthiaskrgr <matthias · krueger _strange_curved_character_ famsik · de
# address: run    echo "matthias · krueger _strange_curved_character_ famsik · de" | sed -e 's/\ _strange_curved_character_\ /@/' -e 's/\ ·\ /./g'

pkgname=pacmanlog2gource-git
pkgver() {
    cd pacmanlog2gource
    git describe --tags | sed -e 's/^pacmanlog2gource\-//' -e 's/-/./g'
}
pkgver=2.0.3
pkgrel=0
pkgdesc="A bash script to convert a copy of /var/log/pacman.log into a log file allowing later visualisation using gource - git version"
arch=('any')
url="https://github.com/matthiaskrgr/pacmanlog2gource"
license=('GPL')
depends=('gource' 'calc' 'ffmpeg')
conflicts=('pacmanlog2gource')
replaces=('pacmanlog2gource')
changelog=changelog
source=('pacmanlog2gource::git://github.com/matthiaskrgr/pacmanlog2gource.git'
		'changelog')
sha1sums=('SKIP'
          '4a05b15313dfae6564ca5f0ea1ee0c6f600e2f73')

package() {
  cd "$srcdir/pacmanlog2gource"
  install -D pacmanlog2gource.1 ${pkgdir}/usr/share/man/man1/pacmanlog2gource.1
  install -Dm 755 pacmanlog2gource.sh ${pkgdir}/usr/bin/pacmanlog2gource
}
