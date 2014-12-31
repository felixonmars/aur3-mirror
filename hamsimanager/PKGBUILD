# Maintainer: Giovanne Castro <giovannefc@gmail.com>
# Contributor: ex-maintainer: Pafrape <pafrape@free.fr>
# Contributor: ex-maintainer: Jack Birdsong <jwbirdsongATgmailDOTcom>

pkgname=hamsimanager
_realname=HamsiManager
pkgver=2.0
pkgrel=1
pkgdesc="Hamsi Manager is a file manager, renamer, id3 tagger, information changer and others tools."
install="hamsi.install"
arch=('any')
url="http://supermurat.com/en/Hamsi-Manager"
license=('GPL3')
depends=('python2' 'mplayer')
optdepends=('kde-meta-kdebase' 'phonon-qt4: optional music player' 'python2-eyed3: Better ID3 support mp3' 'mutagen: Alternative ID3 support mp3' 'python2-musicbrainz2: Access to MusicBrainz Database' )
provides=(hamsimanager)
conflicts=(hamsimanager-svn)
source=(http://downloads.sourceforge.net/project/hamsimanager/$_realname-$pkgver.tar.gz \
             HamsiManager.desktop hamsi.sh hamsi.install)

md5sums=('cb653a549f46f78c1e6359a3c52233bb'
	 '5c3a64947e5b6eb610ebc8c80109124c'
         'c9703121b3268669efa01b0606edf01b'
         'db3d3b274d6592487303154e5db4bad7')

package() {
  cd "$srcdir/$_realname"
sed -i "s|#!/usr/bin/env python|#!/usr/bin/env python2|"  HamsiManager.py 
install -d $pkgdir/{usr/bin/,usr/share/hamsi/}

 mv $srcdir/$_realname/*  $pkgdir/usr/share/hamsi
# Install Desktop File
    install -D -m644 $srcdir/HamsiManager.desktop \
        $pkgdir/usr/share/applications/HamsiManager.desktop
# Install the Launcher
    install -D -m755 $srcdir/hamsi.sh \
        $pkgdir/usr/bin/hamsi
# Install Icons
  for _i in 16 256; do
    install -Dm644 $pkgdir/usr/share/hamsi/Themes/Default/Images/$_realname-${_i}x${_i}-1.png \
      "$pkgdir/usr/share/icons/hicolor/${_i}x${_i}/apps/hamsi.png"
  done
    install -Dm644 $pkgdir/usr/share/hamsi/Themes/Default/Images/hamsi.png \
      "$pkgdir/usr/share/icons/hicolor/128x128/apps/hamsi.png"
}
