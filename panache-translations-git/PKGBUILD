# Contributor: feufochmar <feufochmar@d-20.fr>
pkgname=panache-translations-git
pkgver=20100212
pkgrel=1
pkgdesc="Translations for the Panache Desktop Environment"
arch=('i686' 'x86_64')
url="http://www.logram-project.org/"
license=('GPL')
depends=('panache-lbase-git')
makedepends=('git')
provides=()
source=()
md5sums=()

_gitroot="git://gitorious.org/logram/desktop.git"
_gitname="desktop"

build() {
  cd $srcdir
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd $_gitname

  #
  # BUILD HERE
  #
  cd translations
  ./update
  #./release # broken
  for file in *.ts
  do
    lrelease $file
  done
  install -d -m755 $pkgdir/usr/share/logram/translations
  #install -m644 releases/*.qm $pkgdir/usr/share/logram/translations #broken
  install -m644 *.qm $pkgdir/usr/share/logram/translations
}
