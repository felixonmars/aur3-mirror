# Maintainer: archtux <antonio.arias99999@gmail.com>

pkgname=totem-git
pkgver=V.3.15.90.r13.g6b07c5a
pkgrel=1
pkgdesc="A GNOME3 integrated movie player(GIT version) based on Gstreamer."
url="https://wiki.gnome.org/Apps/Videos"
arch=('i686' 'x86_64')
license=('GPL2')
depends=(desktop-file-utils gst-plugins-base gstreamer iso-codes gsettings-desktop-schemas-git dconf python-gobject python-xdg python2 totem-plparser libpeas clutter-gtk grilo-git grilo-plugins-git clutter-gst-git python-xdg gst-plugins-good gst-plugins-bad)
optdepends=('gst-plugins-ugly: Extra media codecs'
            'gst-libav: Extra media codecs'
			'lirc-utils: Infrared Remote Control plugin'
			'grilo-plugins: Media discovery'
			'zeitgeist: Zeitgeist plugin'
			'python-dbus: MPRIS plugin')
makedepends=(intltool nautilus-git lirc vala zeitgeist itstool docbook-xsl python-pylint)
conflicts=('totem')
source=("git+git://git.gnome.org/totem" "totem.install")
md5sums=('SKIP'
         'cf39ffbe65a507faded8b4c92bc3e352')

pkgver() {
cd "totem"

git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' | sed s/_/./g
}

build() {
  	cd "totem"

  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
                   --libexecdir=/usr/lib/totem \
                          --localstatedir=/var \
                              --disable-static \
                              --enable-python \
                            --enable-nautilus \
  make
}
  package(){
  cd "totem"	  
  make DESTDIR=$pkgdir install
}
