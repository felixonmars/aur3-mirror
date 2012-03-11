# Maintainer: akm74 akulikov@mail.ua

pkgname=cinnamon-window_icon_list-git
pkgver=20120311
pkgrel=1
pkgdesc="Iconized Window List for Cinnamon, like in Windows 7"
arch=('any')
url="https://github.com/jake-phy/WindowIconList"
license=('GPL')
depends=('cinnamon')
makedepends=('git' 'intltool' 'gnome-common')
options=('!libtool' '!emptydirs')

_gitroot='https://github.com/jake-phy/WindowIconList.git'
_gitname='WindowIconList'

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
  mv README ./WindowIconList@jake.phy@gmail.com
  mv CREDITS ./WindowIconList@jake.phy@gmail.com
  
  msg "Deleting temp files..."
  find -iname '*~' | xargs rm -f
}

package() {
	
	cd ${srcdir}
	cd ${_gitname}
	
	install -dm755 "${pkgdir}/usr/share/cinnamon/applets/"
	
	cp -r $(ls) "${pkgdir}/usr/share/cinnamon/applets/"

}
