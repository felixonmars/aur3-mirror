# Maintained by ivo <ivkuzev@gmail.com>
pkgname=zsh-completion-ratpoison
pkgver=20121028
pkgrel=2
pkgdesc="Zsh completion for Ratpoison Windows manager"
url="https://github.com/ivoarch/zsh-completion-ratpoison.git"
arch=('any')
license=('GPL-2')
depends=('zsh')
makedepends=('git')
md5sums=('')

_gitroot="git://github.com/ivoarch/zsh-completion-ratpoison.git"
_gitname="zsh-completion-ratpoison"

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
	  cd $_gitname && git pull origin
	  msg "The local files are updated."
    else
	  git clone --depth=1 $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"
}

package() {
    cd "${srcdir}/${_gitname}"
    mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
    cp -R ./ "${pkgdir}/usr/share/zsh/site-functions"
}
