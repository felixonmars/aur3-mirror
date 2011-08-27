# Maintainer: François Lebigre <francois.lebigre@gmail.com>
pkgname=gnome-theme-lucidity
pkgver=2.3.3
pkgrel=2
pkgdesc="A complete gnome theme by Emily Wind inspired by a mockup by Huw Wilkins"
arch=('any')
url="http://gnome-look.org/content/show.php/Lucidity?content=125877"
license=('CCPL:cc-by-sa')
depends=('gtk-engine-murrine-git')
conflicts=('gtk-theme-lucidity')
optdepends=('faenza-icon-theme: recommended iconset')
source=(http://fc09.deviantart.net/fs70/f/2010/331/1/e/lucidity_2_3_3_by_emilywind-d326tsx.zip)
md5sums=('eaced5e6a7743db1483e143e29580080')

build() {
	cd "$srcdir"
	unzip -o "lucidity_${pkgver//./_}_by_emilywind-d326tsx.zip"

	cd "$srcdir/Lucidity"

	mkdir -p themes/
	mkdir -p icons/
	
	tar -C themes/ -xf Lucidity-themes.tar.gz
	tar -C icons/ -xf Lucidity-icons.tar.gz
	
	cd ./icons/Lucidity/apps/24 && ln -sf ../../logos/archlinux-24.svg start-here.svg && cd ../
	cd ./22 && ln -sf ../../logos/archlinux-22.svg start-here.svg && cd ../../../..
	
	cd ./icons/Lucidity-Dark/apps/24 && ln -sf ../../logos/archlinux-24.svg start-here.svg && cd ../
	cd ./22 && ln -sf ../../logos/archlinux-22.svg start-here.svg && cd ../../../..
	
	mkdir -p $pkgdir/usr/share/
	cp -r "$srcdir/Lucidity/themes/" "$pkgdir/usr/share/"
	cp -r "$srcdir/Lucidity/icons/" "$pkgdir/usr/share/"
}

