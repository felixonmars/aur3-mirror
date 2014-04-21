pkgname=git-mediawiki
pkgver=1.9.2
pkgrel=1
pkgdesc="Gateway between Git and Media Wiki"
arch=(any)
url="https://github.com/moy/Git-Mediawiki/wiki"
license=(GPL2)
depends=(perl-mediawiki-api perl-datetime-format-iso8601 git)
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

md5sums=('437c32078b5b5b229f1c10f6474eae78'
)
