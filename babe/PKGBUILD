# Maintainer: Simone Esposito <webmaster[at]freebnc[dot]net>
pkgname=babe
pkgver=1
pkgrel=1
pkgdesc="Game: don't take it personally, babe, it just ain't your story"
url="http://scoutshonour.com/donttakeitpersonallybabeitjustaintyourstory/"
arch=('any')
license=('CC BY-NC-SA')
depends=('python')
source=("http://scoutshonour.com/donttakeitpersonallybabeitjustaintyourstory/don't%20take%20it%20personally,%20babe-${pkgver}.${pkgrel}-linux-x86.tar.bz2")
md5sums=('ffd57c51b7bfbc28170f0a4044b1cff1')
 
package() {
  cd "${srcdir}/don't take it personally, babe-${pkgver}.${pkgrel}-linux-x86"
  mkdir /var/games/babe
  mv * /var/games/babe/
  echo "bash \"/var/games/babe/don't take it personally, babe.sh\"" > /usr/bin/babe;
  chmod +x /usr/bin/babe
}