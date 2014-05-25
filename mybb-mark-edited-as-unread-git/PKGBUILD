# Maintainer: Stefan Tatschner <stefan@sevenbyte.org>

pkgname=mybb-mark-edited-as-unread-git
_pkgname=MyBB-Mark_Edited_as_Unread
pkgver=r3.856475b
pkgrel=1
pkgdesc="Mark Edited as Unread plugin for MyBB"
install=mybb-mark-edited-as-unread.install
arch=('any')
url=('https://github.com/lukasamd/MyBB-Mark_Edited_as_Unread')
license=('GPL')
depends=('mybb' 'mybb-pluginlibrary')
source=("${_pkgname}::git+https://github.com/lukasamd/MyBB-Mark_Edited_as_Unread.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p ${pkgdir}/usr/share/webapps/mybb/
  
  cp -ra ${srcdir}/${_pkgname}/root/inc ${pkgdir}/usr/share/webapps/mybb/
}
