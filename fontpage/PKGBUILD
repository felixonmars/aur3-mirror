# Maintainer: Lukas Martini <lutoma@ohai.su>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: K. Piche <kpiche@rogers.com>

pkgname=fontpage
pkgver=3.0
pkgrel=3
pkgdesc="A font viewer and graphic utility, view system fonts, install fonts"
arch=(any)
url="http://www.absolutelinux.org/FONTpage.shtml"
source=(ftp://ftp.absolutelinux.org/programs/fontpage-$pkgver.src.tar.bz2
 	http://www.absolutelinux.org/images/FONTpage.png
	FONTpage.desktop
	fontpage.patch)
license=('GPL3')
depends=('fontconfig' 'pygtk' 'python2-pillow')
md5sums=('1a4c6aa7862b458ea83eab6c5715e7af'
         'e5453492083490800ce9de083de5c090'
	 '4ce1811b4414c206040b0263ce6e261f'
	 '4bf919ed5723bdde41f966e849b2eda8')

prepare() {
cd "$srcdir/$pkgname-$pkgver.src"
  # python2 fix
  for file in $(find . -name '*.py' -print); do
    sed -i 's_#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  patch $srcdir/$pkgname-$pkgver.src/fontpage.py $startdir/fontpage.patch
}

package() {
cd "$srcdir/$pkgname-$pkgver.src"
install -D $pkgname.py "$pkgdir/usr/bin/$pkgname"
install -D -m644 "$startdir/FONTpage.desktop" "$pkgdir/usr/share/applications/FONTpage.desktop"
install -D -m644 "$startdir/FONTpage.png" "$pkgdir/usr/share/pixmaps/FONTpage.png"
}
