# Contributor: Scott Horowitz <stonecrest[at]gmail[dot]com>
# Contriubutor: Frozen Fox <frozenfoxz@gmail.com>
# Maintainer: Lari Tikkanen <lartza@wippies.com>

pkgname=sonata-fork-git
_gitname=sonata
pkgver=v1.7a1.39.g7f1e97c
pkgrel=1
pkgdesc="Elegant GTK+ music client for MPD (Fork)"
url="http://github.com/multani/sonata"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('python3' 'python-gobject' 'gtk3' 'python-mpd2>=0.4.6' )
makedepends=('git')
optdepends=('tagpy: Metadata editing support'
            'python-dbus: Various extra functionality (e.g. multimedia keys support)'
            'mpd: For local audio playback')
conflicts=('sonata' 'sonata-git' 'gnome-python-extras')
provides=('sonata' 'sonata-git')
source=("git://github.com/multani/sonata.git")
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

package() {
  cd $srcdir/$_gitname
  python3 setup.py install --prefix=/usr --root="$pkgdir"
  install -d $pkgdir/usr/share/pixmaps
  install -m 644 sonata/pixmaps/sonata.png ${pkgdir}/usr/share/pixmaps/sonata.png
}

