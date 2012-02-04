#Contributor: Miguel Aguilar <zodiac_es@yahoo.es>

pkgname=gnome-shell-extension-zodiac-icon-manager-git
pkgver=20110710
pkgrel=2
arch=(any)

depends=(gnome-shell-extensions-zodiac-common-git)
groups=('shell-extensions-zodiac-git')
url="http://github.com/zodiac66/shell-extensions-zodiac"
license=(GPL2)

makedepends=('intltool' 'gnome-doc-utils' 'git' 'gnome-common')

_gitroot="git://github.com/zodiac66/shell-extensions-zodiac"
_gitname="shell-extensions-zodiac"

install=shell-extensions-zodiac-git.install
options=(!libtool !emptydirs)

#PKGBUILD specific functions

_enabled_extensions="icon-manager"

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

    msg2 "Starting make for: ${pkgname}"

    if [[ -d ${srcdir}/${_gitname}-build ]]; then
       msg "Cleaning the previous build directory..."
       rm -rf ${srcdir}/${_gitname}-build
    fi

    git clone ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build

    cd ${srcdir}/${_gitname}-build

    msg "Starting configure..."
    ./autogen.sh --prefix=/usr --disable-schemas-compile --enable-extensions="${_enabled_extensions}"
    make
}

package () {
  pkgdesc="Add/remove icons from top bar panel by simple editing dconf settings"

  cd "${srcdir}/${_gitname}-build/extensions/icon-manager"
  make DESTDIR="$pkgdir" install
}

