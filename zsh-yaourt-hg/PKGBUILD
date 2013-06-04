# Maintainer: Daniil Bolsun <dan dot bolsun at gmail dot com>
# Contributor: Jakub Ruzicka <yaccobb at centrum dot cz>
# Contributor: Javier `Phrodo_00' Aravena <phrodo dot 00 at gmail dot com>

pkgname=zsh-yaourt-hg
pkgver=2.497acb78fe6b
pkgrel=1
pkgdesc="ZSH functions to tab-complete repo package names for yaourt. Updates are fetching directly from bitbucket"
arch=('any')
url="https://bitbucket.org/Phrodo_00/zsh-yaourt"
license=('GPL')
makedepends=('mercurial' 'pacman>=4.1')
depends=()
conflicts=('zsh-yaourt')
source=('hg+https://bitbucket.org/Phrodo_00/zsh-yaourt')
md5sums=('SKIP')

_hgname='zsh-yaourt'

pkgver() {
	cd $_hgname
	echo $(hg identify -n).$(hg identify -i)
}

build() {
	cd $_hgname
}

package() {
	cd $_hgname
	install -m644 -D _yaourt $pkgdir/usr/share/zsh/site-functions/_yaourt
}

# vim:ft=sh
