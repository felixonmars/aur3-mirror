# Contributor: Flamelab <panosfilip@gmail.com>

pkgname=qspeedtest-svn
pkgver=53
pkgrel=2
pkgdesc="A GUI tool written in C++ and Qt for evaluating the latency and speed of an Internet or LAN access by pinging and concurrently downloading test files from a customizable list of target servers." 
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/qspeedtest/"
license=('GPL3')
depends=('qt>=4.6.2')
makedepends=('subversion')
source=("qspeedtest.desktop" "fix-whatismyip-automation-url.patch")

_svnmod="qspeedtest"
_svntrunk=https://qspeedtest.svn.sourceforge.net/svnroot/qspeedtest 


build() 

{
     cd "${srcdir}"

     if [ -d $_svnmod/.svn ]; then
          (cd $_svnmod && svn up -r $pkgver)
     else
          svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
     fi

     msg "SVN checkout done or server timeout"
     msg "Starting make..."

     if [ -d $_svnmod-build ];then
        rm -r $_svnmod-build
     fi
     cp -r $_svnmod $_svnmod-build
     cd $_svnmod-build

     patch -Np0 -i ${srcdir}/fix-whatismyip-automation-url.patch

     qmake qspeedtest.pro
     make

}

package() {

        cd ${srcdir}/$_svnmod-build
        mkdir -p ${pkgdir}/{usr/bin,usr/share/qspeedtest,usr/share/applications}
        install -Dm755 bin/qspeedtest ${pkgdir}/usr/bin/qspeedtest
        install -Dm644 gui/logo.png ${pkgdir}/usr/share/qspeedtest
        install -Dm644 ${srcdir}/qspeedtest.desktop ${pkgdir}/usr/share/applications
#       install -m755 cli/qspeedtestcli ${pkgdir}/usr/bin/qspeedtestcli # TEMPORARILY disabled

}

md5sums=('a608203d2b24d40d71a7a4085af9f93c'
         'feadf84753c11bfd13e1e1c5aa9a5fd2')
