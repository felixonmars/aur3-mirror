# Contributor: John Schug <xtr.xtrnet@gmail.com>
pkgname=exaile-plugin-g15track
pkgver=0.0.2
pkgrel=1
pkgdesc="Displays information via the G15 LCD about a song when its playback starts in Exaile."
arch=('any')
url="http://ubuntuforums.org/showthread.php?t=607407"
license=('GPL')
groups=()
depends=('exaile>=0.3.0.0' 'g15composer')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=.INSTALL
source=($pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('7f8fa498d97299ae9bcbe910f74deea0') #generate with 'makepkg -g'

build() {
  cd "$srcdir/"
  mkdir -p "$pkgdir/usr/share/exaile/plugins/g15track"
  cp -R g15track "$pkgdir/usr/share/exaile/plugins"
}

# vim:set ts=2 sw=2 et:
