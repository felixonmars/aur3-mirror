pkgname=git-mediawiki
pkgver=1.8.3.4
pkgrel=1
pkgdesc="Gateway between Git and Media Wiki"
arch=(any)
url="https://github.com/moy/Git-Mediawiki/wiki"
license=(GPL2)
depends=(perl-mediawiki-api perl-datetime-format-iso8601 git)
optdepends=("perl-lwp-protocol-https: HTTPS wikis")
makedepends=(git)
source=("http://git-core.googlecode.com/files/git-$pkgver.tar.gz"
)

package() {
    local DIR="$(git --exec-path)"
    install -d "$pkgdir$DIR"
    
    cd "$srcdir/git-$pkgver/contrib/mw-to-git"
    make install DESTDIR="$pkgdir" gitexecdir="$DIR"
}

md5sums=('80eec3201a5d012913d287b85adaee8e'
)
