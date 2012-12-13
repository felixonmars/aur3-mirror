pkgname=ttf-droidsansmonoslashed
pkgver=1.0
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="custom fonts"
arch=('any')
url="http://www.cosmix.org/software"
license=('Apache')
source=(http://www.cosmix.org/software/files/DroidSansMonoSlashed.zip)
md5sums=('4df780cb87f2931233123117feac5e2c')
install=$pkgname.install


build()
{
	mkdir -p $pkgdir/usr/share/fonts/TTF
	cp $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
}

