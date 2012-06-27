# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=cleanlooks-phenix-gtk-theme-git
pkgver=20120627
pkgrel=1
pkgdesc="GTK3 theme visually close to Clearlooks"
arch=('i686' 'x86_64')
url="http://www.jpfleury.net"
license=('GPL')
depends=('gtk-engines' 'gnome-themes-standard' 'gtk-engine-unico')
provides=('cleanlooks-phenix-gtk-theme')
conflicts=('cleanlooks-phenix-gtk-theme')
makedepends=('git')

_gitroot="git://jpfleury.indefero.net/jpfleury/clearlooks-phenix.git"
_gitname="clearlooks-phenix"

build() {
  cd ${srcdir}

  msg "Connecting to GIT server...."
  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}/${_gitname}-build"
  git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"

  cd ${srcdir}/${_gitname}-build

  rm -rf .git/

  for FILE in $(find doc/ -type f); do
	  install -D -m644 ${FILE} ${pkgdir}/usr/share/docs/${pkgname}/${FILE}
  done
  rm -rf doc/

  for FILE in $(find -type f); do
	  install -D -m644 ${FILE} ${pkgdir}/usr/share/themes/${pkgname}/${FILE}
  done
}
