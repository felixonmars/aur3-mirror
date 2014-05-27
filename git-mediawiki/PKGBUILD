pkgname=git-mediawiki
pkgver=1.9.3
pkgrel=1
pkgdesc="Gateway between Git and Media Wiki"
arch=(any)
url="https://github.com/moy/Git-Mediawiki/wiki"
license=(GPL2)
depends=(perl-mediawiki-api perl-datetime-format-iso8601 git perl-libwww)
optdepends=("perl-lwp-protocol-https: HTTPS wikis")
makedepends=(git)
source=("https://www.kernel.org/pub/software/scm/git/git-$pkgver.tar.xz"
)

package() {
    local DIR="$(git --exec-path)"
    install -d "$pkgdir$DIR"
    
    cd "$srcdir/git-$pkgver/contrib/mw-to-git"
    make install DESTDIR="$pkgdir" gitexecdir="$DIR" prefix=/usr
}

md5sums=('560200d1db05a2dd2b8a2b3718655463'
)
