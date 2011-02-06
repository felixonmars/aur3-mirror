# Contributori: André Klitzing <aklitzing@online.de>
pkgname=libparse-debianchangelog-perl
pkgver=1.1.1
pkgrel=1
pkgdesc="Parse Debian changelogs and output them in other formats"
arch=(i686 x86_64)
url="http://packages.qa.debian.org/lintian"
license=('GPL')
depends=('perl' 'perl-timedate' 'perl-locale-gettext' 'perl-io-string' 'perl-class-accessor')
source=(http://ftp.debian.org/debian/pool/main/libp/${pkgname}/${pkgname}_${pkgver}-${pkgrel}_all.deb)
md5sums=('e8a9f4680a44a2d4c44fa08c30fc34ed')

build() {
  ar x ${pkgname}_${pkgver}-${pkgrel}_all.deb
  tar xzf data.tar.gz -C $startdir/pkg

  cd $startdir/pkg
  mkdir -p ./usr/lib/perl5/current
  mv ./usr/share/perl5/* ./usr/lib/perl5/current
  rm ./usr/share/perl5 -rf
}

