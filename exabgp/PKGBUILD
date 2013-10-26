# Maintainer: Diogo Leal <estranho@diogoleal.com>

pkgname=exabgp
pkgver=3.2.16
pkgrel=1
pkgdesc='BPG route injector'
arch=('any')
license=('custom')
url='https://github.com/Exa-Networks/exabgp'
depends=('python2')
backup=('etc/exabgp.conf')
source=("https://github.com/Exa-Networks/${pkgname}/archive/${pkgver}.zip"
    'exabgp.service')
sha1sums=('346389cfa42f813b56f946bb2951f924b026628c'
          '2f12eaf9be33e4a5b19ad96aeba97d2b4b67d58b')

build() {
    # arch python2
    find $pkgname-$pkgver -type f -exec \
        sed -i '1s,^#!/usr/bin/\(env \|\)python$,#!/usr/bin/python2,' {} \; -print
}

package() {
    pushd $pkgname-$pkgver
    # upstream installer
    python2 setup.py install --root="$pkgdir" --install-data=/
    # install license
    install -D -m 644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    popd
    # systemd
    install -D -m 644 $pkgname.service \
        "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    # install empty config file
    install -D -m 644 /dev/null "$pkgdir/etc/$pkgname.conf"
    # move data in a more private directory
    mv "$pkgdir/etc/$pkgname" "$pkgdir/usr/share/$pkgname"
}
