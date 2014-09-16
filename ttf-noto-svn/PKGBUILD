# Maintainer: Nguyễn Đình Quân a.k.a <dinhquan[at]narga[dot]net>
# Visit http://www.archviet.com/ - Arch Linux Portal for Vietnamese to get latest update

pkgname=ttf-noto-svn
pkgver=278
pkgrel=1
pkgdesc="Fonts support all languages/characters in Unicode"
arch=('any')
url="https://code.google.com/p/noto/"
license=('apache')
depends=('fontconfig' 'subversion' 'xorg-fonts-encodings' 'xorg-font-utils')
makedepends=()
conflicts=('ttf-noto' 'ttf-chromeos-fonts')
provides=('ttf-font')
source=(${pkgname}::svn+http://noto.googlecode.com/svn/trunk/fonts/individual/hinted/)
install="$pkgname.install"
PKGEXT='.pkg.tar'
sha1sums=('SKIP')

pkgver() {
	cd "$SRCDEST/$pkgname"
	svnversion
}

package() {
    cd "$srcdir/$pkgname"
    install -dm755 "$pkgdir/usr/share/fonts/TTF"
    install -m644 *{.ttf,ttc} "$pkgdir/usr/share/fonts/TTF"
}
