# Contributor: Jordy van Wolferen <jordz . archlinux.us>

pkgname=mkvdts2ac3-git
_gitname="mkvdts2ac3"
pkgver=1.6.0.13.g2ce71f4
pkgrel=2
pkgdesc="Bash script to convert DTS audio to AC3 within a matroska file"
url="http://github.com/JakeWharton/mkvdts2ac3"
arch=('i686' 'x86_64')
license=('apache')
depends=('mkvtoolnix' 'ffmpeg' 'rsync')
makedepends=('git')
source=('git://github.com/JakeWharton/mkvdts2ac3')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

package() {
  cd $_gitname
  install -Dm755 mkvdts2ac3.sh ${pkgdir}/usr/bin/mkvdts2ac3
}
