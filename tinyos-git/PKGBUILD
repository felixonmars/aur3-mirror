# Maintainer: aphet <aphet83@gmail.com>
# Contributor: Andras Biro <bbandi86@gmail.com>
pkgname=tinyos-git
pkgver=20100503
pkgrel=1
pkgdesc="Small operating system for sensor motes, embedded devices"
arch=('i686' 'x86_64')
license=(GPL)
options=(!libtool)
url="http://www.tinyos.net/"
depends=('glibc' 'nesc')
makedepends=('git')
optdepends=(avr-libc avrdude binutils-avr gcc-avr jdk jre)
source=(tinyos.profile)
md5sums=('8275b06a188620150fb08facc1c34bd2')

_gitroot="git://hinrg.cs.jhu.edu/git/tinyos-2.x.git"
_gitname="tinyos-2.x"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
	cd $_gitname && git pull origin
	msg "The local files are updated."
  else
	git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  install -d ${pkgdir}/opt
  cp -aR ${srcdir}/${_gitname}/ ${pkgdir}/opt
  install -D -m755 ${srcdir}/tinyos.profile ${pkgdir}/etc/profile.d/${pkgname}.sh

  if [ "${CARCH}" = "x86_64" ]; then
    sed 's/JNIVERSIONS="-32. -64."/JNIVERSIONS="-64."/' ${srcdir}/${_gitname}/tools/configure.ac > ${srcdir}/${_gitname}/tools/configure.new
  else
    sed 's/JNIVERSIONS="-32. -64."/JNIVERSIONS="-32."/' ${srcdir}/${_gitname}/tools/configure.ac > ${srcdir}/${_gitname}/tools/configure.new
  fi
  mv -f ${srcdir}/${_gitname}/tools/configure.new ${srcdir}/${_gitname}/tools/configure.ac
  cd ${srcdir}/${_gitname}-build/tools/
  ./Bootstrap
  cd ${srcdir}/${_gitname}-build/tools/platforms/mica/uisp/
  ./bootstrap
  cd ${srcdir}/${_gitname}-build/tools
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="${pkgdir}/" install
  
  jni=${pkgdir}`/${pkgdir}/usr/bin/tos-locate-jre --jni`
  if [ $? -eq 0 ]; then
    if [ "${CARCH}" = "x86_64" ]; then
      bits=64
    else
      bits=32
    fi
    echo "Installing $bits-bit Java JNI code in $jni ... "
    for lib in ${pkgdir}/usr/lib/tinyos/*.so; do 
      realname=`basename $lib | sed -e s/-$bits\.so/.so/`
      install -D $lib "$jni/$realname" || exit 1
    done
    echo "done."
  fi

}
