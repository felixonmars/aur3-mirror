# Contributor: quantax -- contact via Arch Linux forum or AUR
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>

pkgname=umodpack
pkgver=0.5b16
pkgrel=1
pkgdesc="Tool to work with Unreal Tournament umod files."
arch=(any)
# official homepage (http://umodpack.sourceforge.net) seems to have vanished.
url="http://gentoo-portage.com/games-util/umodpack"
license=('PerlArtistic')
depends=('perl>=5.10.0' perl-archive-zip perl-compress-zlib perl-tie-ixhash)
optdepends=('perl-tk: GUI support.')
source=(http://gentoo.cites.uiuc.edu/pub/gentoo/distfiles/$pkgname-$pkgver-allinone.tar.gz)
md5sums=('c8cea5588db49cb6218c0578b051ab11')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    rm -rf {Archive-Zip,Compress-Zlib,Tie-IxHash,Tk}*

    perl Makefile.PL INSTALLDIRS=vendor || return 1
    make || return 1
    make install DESTDIR="$pkgdir/" || return 1
}

