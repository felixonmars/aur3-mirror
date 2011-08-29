# Contributor: Trevor Turner <turn3r.tr3v0r@gmail.com>
pkgname=filezilla-faenza-dark
pkgver=0.1
pkgrel=1
realname=faenza-dark
url=http://tiheum.deviantart.com/art/Faenza-Icons-173323228
pkgdesc="Faenza-Dark icon theme for Filezilla."
arch=('i686' 'x86_64')
license=('GPL')
depends=(filezilla)
source=(faenza-dark.tar.xz)
sha1sums=('6a676c12910d0ca2cd2c9a55d954fce4df385f1e')

build() {
  mkdir -p $startdir/pkg/usr/share/filezilla/resources/$realname/
  # Installing icons
  cp -R $startdir/src/$realname $startdir/pkg/usr/share/filezilla/resources/
}
