#contributor: mjheagle8 <mjheagle8@gmail.com>
pkgname=phpbrainz-git
pkgver=0.1
pkgrel=1
pkgdesc='PHP extension to lookup music information via Musicbrainz'
arch=(any)
url='http://github.com/olds/phpbrainz'
license='GPLv2'
depends=('php')

build() {
    #clone repository
    mkdir -p "$srcdir/$pkgname"
    cd "$srcdir/$pkgname"
    git clone "$url.git"

    #apply fix
    cd "$srcdir/$pkgname/phpbrainz"
    cat phpBrainz.release.class.php | sed 's/public static function//g' >> phpBrainz.release.class.php.new
    mv phpBrainz.release.class.php.new phpBrainz.release.class.php

    #move files to package directory
    mkdir -p "$pkgdir/usr/share/pear"
    cp -R "$srcdir/$pkgname/phpbrainz" "$pkgdir/usr/share/pear"
}
