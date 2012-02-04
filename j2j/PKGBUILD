pkgname=j2j
pkgver=128
pkgrel=1
pkgdesc="jabber -> jabber jabber transport"
arch=(i686 x86_64)
url="http://wiki.jrudevels.org/Eng:J2J"
license=('GPL')
depends=('python' 'twisted' 'pyopenssl')
backup=(etc/ejabberd/)
options=('emptydirs')
source=(j2j.rc)
md5sums=('ecee7b8540f4cc6504f052cbc0305d8f')

_svntrunk=https://svn.jrudevels.org/j2j/trunk
_svnmod=j2j

build() {
  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf $srcdir/$_svnmod-build
  cp -r $srcdir/$_svnmod $srcdir/$_svnmod-build
  cd $srcdir/$_svnmod-build

  #
  # BUILD
  #
  mkdir -p $pkgdir/usr/share/j2j $pkgdir/etc/ejabberd/ $pkgdir/var/run/j2jt
  cp *.py *.schema $pkgdir/usr/share/j2j/ && \
  cp j2j.conf.example $pkgdir/etc/ejabberd/ && \
  cp $pkgdir/etc/ejabberd/j2j.conf.example $pkgdir/etc/ejabberd/j2j.conf && \
  ln -s ../../../etc/ejabberd/j2j.conf $pkgdir/usr/share/j2j/j2j.conf
  install -D -m0755 ../j2j.rc $startdir/pkg/etc/rc.d/$pkgname
}
