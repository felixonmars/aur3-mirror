# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=foobnix
pkgver=3.0.04
pkgrel=1
pkgdesc="Light and Functional music player."
arch=('any')
url="http://www.foobnix.com"
license=('GPL3')
depends=('gst-plugins-good' 'gstreamer0.10-ffmpeg' 'gstreamer0.10-good-plugins' 'gstreamer0.10-python' 'gstreamer0.10-ugly-plugins' \
         'libnotify' 'mutagen' 'python2-chardet' 'python2-dbus' 'python2-gobject' 'python2-simplejson' 'webkitgtk' 'xclip' 'xsel')
optdepends=('pywebkitgtk: vkontakte'
            'libkeybinder3: global hotkeys configuration'
            'fuseiso: ISO support' )
conflicts=('foobnix-git')
source=(https://launchpad.net/~foobnix-team/+archive/ubuntu/foobnix-player/+files/foobnix_${pkgver}vivid1.tar.gz)
md5sums=('ff917e0ab3632116f827985be44ad950')

package() {
  cd $srcdir/$pkgname*
  python2 setup.py install --root=$pkgdir --optimize=1
}