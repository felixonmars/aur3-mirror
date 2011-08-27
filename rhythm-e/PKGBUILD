pkgname=rhythm-e
pkgver=41
pkgrel=2
pkgdesc="Elementary version of Rhythmbox"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.rhythmbox.org"
depends=('libsoup-gnome>=2.29.91' 'gnome-media>=2.29.91' 'totem-plparser>=2.29.92' 'musicbrainz>=2.1.5' 'libnotify>=0.4.5' 'desktop-file-utils' 'gstreamer0.10-python>=0.10.17' 'gstreamer0.10-base-plugins' 'gstreamer0.10-good-plugins' 'pygtk>=2.17.0' 'gvfs>=1.5.5' 'hicolor-icon-theme')
makedepends=('pkgconfig' 'gnome-doc-utils>=0.19.5' 'intltool' 'bzr' 'gnome-common')
optdepends=('gstreamer0.10-ugly-plugins: Extra media codecs'
            'gstreamer0.10-bad-plugins: Extra media codecs'
            'gstreamer0.10-ffmpeg: Extra media codecs'
            'brasero: cd burning'
            'gnome-python: various plugins'
            'pywebkitgtk: context panel plugin'
            'python-mako: context panel plugin')
provides=('rhythmbox')
conflicts=('rhythmbox')
options=('!libtool' '!emptydirs')
source=("gnome-media-profiles-fix.patch")
install=rhythm-e.install

_bzrmod=$pkgname
_bzrtrunk="https://code.launchpad.net/$pkgname"

build() {

  if [ -d $_bzrmod ]; then
    cd $_bzrmod && bzr up && cd ..
  else
    bzr co $_bzrtrunk
  fi

  cp -r ${srcdir}/${pkgname} ${srcdir}/${pkgname}-build

  cd "${srcdir}/${pkgname}-build"

  # fix naming issues for gnome-media-profiles
  patch -Np1 -i "${srcdir}/gnome-media-profiles-fix.patch"

  export PYTHONPATH="/usr/lib/python2.7"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/rhythmbox \
      --localstatedir=/var --disable-static \
      --enable-python \
      --with-mdns=avahi --disable-scrollkeeper \
      --disable-ayatana || return 1

  # Disable compilation of ayatana plugin
  # sed -i 's/ayatana//' plugins/Makefile || return 1

  make
}

package() {
  cd ${srcdir}/${pkgname}-build
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" --domain rhythmbox ${pkgdir}/etc/gconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas

  rm -rf ${srcdir}/${pkgname}-build
}
md5sums=('20cb09b20c8b83484e1f8914a38cffe9')
