# Maintainer: Moritz Frenzel <arch@hackathon.de>

pkgname=vcsh-master
pkgver=1.20150502_1
pkgrel=1
pkgdesc='manage config files in HOME via fake bare git repositories(Master branch)'
arch=('any')
url='https://github.com/RichiH/vcsh'
license=('GPL')
depends=('git' 'perl-shell-command' 'perl-test-most')
optdepends=('myrepos: helps manage a large number of repositories')
source=("https://github.com/RichiH/vcsh/archive/v1.20150502-1.zip")
_src_dir="vcsh-1.20150502-1"
sha256sums=('a00250ad09aacdf5c340f5803e883af3b72a3f920366a52fe87d50d066406f7a')

check() {
    cd "$srcdir/$_src_dir"
    make -k test
}

package() {
    cd "$srcdir/$_src_dir"
    make DESTDIR="$pkgdir/" ZSHDIR='$(PREFIX)/share/zs/site-functions' install
}

