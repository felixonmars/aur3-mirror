# Maintainer: Joost Bremmer <toost dot b at gmail dot com>
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>

pkgname=wmal-git
pkgver=0.2.r377.g004925d
pkgrel=2
pkgdesc="A lightweight and simple updater for MyAnimeList, Melative or VNDB."
arch=('any')
url="http://z411.github.io/wmal-python/"
license=('GPL3')
depends=('python2'
         'lsof')
        
makedepends=('python2'
             'desktop-file-utils'
             'git'
            )
optdepends=('pygtk: gtk frontend'
			'python2-pillow: thumbnail images for GUI frontends'
			'python2-pyqt4: Qt frontend'
            'python2-urwid: ncurses frontend')

install=wmal-git.install
source=(${pkgname}::'git+https://github.com/z411/wmal-python.git'
        'wmal-curses.desktop'
        'wmal-gtk.desktop'
		'wmal-qt.desktop')

sha256sums=('SKIP'
            'ae3f3cf9ec679022e2b829b2b395d4d9d3dd22e2edd709dd13a821f3d124550f'
            'ac2f86ef64d54274cf17afc7605f6eae9e565e9809631fa3ad4d349a9d9be6d6'
            'db7ca1d78be123a11a5416e46aa7380aad20fabcb43aab939b03d32dc133a220')


pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed -e 's/([^-]*-g)/r\1/;s/-/./g'
}


package() {
   cd ${pkgname}
   python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
   install -Dvm644 trackma/data/icon.png "${pkgdir}"/usr/share/pixmaps/wmal.png
   install -Dvm644 "${srcdir}"/wmal-curses.desktop "${pkgdir}"/usr/share/applications/wmal-curses.desktop
   install -vm644  "${srcdir}"/wmal-gtk.desktop "${pkgdir}"/usr/share/applications/wmal-gtk.desktop
   install -vm644  "${srcdir}"/wmal-qt.desktop "${pkgdir}"/usr/share/applications/wmal-qt.desktop
}
