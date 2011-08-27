# Maintainer: Bernd Prünster <bernd.pruenster@gmail.com>
pkgname=slackerbot-svn
pkgver=LATEST
pkgrel=1
pkgdesc="A simple MarkDown editor written in pyGtk"
arch=(any)
url="https://code.google.com/p/slackerbot-gtk-markdown-editor/"
license=("GPL")
depends=('python2' 'python-markdown' 'pywebkitgtk')
makedepends=('subversion')

_svntrunk="http://slackerbot-gtk-markdown-editor.googlecode.com/svn/trunk/"
_svnmod="${srcdir}/${pkgname}-${pkgver}"

build() {
  msg "Connecting to SVN"
  if [ -d ${_svnmod}/.svn ]; then
    msg "Starting SVN update"
    (cd ${_svnmod} && svn up)

  else
    msg "Starting SVN checkout"
    svn co ${_svntrunk} ${_svnmod}
  fi
  msg "SVN checkout done or server timeout"

  msg "Starting build"
  cd ${_svnmod}

  mkdir $pkgdir/usr
  mkdir $pkgdir/usr/bin
  cp "${srcdir}/${pkgname}-${pkgver}/sbgtkmarkdown.py" $pkgdir/usr/bin

  msg "Patching for python2..."
  sed -i "s|#!/usr/bin/python|#!/usr/bin/env python2|g" $pkgdir/usr/bin/sbgtkmarkdown.py
  chmod 755 $pkgdir/usr/bin/sbgtkmarkdown.py
  chown -R root $pkgdir/usr/bin/sbgtkmarkdown.py

  msg "Creating .desktop file"
  echo [Desktop Entry] >> ${srcdir}/slackerbot.desktop
  echo Type=Application >> ${srcdir}/slackerbot.desktop
  echo Version=1.0 >> ${srcdir}/slackerbot.desktop
  echo Name=Slackerbot >> ${srcdir}/slackerbot.desktop
  echo Exec=sbgtkmarkdown.py >> ${srcdir}/slackerbot.desktop
  echo Icon=accessories-text-editor >> ${srcdir}/slackerbot.desktop
  echo Categories="GTK;Office;Publishing;" >> ${srcdir}/slackerbot.desktop
  mkdir $pkgdir/usr/share
  mkdir $pkgdir/usr/share/applications
  cp "${srcdir}/slackerbot.desktop" $pkgdir/usr/share/applications
  chmod 755 $pkgdir/usr/share/applications

}
