# Contributor: hokum83 <hokum83@gmail.com>

pkgname=sonata-disautocenter
pkgver=1.5.2
pkgrel=2
pkgdesc="A lightweight GTK+ music client for MPD. With patch to disable autocenter current song when it changes. Hotkey to center song manually (Ctrl+I) is working."
url="http://sonata.berlios.de"
license=('GPL3')
arch=(i686 x86_64)
depends=('pygtk' 'python-mpd')
conflicts=('sonata' 'sonata-svn')
provides=('sonata')
optdepends=('gnome-python-extras: for enhanced system tray support'
	    'tagpy: for tag editing functionality'
	    'zsi: for lyric fetching functionality'
	    'dbus-python: for various extra functionality (see sonata man page)')
source=(http://download.berlios.de/sonata/sonata-$pkgver.tar.bz2 disable_autocenter.patch)
md5sums=('9506af4158076bba7ffe5ce5f80485af' 'fa81645dbdd4545dc7a6e85792209068')

build() {
  cd ${srcdir}/sonata-$pkgver
  patch sonata/main.py ${srcdir}/disable_autocenter.patch
  python setup.py install --root=${pkgdir}
}

