# Contributor: Christopher Schwaab -- christopher.schwaab gmail
pkgname=brother-hl5250dn-lpr
pkgver=2.0.1
pkgrel=4
pkgdesc="LPR driver for HL-5250DN and compatible printers."
url="http://solutions.brother.com/linux/en_us/"
arch=('i686' 'x86_64')
license=("custom:brother")
depends=('cups' 'ghostscript')
makedepends=('rpmextract')
source=("http://www.brother.com/pub/bsc/linux/dlf/brhl5250dnlpr-${pkgver}-1.i386.rpm"
        'license.txt')
md5sums=('ffce0298773e8219bfa417a1c9c271c1'
         '1653535fd8387de65bfdf9148b3b9ad6')
noextract=("brhl5250dnlpr-$pkgver-1.i386.rpm")

build() {
        cd $srcdir
        rpmextract.sh "brhl5250dnlpr-$pkgver-1.i386.rpm"
        rm "brhl5250dnlpr-$pkgver-1.i386.rpm"

        mkdir -p usr/share/
        rm -rf usr/share/brother
        mv usr/local/Brother usr/share/brother
        rmdir usr/local

        sed -i 's|/usr/local/Brother|/usr/share/brother|g' \
	       `grep -lr '/usr/local/Brother' ./`

        tar -cpf - . --exclude=license.txt | tar -C $pkgdir -xpf -
        install -Dm644 license.txt \
	               $pkgdir/usr/share/licenses/$pkgname/license.txt
}
