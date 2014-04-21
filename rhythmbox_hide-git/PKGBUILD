# Maintainer: peace4all <markspost at rocketmail dot com>

pkgname=rhythmbox_hide-git
_gitname="rhythmbox_hide"
pkgver=efa3451
pkgrel=1
pkgdesc="enabled rhythmbox to start either hidden or minimized"
url="https://github.com/fossfreedom/rhythmbox_hide"
arch=('i686' 'x86_64')
license=('GPLv2')
makedepends=('git')
depends=('rhythmbox>=2.9')
source=("$_gitname::git+https://github.com/fossfreedom/rhythmbox_hide.git")
install=$pkgname.install
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --always | sed 's|-|.|g'
}


package() {
  cd "${srcdir}/$_gitname"
  mkdir -p "$pkgdir/usr/lib/rhythmbox/plugins/$_gitname"
  mv $_gitname.plugin3 $_gitname.plugin
  cp -r {*.py,*.plugin,*.md,*.txt} "$pkgdir/usr/lib/rhythmbox/plugins/$_gitname/"
  mkdir -p "$pkgdir/usr/share/rhythmbox/plugins/$_gitname"
  cp -r *.ui "$pkgdir/usr/share/rhythmbox/plugins/$_gitname/"
  mkdir -p "$pkgdir/usr/share/glib-2.0/schemas/"
  cp -r ${srcdir}/$_gitname/schema/*.gschema.xml "$pkgdir/usr/share/glib-2.0/schemas/"
}
