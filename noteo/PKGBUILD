# Contributor: Ben Duffield <jebavarde<AT>gmail.com>
pkgname=noteo
pkgver=0.1.7
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="A notifications system"
url='http://code.google.com/p/noteo/'
license=("GPL")
depends=("pygtk" "python2-configobj")
optdepends=('xmms2: xmms monitoring'
            'mpd: mpd monitoring'
            'libgmail: gmail checking'
            'libnotify: libnotify support',
            'pyqt: support for modules requiring qt')
provides=("notification-daemon")
replaces=("noteo-notify" "noteo-awesome" "noteo-batterystatus" "noteo-gmailcheck" "noteo-mpd" "noteo-pacmanstatus" "noteo-output-macopix<=0.0.6")
conflicts=("noteo-notify" "noteo-awesome" "noteo-batterystatus" "noteo-gmailcheck" "noteo-mpd" "noteo-pacmanstatus" "noteo-output-macopix<=0.0.6")
source=("http://noteo.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('8b0ba066ea73c33d6be2a6afd05334d7')

package() {
  cd $srcdir/"$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}
