pkgname=ttf-droid-mono-slashed
pkgver=1.00
pkgrel=1
pkgdesc="Droid Sans Mono with slashed zeros."
arch=(any)
url="http://www.cosmix.org/software/"
license=(Apache)
groups=()
depends=(fontconfig xorg-font-utils)
makedepends=(unzip)
install=$pkgname.install
source=(http://www.cosmix.org/software/files/DroidSansMonoSlashed.zip)

build() {
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
}

md5sums=('4df780cb87f2931233123117feac5e2c')
