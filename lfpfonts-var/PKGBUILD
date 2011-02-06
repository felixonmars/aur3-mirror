# Contributor: gyo <nucleogeek_at_gmail_dot_com>

pkgname=lfpfonts-var
pkgver=0.84
pkgrel=2
pkgdesc="A set of variable fonts for X."
url="http://sourceforge.net/projects/xfonts/"
license=('custom:"public domain"')
depends=(xorg-fonts-encodings xorg-font-utils fontconfig)
install=lfpfonts-var.install
source=(http://switch.dl.sourceforge.net/sourceforge/xfonts/$pkgname-src-$pkgver.tar.bz2)
md5sums=(16afb8b2c6a82c82948c33dd42511845)

build() {
    cd $startdir/src/$pkgname-src/src
    ./compile
    cd ../lfp-var/
    mkdir -p $startdir/pkg/usr/share/fonts/$pkgname
    install -m644 *.pcf.gz $startdir/pkg/usr/share/fonts/$pkgname/
    install -m644 fonts.dir $startdir/pkg/usr/share/fonts/$pkgname/
}

