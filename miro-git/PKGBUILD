# $Id: PKGBUILD 45558 2009-07-12 17:23:23Z ronald $
# Maintainer: Ronald van Haren <ronald.archlinux.org>

pkgname=miro-git
pkgver=20100909
pkgrel=2
pkgdesc="The free and open source internet TV platform"
arch=('i686' 'x86_64')
url="http://www.getmiro.com"
license=('GPL2')
depends=('dbus-python' 'pyrex' 'pygtk' 'gstreamer0.10' 'gnome-python'
         'python-pysqlite' 'pywebkitgtk' 'shared-mime-info'
         'desktop-file-utils' 'gstreamer0.10' 'hicolor-icon-theme'
         'gstreamer0.10-python' 'python-notify' 'libtorrent-rasterbar')
makedepends=('pkgconfig' 'git')
install=miro.install
md5sums=('e90815b92db109b8bfa853437c55a711')

conflicts=('democracy')
replaces=('democracy')
provides=('democracy')
_gitroot="http://git.participatoryculture.org/miro"
_gitname="miro"

build() {
 msg "Connecting to GIT server..."
  if [[ -d $srcdir/$_gitname ]]; then
    cd $srcdir/$_gitname && git pull origin || return 1
  else
    git clone $_gitroot $srcdir/$_gitname || return 1
    cd $srcdir/$_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd ${srcdir}/miro/tv/linux
  python setup.py install --root=${pkgdir} || return 1
}
