# Maintainer: Arch Linux Pro Audio <dev@archaudio.org>
# Contributor: svoufff <svoufff at gmail dot com>
pkgname=jlscp-cvs
pkgver=20090722
pkgrel=1
pkgdesc="A java LinuxSampler control protocol API."
arch=('i686' 'x86_64')
options=('')
url="http://www.linuxsampler.org/"
license=('GPL')
depends=('java-runtime' 'linuxsampler')
makedepends=('cvs' 'java-environment' 'apache-ant')
conflicts=('jlscp')
provides=('jlscp')
source=()
md5sums=()

_cvsroot=":pserver:anonymous@cvs.linuxsampler.org:/var/cvs/linuxsampler"
_cvsmod="jlscp"

build() {
  cd $srcdir/

  msg "Connecting to cvs.linuxsampler.org"

  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs update -d -P
  else
    cvs -z3 -d$_cvsroot co $_cvsmod
    cd $_cvsmod
  fi

  msg "CVS checkout done or server timeout"

  cp -r ../$_cvsmod ../$_cvsmod-build
  cd $srcdir/$_cvsmod-build
  . /etc/profile

  msg "Starting ant..."

  ant build-lib

  install -Dm0644 lib/jlscp.jar "$pkgdir/usr/share/java/jlscp/jlscp.jar"
  rm -rf $srcdir/$_cvsmod-build
}

