# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Arkham <arkham at archlinux dot us>

pkgname=gnome-wallchanger
pkgver=0.7
pkgrel=1
pkgdesc="An automatic wallpaper changer for GNOME"
arch=('i686' 'x86_64')
url="https://launchpad.net/gnome-wallchanger"
license=('GPL3')
depends=('python-moxml-config' 'python2-crontab' 'gnome-desktop' 'gnome-python')
source=(http://launchpad.net/$pkgname/stable/$pkgver/+download/${pkgname}_2.6-0ubuntu1.tar.gz)
md5sums=('1611aba3ae5cc60dd48c37caf93a75f8')


prepare() {
    cd wallchanger
    sed -i -e 's|/usr/bin/random-wallpaper|DISPLAY=:0.0 /usr/bin/random-wallpaper|g' \
        gnome-wallchanger-config.py
    sed -i -e 's|python2.5|python2.7|g' \
        gnome-wallchanger-config random-wallpaper
    sed -i -e 's|/usr/bin/python|/usr/bin/python2|g' \
        gnome-wallchanger-config random-wallpaper
    sed -i -e 's|env python|env python2|g' \
        *.py lib/config.py
}

package() {
    cd $srcdir/wallchanger

    python2 setup.py install --prefix=/usr --root=$pkgdir
}
