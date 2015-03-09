# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=foobnix-git
pkgver=2403.2805cc8
pkgrel=2
pkgdesc="Light and Functional music player."
arch=('any')
url="http://www.foobnix.com"
license=('GPL3')
depends=('gst-plugins-good' 'gstreamer0.10-ffmpeg' 'gstreamer0.10-good-plugins' 'gstreamer0.10-python' 'gstreamer0.10-ugly-plugins' \
         'libnotify' 'mutagen' 'python2-chardet' 'python2-dbus' 'python2-gobject' 'python2-simplejson' 'webkitgtk' 'xclip' 'xsel')
optdepends=('pywebkitgtk: vkontakte'
            'libkeybinder3: global hotkeys configuration'
            'fuseiso: ISO support')
makedepends=('git')
conflicts=('foobnix')
source=('git+http://github.com/foobnix/foobnix.git')
md5sums=('SKIP')

package() {
  cd $srcdir/foobnix
  python2 setup.py install --root=$pkgdir --optimize=1
}

pkgver() {
  cd $srcdir/foobnix
  echo $(git rev-list --count master).$(git rev-parse --short master)
}