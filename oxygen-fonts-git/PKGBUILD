#Maintainer: Adria Arrufat <swiftscythe@gmail.com>
pkgname=oxygen-fonts-git
pkgver=20120105
pkgrel=1
pkgdesc="The Oxygen font family. A desktop/gui font family for integrated use with the KDE desktop."
arch=('any')
url="http://quickgit.kde.org/?p=oxygen-fonts.git&a=summary"
license=('custom')
depends=('fontconfig')
install=oxygen-fonts.install
makedepends=('git')
provides=('oxygen-fonts')
source=()
md5sums=()
_realname=oxygen-fonts
_gitroot="git://anongit.kde.org/${_realname}"
_gitname=${_realname}
 
build() {
  cd ${srcdir}

  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ]; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
}

package() {
  cd ${srcdir}/${_realname}
	install -d $pkgdir/usr/share/fonts/
  cp -R * $pkgdir/usr/share/fonts/
}
