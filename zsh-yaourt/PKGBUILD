# Contributor: Jakub Ruzicka <yaccobb@centrum.cz>
# Contributor: Javier `Phrodo_00' Aravena <phrodo.00@gmail.com>

pkgname=zsh-yaourt
pkgver=20110503
_laststablerev=497acb78fe6b
pkgrel=1
pkgdesc="ZSH functions to tab-complete repo package names for yaourt"
url="http://bitbucket.org/Phrodo_00/zsh-yaourt"
depends=(zsh)
source=("https://bitbucket.org/Phrodo_00/${pkgname}/get/${_laststablerev}.tar.gz")
arch=('i686' 'x86_64')
license=('GPL')
md5sums=('ac80ec05fa12e53fc8c58e5178609a6b')

package() {
    cd ${srcdir}/Phrodo_00-${pkgname}-${_laststablerev}
    install -D -m644 _yaourt $startdir/pkg/usr/share/zsh/site-functions/_yaourt
}
