# Maintainer: M Rawash <mrawash@gmail.com>
# Submitter: Rick Dutour Geerling <info at rickdg dot nl>

pkgname=afraid-dyndns
pkgver=1.1
pkgrel=2
epoch=1
pkgdesc="A dynamic DNS client for the free service afraid.org, written in Perl"
arch=('any')
url="http://perl.arix.com/"
license=('GPL3')
depends=('perl-libwww' 'perl-xml-simple')
optdepends=('perl-mime-lite: email notification')
backup=('etc/afraid-dyndns.conf')
install=$pkgname.install
source=(http://perl.arix.com/ftp/$pkgname-$pkgver.tar.gz
        $pkgname-latest-fix.patch)
md5sums=('38ca9be1d2ab409fe472524df53c8806'
         'd280b5fc55aba622a155f6991913601d')

build() {
    cd "$srcdir"
    patch -Np0 -i $pkgname-latest-fix.patch || return 1 
    
    cd "$srcdir/$pkgname-$pkgver"

    ./install "$pkgdir"

    install -Dpm 644 README "$pkgdir/usr/share/doc/$pkgname/README"
}

# vim:set ts=2 sw=2 et:
