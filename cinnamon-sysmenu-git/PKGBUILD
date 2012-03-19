# Maintainer: akm74 akulikov@mail.ua

pkgname=cinnamon-sysmenu-git
pkgver=20120319
pkgrel=1
pkgdesc="SysMenu for Cinnamon, like in Ubuntu"
arch=('any')
url="https://github.com/angel-kulikov/sysmenu-applet"
license=('GPL')
depends=('cinnamon')
makedepends=('git' 'intltool' 'gnome-common')
options=('!libtool' '!emptydirs')

_gitroot='https://github.com/angel-kulikov/sysmenu-applet.git'
_gitname='sysmenu-applet'

build() {
  cd "${srcdir}"
  rm -rf $(ls)
  msg "Connecting to GIT server...."

  if [[ -d "${_gitname}" ]]; then
    cd "${_gitname}" && git pull origin
    msg "The local files are updated."
  else
    git clone "${_gitroot}" "${_gitname}"
  fi

  msg "GIT checkout done or server timeout"
  
  cd "${_gitname}"
  msg "Moving files..."
  mv README ./sysmenu@tuxuls@gmail.com
  
  msg "Deleting temp files..."
  find -iname '*~' | xargs rm -f
}

package() {
	
	cd ${srcdir}
	cd ${_gitname}
	
	install -dm755 "${pkgdir}/usr/share/cinnamon/applets/"
	
	cp -r $(ls) "${pkgdir}/usr/share/cinnamon/applets/"

}
