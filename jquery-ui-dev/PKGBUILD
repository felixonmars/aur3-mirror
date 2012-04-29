# Maintainer: Leo von Klenze <aur@leo.von-klenze.de>
pkgname=jquery-ui-dev
pkgver=1.8.19
pkgrel=1
pkgdesc="jQuery UI provides abstractions for low-level interaction and animation, advanced effects and high-level, themeable widgets, built on top of the jQuery JavaScript Library, that you can use to build highly interactive web applications. This package contains the development version of the library."
arch=(i686 x86_64)
url="http://jqueryui.com"
license=('MIT' 'GPL2')
depends=('jquery')

source=("https://github.com/jquery/jquery-ui/zipball/$pkgver")
md5sums=('91a52d56db9c948bfb2a844abbcb42a7')

package() {
    mkdir -p $pkgdir/usr/share/jquery/i18n
    mkdir -p $pkgdir/usr/share/jquery/themes/base/images
    cd $srcdir/jquery-jquery-ui* || return 1
    install -m664 ui/*.js $pkgdir/usr/share/jquery
    install -m664 ui/i18n/*.js $pkgdir/usr/share/jquery/i18n
    install -m664 themes/base/*.css $pkgdir/usr/share/jquery/themes/base
    install -m664 themes/base/images/* $pkgdir/usr/share/jquery/themes/base/images
}

