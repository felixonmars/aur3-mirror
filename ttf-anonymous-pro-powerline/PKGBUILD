pkgname=ttf-anonymous-pro-powerline
pkgver=1.0
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="A Vim Powerline compatible version of Anonymous-Pro"
arch=('any')
url=('https://gist.github.com/2418116')
install=$pkgname.install
license=('GPL')
source=(https://gist.github.com/raw/2418116/a3845071e4292f67adad755810b572e9f58ccea8/anonymous%20Pro-Powerline.ttf)
md5sums=(4db4c00caab9a47b2a9849c473249216)

build()
{
    mkdir -p $pkgdir/usr/share/fonts/TTF
    cp $srcdir/anonymous%20Pro-Powerline.ttf $pkgdir/usr/share/fonts/TTF/Anonymous-Pro-Powerline.ttf
}
