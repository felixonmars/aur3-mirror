# Maintainer: Jakub Kozisek <nodevel at gmail dot com>

pkgname=series60-remote-svn
pkgver=806
pkgrel=3
pkgdesc="An application for managing your S60 mobile phone."
arch=('i686' 'x86_64')
url="http://series60-remote.sourceforge.net"
license=('GPLv2')
depends=('python2' 'python2-qt' 'python-pybluez' 'obexftp')
makedepends=('subversion' 'python25')
optdepends=('python-vobject: for exporting/importing contacts in vobject format'
	    'python2-ldap: for exporting/importing contacts in ldap format'
	    'python2-matplotlib: for generating messages statistics')
provides=('series60-remote')
conflicts=('series60-remote' 'series60-remote-devel')

_svnmod="series60-remote"
_svntrunk="https://series60-remote.svn.sourceforge.net/svnroot/series60-remote/trunk"

build() {
cd ${srcdir}

  msg "Getting sources..."
  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up -r ${pkgver})
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
    cd ${_svnmod}
  fi

    msg "SVN checkout done or server timeout"
  cd ${srcdir}/${_svnmod}/pc
  python2 mkpyqt.py
  cd ../mobile

    msg "Preparing s60 SIS package."
    msg "To build a SIS package, this script needs to download 'ensymble' (http://code.google.com/p/ensymble) and pys60 (https://garage.maemo.org/projects/pys60/). Both are available under GNU GPL and both will be deleted after installation."
    mkdir ensymble2
    mkdir ensymble1.4
    cd ensymble2
    wget https://garage.maemo.org/frs/download.php/7486/PythonForS60_2.0.0.tar.gz
    tar xvzf PythonForS60_2.0.0.tar.gz
    cd ../ensymble1.4
    wget http://ensymble.googlecode.com/files/ensymble_python2.5-0.28.py
    cd ..
    sed -i 's|ENSYMBLE_PY14=$HOME/ensymble/pys60-1.4/ensymble.py|ENSYMBLE_PY14=./ensymble1.4/ensymble_python2.5-0.28.py|' create_package
    sed -i 's|ENSYMBLE_PY20_DIR=$HOME/ensymble/pys60-2.0|ENSYMBLE_PY20_DIR=./ensymble2/PythonForS60|' create_package
  ./create_package
  rm -rf ensymble2
  rm -rf ensymble1.4

  cd ../pc
  ./generate-pro.sh
  cd ..
  
  python2 setup.py install --prefix=$pkgdir/usr || return 1
}