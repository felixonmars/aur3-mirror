# Contributor: Dragonlord <archlinux[at]dragonlord[.]cz>

pkgname=lemonrip
pkgver=1.20
pkgrel=4
pkgdesc="Mencoder GUI for ripping and encoding DVD into AVI files."
arch=('i686' 'x86_64')
url="http://jaromes.projects.googlepages.com/$pkgname.html"
license=('GPL')
depends=('mplayer' 'perl' 'perl-libintl-perl' 'perl-xml-simple' 'gtk2-perl' 'desktop-file-utils' )
install=$pkgname.install
source=(http://jaromes.projects.googlepages.com/${pkgname}_${pkgver}.tar.gz \
        $pkgname.desktop)

md5sums=('337f80c9656976f2ac42f7744736f39f'
         'bd929b0838650b6c058e1be9ac4328bf')

build() {
  install -D -m755 "$startdir/src/lemonrip/src/$pkgname" \
                     "$startdir/pkg/usr/bin/$pkgname"
  install -D -m644 "$startdir/src/$pkgname.desktop" \
                     "$startdir/pkg/usr/share/applications/$pkgname.desktop"

# icons
  install -D -m644 "$startdir/src/$pkgname/DOC/${pkgname}_small.png" \
    "$startdir/pkg/usr/share/icons/hicolor/16x16/apps/$pkgname.png"
  install -D -m644 "$startdir/src/$pkgname/DOC/${pkgname}_icon.png" \
    "$startdir/pkg/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
  install -D -m644 "$startdir/src/$pkgname/DOC/${pkgname}.png" \
    "$startdir/pkg/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
}
