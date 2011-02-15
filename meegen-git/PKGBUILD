# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=meegen-git
pkgver=20110215
pkgrel=1
pkgdesc="Designer for custom Meegon avatars"
arch=('any')
url="http://forum.meego.com/showthread.php?t=1338"
license=('GPL')
depends=('gtk-sharp-2')
makedepends=('git')
provides=('meegen')
source=('MeeGen.sh')
md5sums=('a8ad80f4881250a0d817c6ffd730f1db')

_gitroot="git://github.com/physalis/MeeGen.git"
_gitname="MeeGen"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d $_gitname ]] ; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
}

package() {
  cd "$srcdir/$_gitname/Quickstart"

  install -d "${pkgdir}/usr/share/MeeGen"
  install -Dm755 MeeGen.exe "${pkgdir}/usr/share/MeeGen/"
  install -Dm644 meegen.conf \
      rsvg2-sharp.dll \
      rsvg2-sharp.dll.config \
      "${pkgdir}/usr/share/MeeGen/"

  tar xvf extracted.tar.gz -C "${pkgdir}/usr/share/MeeGen/"
  mono MeeGen.exe --create-db "${pkgdir}/usr/share/MeeGen/extracted/"

  sed -i 's|directory=".*$|directory="/usr/share/MeeGen/extracted/">|' ComponentDB.xml
  install -Dm644 ComponentDB.xml "${pkgdir}/usr/share/MeeGen"

  install -Dm755 "${srcdir}/MeeGen.sh" "${pkgdir}/usr/bin/meegen"
}
