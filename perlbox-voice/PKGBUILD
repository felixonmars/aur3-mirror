# Maintainer: Juri Hamburg <juri at fail2fail dot com>
pkgname=perlbox-voice
pkgver=0.09
pkgrel=3
pkgdesc="Perlbox Voice is an voice enabled application to bring your desktop under your command." 
url="http://perlbox.org/"
depends=('perl>=5.0' 'perl-tk' 'sphinx2' 'festival' 'festival-don') 
makedepends=('rpmextract')
source=(http://downloads.sourceforge.net/project/perlbox/Perlbox%20Voice%20for%20TK/Perlbox-Voice%20${pkgver}/${pkgname}-${pkgver}-0.noarch.rpm?use_mirror=mesh)
md5sums=('5bd9461c1f1b9705ea504e4fbc20bb10')
license="GPL"
arch=('i686' 'x86_64')
 
build() { 
 cd $startdir/src/
 rpmextract.sh ${pkgname}-${pkgver}-0.noarch.rpm?use_mirror=mesh || return 1
 cd $startdir/src/
 mkdir -p $startdir/pkg/usr/lib
 mkdir -p $startdir/pkg/usr/bin

 cp -a usr/bin/* $startdir/pkg/usr/bin/
 cp -a usr/lib/* $startdir/pkg/usr/lib/
 
}

