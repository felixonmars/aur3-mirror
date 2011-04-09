# Maintainer: Guten <ywzhaifei@gmail.com>
# Contributor: Liu Chang <goduck777@gmail.com>

pkgname=wallproxy-svn
pkgver=89
pkgrel=1
pkgdesc="A http proxy based on GAppProxy."
arch=('i686' 'x86_64')
url="http://code.google.com/p/wallproxy/"
license=('GPL')
depends=('python2' 'python2-pyopenssl')
conflicts=('wallproxy')
provides=('wallproxy')
source=(wallproxy.png 
        wallproxy.desktop
        daemon.wallproxy)
md5sums=('b06d28e58fc2791c990638a943a82099'
         '6f5192812ee5f5969964b5b6dae819f2'
         'dd3287bc1f4b9f9feab55060d223ee65')
backup=('etc/wallproxy.conf')

_svntrunk="http://wallproxy.googlecode.com/svn/trunk/"
_svnmod="wallproxy"

build() { 
  cd $srcdir

  msg "Connecting to SVN server...."
  svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod

  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  svn export $_svnmod $_svnmod-build
  cd $_svnmod-build

  #
  # Build
  #

  sed -i -re "s|^(#!.*python)|\12|" local/*.py
  chmod +x local/startup.py

  mkdir -p $pkgdir/etc/rc.d
  cp $startdir/daemon.wallproxy $pkgdir/etc/rc.d/wallproxy

  mkdir -p $pkgdir/opt/wallproxy/
  cp -R ./* $pkgdir/opt/wallproxy/

  mkdir -p $pkgdir/etc
  mv $pkgdir/opt/wallproxy/local/proxy.conf $pkgdir/etc/wallproxy.conf
  ln -s $pkg/etc/wallproxy.conf $pkgdir/opt/wallproxy/local/proxy.conf

  # make desktop shortcut
  mkdir -p $pkgdir/usr/share/pixmaps/
  mkdir -p $pkgdir/usr/share/applications/
  cp $startdir/wallproxy.png $pkgdir/usr/share/pixmaps/
  cp $startdir/wallproxy.desktop $pkgdir/usr/share/applications/
}


# vim:set ts=2 sw=2 et:
