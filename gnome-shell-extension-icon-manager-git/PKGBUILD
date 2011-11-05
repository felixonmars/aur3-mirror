#Contributor: Artiom MOLCHANOV <ar.molchanov@gmail.com>

pkgname=gnome-shell-extension-icon-manager-git
pkgver=20111105
pkgrel=1
arch=(any)

depends=(gnome-shell)
url="https://github.com/MrTheodor/gnome-shell-ext-icon-manager"
license=(GPL2)

makedepends=('intltool' 'gnome-doc-utils' 'git' 'gnome-common')

_gitroot="git://github.com/MrTheodor/gnome-shell-ext-icon-manager.git"
_gitname="gnome-shell-ext-icon-manager"

install=shell-extension-icon-manager-git.install
options=(!libtool !emptydirs)

#PKGBUILD specific functions

_enabled_extensions="Icon Manager"

build() {

    cd ${srcdir}/

    msg "Connecting to the GIT server..."
    if [[ -d ${srcdir}/${_gitname} ]] ; then
    	cd ${_gitname}
    	git pull origin
    	msg "The local files are updated..."
    else
    	git clone ${_gitroot} ${_gitname}
    fi

    msg "GIT checkout done."

}
package () {
  pkgdesc="Add/remove icons from top bar panel by simple editing dconf settings"
  cd ${srcdir}/${_gitname}
  mkdir -p ${pkgdir}/usr/share/glib-2.0/schemas/
  mkdir -p ${pkgdir}/usr/share/gnome-shell/extensions/
  cp org.gnome.shell.extensions.icon-manager.gschema.xml ${pkgdir}/usr/share/glib-2.0/schemas/
  cp -r icon-manager@krajniak.info ${pkgdir}/usr/share/gnome-shell/extensions/
  
}

