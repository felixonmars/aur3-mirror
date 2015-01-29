# Maintainer: Thiago Perrotta <echo dGhpYWdvcGVycm90dGE5NUBnbWFpbC5jb20K | base64 -d >

_gitname=i3lock-fancy
pkgname="${_gitname}-git"
pkgrel=1
pkgver=2014.12.27.g0ba1e44
pkgdesc='i3lock which blurs the desktop background and adds a lock icon and text to it'
arch=('any')
url="https://github.com/meskarune/${_gitname}"
license=('MIT')
groups=('i3')
depends=('i3lock-color-git' 'scrot' 'imagemagick' 'ttf-liberation')
makedepends=('git')
source=("git+https://github.com/meskarune/${_gitname}"
	"${_gitname}-wrapper")
md5sums=('SKIP'
         'd070a68d759ab9581e61142e64ab0eda')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

package() {
  cd "${srcdir}/${_gitname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$_gitname/LICENSE"
  install -Dm755 lock "${pkgdir}/usr/share/${_gitname}/lock"
  install -Dm644 lock.png "${pkgdir}/usr/share/${_gitname}/lock.png"
  install -Dm755 "${srcdir}/${_gitname}-wrapper" "${pkgdir}/usr/bin/${_gitname}"
}
