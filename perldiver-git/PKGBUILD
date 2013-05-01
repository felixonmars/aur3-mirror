pkgname=perldiver-git
pkgver=0.0.24
pkgrel=1
pkgdesc='CLI tool to find and browse perl modules and their documentation'
url='https://github.com/andrewgregory/perldiver'
depends=(perl-file-slurp perl-uri)
conflicts=(perldiver)
license=(MIT)
arch=(any)
options=(!emptydirs)
source=("$pkgname::git://github.com/andrewgregory/perldiver.git")
md5sums=(SKIP)

pkgver() {
    cd "$srcdir/$pkgname"
    echo "0.0.$(git rev-list HEAD | wc -l)"
}

build() {
    cd "$srcdir/$pkgname"
    perl Build.PL --installdirs=vendor
    ./Build
}

check() {
    cd "$srcdir/$pkgname"
    ./Build test
}

package() {
    cd "$srcdir/$pkgname"
    ./Build --destdir="$pkgdir" install
}
