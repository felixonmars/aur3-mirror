# Maintainer: Sirat18 <aur@sirat18.de>
# Contributor: markelos <axilleas@archlinux.gr>
# Contributor: helios <aur@wiresphere.de>
pkgname=spark-svn
pkgver=13102
pkgrel=1
pkgdesc="Cross-platform real-time collaboration client optimized for business and organizations. SVN version"
arch=('i686' 'x86_64')
url="http://www.igniterealtime.org/projects/spark/"
license=('LGPL')
if [[ $CARCH == x86_64 ]]; then
        depends=('java-environment' 'unixodbc' 'lib32-libxtst')
fi
if [[ $CARCH == i686 ]]; then
        depends=('java-environment' 'unixodbc' 'libxtst')
fi
makedepends=('apache-ant' 'subversion')
options=('!strip')

conflicts=('spark')
provides=('spark')

_svntrunk="http://svn.igniterealtime.org/svn/repos/spark/trunk"
_svnmod=spark

build() {
  cd "$srcdir"

  # CHECKOUT  
  msg "Connecting to SVN server...."
  if [ -d "$_svnmod/.svn" ]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r \
      "$pkgver" "$_svnmod"
  fi
  msg "SVN checkout done or server timeout"
  
  # COPY TO BUILD DIR
  msg "Copying files to build directory..."
  rm -rf $_svnmod-build
  svn export $_svnmod $_svnmod-build
  cd $_svnmod-build

  # BUILD
  msg "Building..."
  ant -f build/build.xml release
}


package() {
  cd "$srcdir/$_svnmod-build/target/build"
  
  install -d -m755 "${pkgdir}/opt/spark"
  cp -R * "${pkgdir}/opt/spark"
  
  install -d -m755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/spark" << EOF
#!/bin/sh
/opt/spark/bin/startup.sh $@
EOF
  chmod 755 "${pkgdir}/usr/bin/spark"
}
