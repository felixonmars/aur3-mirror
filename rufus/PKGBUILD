# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>

pkgname=rufus
pkgver=0.7.0
pkgrel=1
pkgdesc="Bittorrent client based on Python"
url="http://rufus.sourceforge.net"
license="GPL"
depends=('python' 'wxpython')
source=(http://dl.sourceforge.net/sourceforge/rufus/Rufus_${pkgver}_src.zip \
	rufus rufus.desktop)
md5sums=('902ba975d838a670b2ae74ffaa7c5bc8' '3d449c13dc4095a9dbb3dfa849717b8c'\
         '001f9dafaf9757f0c196c187128f9c61')

build() {
  # There is no good installer yet, so installation must be done manually
  cd $startdir/src
  
  install -D --mode=755 rufus $startdir/pkg/usr/bin/rufus

  install -d $startdir/pkg/usr/lib/python2.4/site-packages/rufus
  install --mode=644 * $startdir/pkg/usr/lib/python2.4/site-packages/rufus

  install -d $startdir/pkg/usr/lib/python2.4/site-packages/rufus/BitTorrent
  install --mode=644 BitTorrent/* $startdir/pkg/usr/lib/python2.4/site-packages/rufus/BitTorrent

  install -d $startdir/pkg/usr/lib/python2.4/site-packages/rufus/images
  install --mode=644 images/* $startdir/pkg/usr/lib/python2.4/site-packages/rufus/images

  install -d $startdir/pkg/usr/lib/python2.4/site-packages/rufus/images/flags
  install --mode=644 images/flags/* $startdir/pkg/usr/lib/python2.4/site-packages/rufus/images/flags

  install -d $startdir/pkg/usr/lib/python2.4/site-packages/rufus/locale/en/LC_MESSAGES
  install --mode=644 locale/en/LC_MESSAGES/* $startdir/pkg/usr/lib/python2.4/site-packages/rufus/locale/en/LC_MESSAGES

  install -d $startdir/pkg/usr/lib/python2.4/site-packages/rufus/locale/h4/LC_MESSAGES
  install --mode=644 locale/h4/LC_MESSAGES/* $startdir/pkg/usr/lib/python2.4/site-packages/rufus/locale/h4/LC_MESSAGES
  
  install -d $startdir/pkg/usr/share/pixmaps
  install --mode=644 images/rufus.ico $startdir/pkg/usr/share/pixmaps/rufus.ico

  install -d $startdir/pkg/usr/share/applications
  install --mode=644 rufus.desktop $startdir/pkg/usr/share/applications/rufus.desktop
  
  # Removing unwanted files
  rm -f $startdir/pkg/usr/lib/python2.4/site-packages/rufus/Rufus_*
  rm -f $startdir/pkg/usr/lib/python2.4/site-packages/rufus/rufus
  rm -f $startdir/pkg/usr/lib/python2.4/site-packages/rufus/rufus.desktop
  rm -f $startdir/pkg/usr/lib/python2.4/site-packages/rufus/*.bat
  
  python -OO -c "import compileall; compileall.compile_dir('$startdir/pkg/usr/lib/python2.4/site-packages/rufus')"
}
