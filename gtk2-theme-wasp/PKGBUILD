# Maintainer: Jens Kleikamp <jens [at] codes-concepts.com>
pkgname=gtk2-theme-wasp
pkgver=0.8.4
pkgrel=1
pkgdesc="Wasp is a suite of GTK, Metacity, Xfwm and Login/GDM themes"
arch=('any')
url="http://www.gnome-look.org/content/show.php/Wasp?content=104167"
license=('GPL')
groups=('gtk2-themes')
depends=('gtk-engines' 'gtk-engine-murrine>=0.90.3' 'zenity' 'gksu')
install=wasp.install
source=(http://launchpad.net/wasp/trunk/wasp0.8/+download/wasp-0.8.4.tar.gz)
md5sums=('5c42a32620e2a661474e0f367b6aeed1')
build () {
    mkdir -p ${pkgdir}/usr || return 1

    cp -R ${srcdir}/wasp-${pkgver}/usr/* ${pkgdir}/usr/ || return 1
}
