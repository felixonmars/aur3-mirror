# Contributor: Clément DEMOULINS <cdemoulins@gmail.com>

pkgname=gnome-pulse-applet
pkgver=0.3
pkgrel=3
pkgdesc="Simple panel/tray applet for controlling PulseAudio streams."
arch=('i686' 'x86_64')
url="http://code.google.com/p/gnome-pulse-applet/"
license=('GPL3')
depends=('pulseaudio' 'gnome-panel' 'gnome-python-desktop' 'pygtk' 'setuptools')
makedepends=('patch')
md5sums=('0739a3ae405e97e3aa2876962f88c92a')
optdepends=('gnome-python-extras: Use applet in system tray (ie for non-gnome use)')
source=(http://gnome-pulse-applet.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)

build() {
    cd $srcdir/$pkgname-$pkgver

    sed -i 's/lib64/lib/' Makefile

    make || return 1
    make DESTDIR=$pkgdir install || return 1
}
