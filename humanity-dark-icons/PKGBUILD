# Maintainer: Ruan Wessels <ruan9422 %at% gmail.com>
# Contributor: Kao Dome <kaodome .:at:. gmail .:dot:. com>

pkgname=humanity-dark-icons
pkgver=0.5.3.11
pkgrel=1
pkgdesc="Humanity Dark icon set."
arch=('any')
url="https://launchpad.net/humanity"
license=('GPL2')
source=(https://launchpad.net/ubuntu/+archive/primary/+files/humanity-icon-theme_$pkgver.tar.gz
		  archtango-16.svg
		  archtango-22.svg
		  archtango-24.svg
		  archtango-32.svg
		  archtango-48.svg
		  archtango-64.svg)

md5sums=('bc4a3ceabfbb5bfc31313863707f1cfc'
         '123d1c18b3843056b496918f5dbd392d'
         '60c66e017acf488cfe9455e1c6d105f9'
         '7ad714ee2dc7373766d0ea6c90f53f20'
         'dbcdfd5ef777c97bb0e27b5a18709fff'
         'bac45253bc7b32884cf79308bf07ff70'
         'fe72f0780a2691b67f3a2d9cb5965ba0')

build() {
	true
}

package() {
   cd $srcdir/humanity-icon-theme #-$pkgver
   rm Human*/COPYING Human*/places/*/start-here.svg
   mkdir -p $pkgdir/usr/share/icons/Humanity-Dark
   cp -R Humanity/* $pkgdir/usr/share/icons/Humanity-Dark
   cp -R -f Humanity-Dark/* $pkgdir/usr/share/icons/Humanity-Dark
   for i in {16,22,24,32,48,64}; do
      cp $srcdir/archtango-$i.svg $pkgdir/usr/share/icons/Humanity-Dark/places/$i/start-here.svg
   done
}
