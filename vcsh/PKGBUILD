# Maintainer: Evan Pitstick <nerdx00 at gmail dot com>
# Contributor: Chet Gray <chetgray@gmail.com>
# Contributor: joni <kljohann@gmail.com>
# Contributor: Dieter Plaetinck <dieter@plaetinck.be>

pkgname=vcsh
pkgver=1.20141026
pkgrel=1
pkgdesc='manage config files in HOME via fake bare git repositories'
arch=('any')
url='https://github.com/RichiH/vcsh'
license=('GPL')
depends=('git')
optdepends=('myrepos: helps manage a large number of repositories')
source=("https://github.com/RichiH/vcsh/archive/v${pkgver}-manpage-static.zip")
_src_dir="vcsh-${pkgver}-manpage-static"
sha256sums=('9d57bc84a780437a816955a7711ac02d23634ea5a673fdc3018b5aa90f3dd706')

check() {
  cd "$srcdir/$_src_dir"
  make -k test
}

package() {
  cd "$srcdir/$_src_dir"
  make DESTDIR="$pkgdir/" ZSHDIR='$(PREFIX)/share/zsh/site-functions' install
}

# vim:set ts=2 sw=2 et:
