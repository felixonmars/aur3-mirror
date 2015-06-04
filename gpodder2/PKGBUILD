# Maintainer: qs9rx < that nick at enjoys dÃƒÂ¶t it>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: enderst <enderst@gmail.com>

pkgname=gpodder2
pkgver=2.20.3
pkgrel=1
pkgdesc='A podcast receiver/catcher'
license=('GPL3')
arch=('any')
url='http://gpodder.org/'
depends=('pygtk' 'python2-feedparser' 'dbus-python' 'python2-mygpoclient')
makedepends=('intltool' 'imagemagick' 'help2man')
optdepends=('libgpod: for ipod support'
            'pymad: for ipod support'
            'mplayer: for ipod video support'
            'python-imaging: rockbox cover art support'
            'vorbis-tools: for ogg tag updating and converting to mp3'
            'lame: for converting ogg to mp3'
            'gnome-bluetooth: transfer podcast via bluethooth'
            'pywebkitgtk: render shownotes'
            'python-eyed3: for ipod support')
            # pymtp: for mtp support (AUR only)
source=("http://gpodder.org/src/gpodder-${pkgver}.tar.gz"
'gpodder-toomanyvaluestounpack.patch')
sha1sums=('1f58c7d96c4e62cf20d682123ca35bae653bb096'
'd4cf247fea60e4b54270891392e0e907d0351649')

prepare() {
 cd "${srcdir}"/gpodder-${pkgver}
 patch -p1 -i "${srcdir}"/gpodder-toomanyvaluestounpack.patch 
}

package() {
  cd ${srcdir}/gpodder-${pkgver}
  PYTHON=python2 make DESTDIR=${pkgdir}/ install

  sed -i -e 's|#!/usr/bin/python$|#!/usr/bin/python2|' \
         -e 's|#!/usr/bin/env python$|#!/usr/bin/env python2|' \
    $(find $pkgdir/usr/lib/python2.7/site-packages/gpodder/ -name '*.py')
}
