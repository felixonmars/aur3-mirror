# Maintainer: Thiago Perrotta <echo dGhpYWdvcGVycm90dGE5NUBnbWFpbC5jb20K | base64 -d >

pkgname=gabs-git
_gitname=gabs
pkgver=2013.07.13.ge064f59
pkgrel=1
pkgdesc='Like community/abs, but fetches packages from the official git tree'
arch=('any')
url="http://git.kaictl.net/wgiokas/${_gitname}.git"
license=('custom:none')
depends=('bash')
makedepends=('git')
source=("git://git.kaictl.net/wgiokas/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

package() {
  cd "${srcdir}/${_gitname}"
  install -Dm755 "${_gitname}" "${pkgdir}/usr/bin/${_gitname}"
}
