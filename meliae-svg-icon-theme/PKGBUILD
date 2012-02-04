# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: Josip <josipponjavic@gmail.com>

pkgname=meliae-svg-icon-theme
pkgver=1.2
pkgrel=2
pkgdesc="A modern, professional icon theme for the GNOME Desktop Environment"
arch=('any')
url='http://www.gnome-look.org/content/show.php/Meliae+SVG+%28dark+and+light+panels%29?content=118676'
license=('GPL')
makedepends=('hd2u')
source=('http://fc04.deviantart.net/fs70/f/2010/065/9/1/Meliae_SVG_Icon_Theme_v__1_2_by_sora_meliae.zip'
        'http://fc06.deviantart.net/fs71/f/2010/065/1/7/Meliae_SVG_Dark_v__1_2_by_sora_meliae.zip')
md5sums=('3a4092b83ea8a935ab7e2b0e9074ec23'
         '5deea7afa77d896a384bbc7dfee52d32')

package() {
	cd "$srcdir"
	bsdtar xf MeliaeSVG.tar.gz

	rm "$srcdir"/*/{AUTHORS,COPYING,CREDITS,index.theme~}
	chmod 644 "$srcdir"/*/index.theme
	dos2unix "$srcdir"/*/index.theme

	mkdir -p "$pkgdir/usr/share/icons"
	cp -R "$srcdir/MeliaeSVG" "$srcdir/MeliaeSVG-Dark" "$pkgdir/usr/share/icons"
}
