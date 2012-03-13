# Maintainer: Andras Biro <bbandi86@gmail.com>
pkgname=tinyos-tools-svn
pkgver=20120313
pkgrel=1
pkgdesc="Development-tools for TinyOS"
arch=('i686 x86_64')
license=('GPL')
options=(!libtool)
url="http://www.tinyos.net/"
depends=('python' 'bash' 'nesc' 'jre' 'tinyos')
provides=('tinyos-tools')
makedepends=('subversion')
_svnroot="http://tinyos-main.googlecode.com/svn/trunk/tools"
_svnmod="${pkgname}-${pkgver}/tools"

build() {

  if [ -d $_svnmod/.svn ]; then
    cd $_svnmod
    svn update
  else
    svn checkout $_svnroot $_svnmod
    cd $_svnmod
  fi
  msg "SVN checkout/update done or server timeout"
  
  #don't build the libraries for both architecture
  if [ "${CARCH}" == "x86_64" ]; then
    sed -i 's/JNIVERSIONS="-32. -64."/JNIVERSIONS="-64."/' ${srcdir}/${pkgname}-${pkgver}/tools/configure.ac
  else
    sed -i 's/JNIVERSIONS="-32. -64."/JNIVERSIONS="-32."/' ${srcdir}/${pkgname}-${pkgver}/tools/configure.ac
  fi

  #change python to python2 where needed
  sed -i 's/ python/ python2/' ${srcdir}/${pkgname}-${pkgver}/tools/configure.ac
  #this is not needed anymore, but I leave it as a comment. someone might forget about @pathpython@ again
#   for pyfile in `grep -ld recurse '#!.*[/, ]python' *`
#   do
#     sed -i 's/#!.*python/#!\/usr\/bin\/env python2/' $pyfile
#   done
 
  #setting up tinyos variables if needed
  if [ "${TOSDIR}" == "" ]; then
    if [ -f /etc/profile.d/tinyos.sh ]; then
      source /etc/profile.d/tinyos.sh
    fi
  fi
 
  
  cd ${srcdir}/${pkgname}-${pkgver}/tools/
  ./Bootstrap
  cd ${srcdir}/${pkgname}-${pkgver}/tools
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
