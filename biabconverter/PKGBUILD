# Maintainer: Marcello Mortaro <mortaromarcello@gmail.com>
pkgname=biabconverter
pkgver=0.6.8
pkgrel=1
pkgdesc="A perl script that reads most BiaB files and produces MMA and Lilypond output."
arch=('any')
license=('GPL')
url="http://www.brenzi.ch/builder.php?content=projects_biabconverter"
depends=(perl perl-switch)
source=(http://www.brenzi.ch/data/$pkgname-$pkgver.tar.gz)
md5sums=('27ffde9dff7d63ec1d5182ce5711c459')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/lib/perl5/site_perl
  mkdir -p $pkgdir/usr/share/biabconverter
  mkdir -p $pkgdir/usr/share/biabconverter/templates
  cp * $pkgdir/usr/share/biabconverter
  mv $pkgdir/usr/share/biabconverter/*.pm $pkgdir/usr/lib/perl5/site_perl
  mv $pkgdir/usr/share/biabconverter/*.lyt $pkgdir/usr/share/biabconverter/templates
  mv $pkgdir/usr/share/biabconverter/biabconverter $pkgdir/usr/bin
}

