# Maintainer: matthiaskrgr <matthias · krueger _strange_curved_character_ famsik · de
# address: run    echo "matthias · krueger _strange_curved_character_ famsik · de" | sed -e 's/\ _strange_curved_character_\ /@/' -e 's/\ ·\ /./g'

pkgname=pacmanlog2gource
pkgver=2.0.3
pkgrel=1
pkgdesc="A bash script to convert a copy of /var/log/pacman.log into a log file allowing later visualisation using gource."
arch=('any')
url="https://github.com/matthiaskrgr/pacmanlog2gource"
license=('GPL')
depends=('gource' 'calc' 'ffmpeg')
conflicts=('pacmanlog2gource-git')
replaces=('pacmanlog2gource-git')
changelog=changelog
source=(pacmanlog2gource-$pkgver.zip::https://github.com/matthiaskrgr/pacmanlog2gource/zipball/$pkgver
        changelog)
sha1sums=('61dcbe5881a9464fb2c8702e30e9bfba4a6afd41'
          '4b4c4c8dd5b82849216e44f6096f58475812469f')

package() {
  cd "$srcdir/matthiaskrgr-pacmanlog2gource-91472e8"
  install -D pacmanlog2gource.1 ${pkgdir}/usr/share/man/man1/pacmanlog2gource.1
  install -Dm 755 pacmanlog2gource.sh ${pkgdir}/usr/bin/pacmanlog2gource
}
