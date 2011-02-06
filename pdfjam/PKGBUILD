pkgname=pdfjam
pkgver=2.06
pkgrel=1
pkgdesc="A collection of shell scripts to manipulate PDF files."
arch=('i686' 'x86_64')
url="http://go.warwick.ac.uk/pdfjam/"
license=('GPL')
depends=('bash' 'texlive-core')
source=(http://go.warwick.ac.uk/pdfjam/${pkgname}_206.tgz)
md5sums=('8113cae5d43359708be9e7e9d6df999d')

build() {
cd "$srcdir/$pkgname"
# Creating directory structure
mkdir -p $pkgdir/usr/bin
mkdir -p $pkgdir/usr/share/man/man1
mkdir -p $pkgdir/usr/share/apps/$pkgname
# Installing scripts
cp bin/* $pkgdir/usr/bin/
chmod 755 $pkgdir/usr/bin/*
# Installing manual pages
cp man1/* $pkgdir/usr/share/man/man1/
chmod 644 $pkgdir/usr/share/man/man1/*
# Installing remaining stuff
cp COPYING $pkgdir/usr/share/apps/$pkgname/
cp PDFjam-README.html $pkgdir/usr/share/apps/$pkgname/
cp VERSION $pkgdir/usr/share/apps/$pkgname/
chmod 644 $pkgdir/usr/share/apps/$pkgname/*
}
