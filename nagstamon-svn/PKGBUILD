pkgname=nagstamon-svn
_pkgname=nagstamon
pkgver=644
pkgrel=2
pkgdesc="Nagstamon is a Nagios status monitor for the desktop"
arch=('i686' 'x86_64')
url="http://nagstamon.sourceforge.net"
license=('GPL')
depends=('python2' 'pygtk' 'gnome-python-extras' 'python2-lxml' 'python-rsvg' 'python2-distribute')
conflicts=(nagstamon)

source=(nagstamon.desktop nagstamon-autostart.desktop)
md5sums=('cbb32d63215d2dbe4dee3ce89caa0b15'
         'd257236c7dd060e2f4700f09cc9eff44')

_svntrunk="https://nagstamon.svn.sourceforge.net/svnroot/nagstamon/trunk/Nagstamon"
_svnmod="nagstamon"

build() {
  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Preparing..."

  [ -d $srcdir/$_svnmod-build ] && rm -r $srcdir/$_svnmod-build
  svn export $_svnmod $_svnmod-build
  cd $_svnmod-build

  msg "Starting build ..."

  mkdir -p $pkgdir/usr/bin
  ln -s /usr/share/nagstamon/nagstamon.py $pkgdir/usr/bin/nagstamon
  mkdir -p $pkgdir/usr/share/nagstamon
  cp -R * $pkgdir/usr/share/nagstamon/
  chmod a+x $pkgdir/usr/share/nagstamon/nagstamon.py
  install -D -m644 $srcdir/nagstamon.desktop $pkgdir/usr/share/applications/nagstamon.desktop
  install -D -m644 $srcdir/nagstamon-autostart.desktop $pkgdir/etc/xdg/autostart/nagstamon.desktop

  rm -r $pkgdir/usr/share/nagstamon/installer

  sed -i 's|/usr/bin/env python|/usr/bin/env python2|' $pkgdir/usr/share/nagstamon/nagstamon.py
}
