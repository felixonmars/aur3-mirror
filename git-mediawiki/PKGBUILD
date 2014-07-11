pkgname=git-mediawiki
pkgver=2.0.1
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

package() {
    local DIR="$(git --exec-path)"
    install -d "$pkgdir$DIR"
    
    cd "$srcdir/git-$pkgver/contrib/mw-to-git"
    make install DESTDIR="$pkgdir" gitexecdir="$DIR" prefix=/usr
}

md5sums=('6d28a5d112379c20c7f7df9e0ffb070c'
)
