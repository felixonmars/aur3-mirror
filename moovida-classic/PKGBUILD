# Maintainer: t3ddy  <t3ddy1988 "at" gmail {dot} com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: sickhate <sickhate@tux-linux.net>
# Contributor: Bjorn Lindeijer <bjorn lindeijer nl>

pkgname=moovida-classic
_realname=moovida
pkgver=1.0.9
pkgrel=5
pkgdesc="An open source cross-platform media center solution, classic series"
arch=('any')
url="http://elisa.fluendo.com/"
license=('GPL')
depends=('python2>=2.7' 'pigment-python-classic>=0.3.12' 'gstreamer0.10-python' 'pygobject' 'pygtk' \
    'pycairo' 'python2-distribute' 'python-simplejson' 'twisted-web2' 'pyopenssl' \
    'python2-cssutils>=0.9.7' 'dbus-python' 'pyxdg' 'ttf-liberation' 'python-imaging')
conflicts=('moovida')
replaces=('elisa' 'elisa-base' 'elisa-plugins' 'moovida')
optdepends=("xdg-user-dirs: for user default multimedia directories support, alternatively"
"python-gdata: for YouTube video streaming website support"
"gstreamer0.10-ugly-plugins: some optional plugins"
"gstreamer0.10-ffmpeg: for ffmpeg"
"lirc: for LIRC support"
"python-daap: for DAAP support"
"libgpod: for iPod support")
source=(http://launchpad.net/$_realname/1.0/$pkgver/+download/$_realname-$pkgver.tar.gz
http://launchpad.net/$_realname/1.0/$pkgver/+download/$_realname-plugins-good-$pkgver.tar.gz
http://launchpad.net/$_realname/1.0/$pkgver/+download/$_realname-plugins-bad-$pkgver.tar.gz
http://launchpad.net/$_realname/1.0/$pkgver/+download/$_realname-plugins-ugly-$pkgver.tar.gz)
md5sums=('70372113d3426cd3d55d50aab9c042ef' 
'bcaa60aa0888a1d6b356f565b90c04b7'
'87839718b5007f11309722018b488792'
'45dbc3bd1cd9c57e81fc32ea2dbaa75c')

build() {
    cd $srcdir/elisa-$pkgver
    python2 setup.py install --root=$pkgdir || return 1

    for _i in elisa-plugins-good elisa-plugins-bad elisa-plugins-ugly
    do
        if [ -h ${_i}-$pkgver ]; then
            rm -rf ${_i}-$pkgver
        else
            ln -s ../${_i}-$pkgver .
        fi
        python2 $srcdir/elisa-$pkgver/${_i}-$pkgver/setup.py install --root="$pkgdir" || return 1
    done

    rm -rf $srcdir/*

}
md5sums=('70372113d3426cd3d55d50aab9c042ef'
         'bcaa60aa0888a1d6b356f565b90c04b7'
         '87839718b5007f11309722018b488792'
         '45dbc3bd1cd9c57e81fc32ea2dbaa75c')
