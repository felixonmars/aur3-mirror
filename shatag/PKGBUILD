# Maintainer: Rich Li <rich at dranek dot com>
pkgname=shatag
pkgver="0.4.1"
pkgrel=1
pkgdesc="Compute and cache file checksums"
arch=('any')
url="https://bitbucket.org/maugier/shatag"
license=('GPL3')
depends=('python' 'python-yaml' 'python-pyxattr' 'python-pyinotify')
optdepends=(
    'python-couchdb: Couchdb database'
    'python-psycopg2: PostgreSQL database'
    'python-bottle: Serve an HTTP database'
    'python-requests: HTTP remote database'
    )
source=(https://bitbucket.org/maugier/shatag/get/0.4.1.tar.gz)
md5sums=('d4967c226b6dee0c7ada97e75fced97f')
sha1sums=('809d360d076665318df8a8549ffa9ad48db662d6')
sha256sums=('c985282b982de9017ca25a2b12683fb35897aad3843789f977995abe078d30e1')

package() {
    cd "$srcdir/maugier-shatag-d8fe0fbc254f"
    python setup.py install --root="$pkgdir/" --optimize=1

    # Manpages
    install -dm 755 "$pkgdir"/usr/share/man/man1
    install -m 644 man/shatag.1 "$pkgdir"/usr/share/man/man1/shatag.1
    install -m 644 man/shatag-add.1 "$pkgdir"/usr/share/man/man1/shatag-add.1
    install -m 644 man/shatagd.1 "$pkgdir"/usr/share/man/man1/shatagd.1
}
