# Maintainer: t3ddy  <t3ddy1988 "at" gmail {dot} com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: sickhate <sickhate@tux-linux.net>
# Contributor: Bjorn Lindeijer <bjorn lindeijer nl>

pkgname=moovida
pkgver=1.0.9
pkgrel=4
pkgdesc="An open source cross-platform media center solution"
arch=('any')
url="http://elisa.fluendo.com/"
license=('GPL')
depends=('python-pigment>=0.3.12' 'gstreamer0.10-python' 'pygobject' 'pygtk' \
	 'pycairo' 'setuptools' 'python-simplejson' 'twisted-web2' 'pyopenssl' \
	 'python-cssutils-beta' 'dbus-python' 'pyxdg' 'ttf-liberation' 'python-imaging')
makedepends=('python2')
replaces=('elisa' 'elisa-base' 'elisa-plugins')
optdepends=("xdg-user-dirs: for user default multimedia directories support, alternatively"
	    "python-gdata: for YouTube video streaming website support"
	    "gstreamer0.10-ugly-plugins: some optional plugins"
	    "gstreamer0.10-ffmpeg: for ffmpeg"
	    "lirc: for LIRC support"
	    "python-daap: for DAAP support"
	    "libgpod: for iPod support")
source=(http://www.moovida.com/media/public/$pkgname-$pkgver.tar.gz
	http://www.moovida.com/media/public/$pkgname-plugins-good-$pkgver.tar.gz
	https://launchpad.net/~moovida-packagers/+archive/ppa/+files/moovida-plugins-bad_1.0.9.release.orig.tar.gz
	http://www.moovida.com/media/public/$pkgname-plugins-ugly-$pkgver.tar.gz)
md5sums=('70372113d3426cd3d55d50aab9c042ef' 
	 'bcaa60aa0888a1d6b356f565b90c04b7'
         '87839718b5007f11309722018b488792'
	 '45dbc3bd1cd9c57e81fc32ea2dbaa75c')

build() {
  for _i in elisa elisa-plugins-good elisa-plugins-bad elisa-plugins-ugly
  do
    cd "$srcdir"/${_i}-$pkgver
    python2 setup.py install --root="$pkgdir" || return 1
    cd ..
  done
}
