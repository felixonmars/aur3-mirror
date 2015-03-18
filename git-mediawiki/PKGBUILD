pkgname=git-mediawiki
pkgver=2.3.3
pkgrel=1
pkgdesc="Gateway between Git and Media Wiki"
arch=(any)
url="https://github.com/moy/Git-Mediawiki/wiki"
license=(GPL2)
depends=(perl-mediawiki-api perl-datetime-format-iso8601 git perl-libwww)
optdepends=(
    "perl-lwp-protocol-https: HTTPS wikis"
    "perl-html-tree: git mw preview"
)
makedepends=(git)
source=("https://www.kernel.org/pub/software/scm/git/git-$pkgver.tar.xz"
)
md5sums=('14a885da3b432455b606cc1a25a6c681'
)

prepare() {
  cd "$srcdir/git-$pkgver"
}

package() {
    local DIR="$(git --exec-path)"
    install -d "$pkgdir$DIR"
    
    cd "$srcdir/git-$pkgver/contrib/mw-to-git"
    make prefix=/usr
    make install DESTDIR="$pkgdir" gitexecdir="$DIR"
}
