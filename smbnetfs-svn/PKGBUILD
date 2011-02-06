# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>
pkgname=smbnetfs-svn
pkgver=102
pkgrel=3
pkgdesc="Small C program that mounts Microsoft network neighborhood in single directory."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/smbnetfs"
license=('GPL')
depends=(fuse smbclient sudo)
makedepends=(subversion gcc make autoconf automake)
provides=(smbnetfs)
conflicts=(smbnetfs)
install=smbnetfs.install
source=(rc-smbnetfs conf-smbnetfs)
md5sums=('c3e301170c81188b10c36aaec5329732'
         'e150c4cd894cc6ade11b94c95cf17ec4')

_svntrunk=https://smbnetfs.svn.sourceforge.net/svnroot/smbnetfs/branches/smbnetfs-0.3
_svnmod=smbnetfs

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -r $srcdir/$_svnmod-build
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  #
  # BUILD
  #
  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install && \
  mkdir -p $pkgdir/etc/smbnetfs/.smb && \
  install -D -m 0644 doc/smbnetfs.conf $pkgdir/etc/smbnetfs/.smb/smbnetfs.conf && \
  install -D -m 0644 doc/INSTALL $pkgdir/usr/share/smbnetfs/INSTALL && \
  install -D -m 0644 README $pkgdir/usr/share/smbnetfs/README && \
  install -D -m 0755 $srcdir/rc-smbnetfs $pkgdir/etc/rc.d/smbnetfs && \
  install -D -m 0644 $srcdir/conf-smbnetfs $pkgdir/etc/conf.d/smbnetfs && \
  touch $pkgdir/etc/smbnetfs/.smb/smb.conf
}
