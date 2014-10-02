# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: skydrome <skydrome@i2pmail.org>
# Contributor: drewbs

# Includes a tweaked patch (since it didn't work without it) [1] for this bug [2]:
#  [1] https://bugzilla.redhat.com/attachment.cgi?id=461916&action=diff
#  [2] http://sourceforge.net/tracker/?func=detail&aid=1658720&group_id=239&atid=100239
#      "When selecting some text, xchat claims not only PRIMARY but also CLIPBOARD.
#       This is incredibly annoying and inconsistent with how other X11 applications work.
#       CLIPBOARD should only be claimed when explicitly copying stuff (i.e. C-c)."

_pkgname=xchat
pkgname=xchat-svn
pkgver=r1525
pkgrel=1
pkgdesc='A full-featured GTK+ IRC client.'
arch=('i686' 'x86_64')
url='http://www.xchat.org'
license=('GPL')
depends=('gtk2' 'openssl' 'perl' 'python2' 'tcl' 'libnotify' 'libsexy' 'hicolor-icon-theme')
makedepends=('subversion' 'librsvg')
optdepends=('enchant: for spell checking support'
			'aspell-en: for spelling dictionaires of your choice')
conflicts=('xchat')
provides=('xchat')
options=('!libtool')
install=xchat.install
source=("$_pkgname::svn://svn.code.sf.net/p/$_pkgname/svn/"
		'http://xchat.org/files/icons/xchat-svg.tar.bz2'
		'selection-copy.patch')
sha1sums=('SKIP'
          '0d366346cc11e0efb57fc2648fe423c94a3469bd'
          'febd624e0e94ca48bc0d50dcb03db6d113f73b72')


pkgver() {
  cd "$_pkgname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd $_pkgname
  patch -Np1 -i "${srcdir}/selection-copy.patch"
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh
  ./configure --prefix=/usr \
        --enable-ipv6 --enable-openssl --enable-shm \
        --disable-dbus --enable-spell=libsexy
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install

  for i in 24 32 48 64 128 256 ;do
    install -d "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps"
    rsvg-convert -w $i -h $i -o "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/xchat.png" ../xchat-cloned.svg
  done
  install -D -m644 ../xchat-cloned.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/xchat.svg"
  install -D -m644 ../xchat-used.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/xchat2.svg"
}
