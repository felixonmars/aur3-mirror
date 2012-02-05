pkgname=git-mediawiki
pkgver=1.7.9
_rls="git-$pkgver"
pkgrel=1
pkgdesc="Gateway between Git and Media Wiki"
arch=(any)
url="https://github.com/Bibzball/Git-Mediawiki/wiki"
license=(GPL2)
depends=(perl-mediawiki-api perl-datetime-format-iso8601)
optdepends=("perl-crypt-ssleay: HTTPS wikis")
makedepends=(git)
source=("https://git-core.googlecode.com/files/$_rls.tar.gz")
sha1sums=(ed51ef5ef250daaa6e98515cf2641820cd268d4c)

package() {
    local DIR="$pkgdir$(git --exec-path)"
    install -d "$DIR"
    install "$srcdir/$_rls/contrib/mw-to-git/git-remote-mediawiki" "$DIR"
}
