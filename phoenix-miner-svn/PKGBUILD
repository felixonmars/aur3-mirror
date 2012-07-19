# Maintainer: fnord0 <fnord0 AT riseup DOT net>

pkgname=phoenix-miner-svn
pkgver=103
pkgrel=3
pkgdesc="Phoenix miner - efficient, fast, modular, python-based, openCL GPU bitcoin miner"
arch=('i686' 'x86_64')
url="https://bitcointalk.org/?topic=6458.0"
license=('BSD')
depends=('python2' 'python2-pyopencl' 'twisted' 'boost' 'python2-numpy')
makedepends=('subversion')

_svnroot="http://svn3.xp-dev.com/svn/phoenix-miner/trunk/"
_svnmod="phoenix-miner"

build() {
  if [ -d ${srcdir}/.svn ]; then
    msg 'Updating SVN...'
    svn up ${srcdir} || return 1
  else
    msg 'Checking out SVN...'
    svn co ${_svnroot} ${srcdir} || return 1
  fi
  msg "SVN checkout done or server timeout"
}

package() {
  msg "Creating package..."
  mkdir -p ${pkgdir}/usr/src  || return 1
  mkdir -p ${pkgdir}/usr/bin  || return 1
  mkdir -p ${pkgdir}/usr/share/licenses/${_svnmod} || return 1
  cd ${pkgdir}/usr/src
  cp -R ${srcdir} ${_svnmod} || return 1
  cd ${pkgdir}/usr/src/${_svnmod}
  grep -rl "/usr/bin/python" ${pkgdir}/usr/src/${_svnmod}/ | xargs sed -i 's|/usr/bin/python|/usr/bin/python2|g' || return 1
  chmod 755 ${pkgdir}/usr/src/${_svnmod}/phoenix.py || return 1
  head -22 ${pkgdir}/usr/src/${_svnmod}/phoenix.py > ${pkgdir}/usr/share/licenses/${_svnmod}/LICENSE || return 1
  sed -i '1,2d' ${pkgdir}/usr/share/licenses/${_svnmod}/LICENSE || return 1

  # create startup app
  echo "#!/bin/sh" > ${pkgdir}/usr/bin/${_svnmod} || return 1
  echo "cd /usr/src/phoenix-miner" >> ${pkgdir}/usr/bin/${_svnmod} || return 1
  echo "#python2 ./phoenix.py -u http://USERNAME:PASSWORD@bitcoinpool.com:8332/ -k poclbm DEVICE=0 BFI_INT VECTORS AGGRESSION=11 WORKSIZE=128" >> ${pkgdir}/usr/bin/${_svnmod} || return 1
  echo "#python2 ./phoenix.py -u http://LOGIN@GMAIL.COM:PASSWORD@pit.deepbit.net:8332/ -k poclbm DEVICE=0 VECTORS BFI_INT WORKSIZE=128 AGGRESSION=11" >> ${pkgdir}/usr/bin/${_svnmod} || return 1
  echo "#python2 ./phoenix.py -u http://USERNAME.WORKERNAME:PASSWORD@mining.bitcoin.cz:8332/ -k poclbm DEVICE=0 VECTORS AGGRESSION=3" >> ${pkgdir}/usr/bin/${_svnmod} || return 1
  echo "python2 ./phoenix.py \"\$@\"" >> ${pkgdir}/usr/bin/${_svnmod} || return 1
  echo "cd -" >> ${pkgdir}/usr/bin/${_svnmod} || return 1
  chmod +x ${pkgdir}/usr/bin/${_svnmod} || return 1

  #user notification
  echo -e ""
  echo -e "\e[1;31m[\e[0m\e[1;34m*\e[0m\e[1;31m]\e[0m \e[1;31mrun '\e[0m\e[1;34m/usr/bin/phoenix-miner -h\e[0m\e[1;31m' for an explanation of startup options\e[0m"
  echo -e "\e[1;31m[\e[0m\e[1;34m*\e[0m\e[1;31m]\e[0m \e[1;31mthere are 3 sample command lines listed in the file '\e[0m\e[1;34m/usr/bin/phoenix-miner\e[0m\e[1;31m', \e[1;32mUNCOMMENT\e[0m the one you wish to use. make sure to configure your \e[1;34mUSERNAME \e[0m+\e[1;34m PASSWORD\e[0m +\e[1;34m POOLSERVER NAME\e[0m properly!"
  echo -e "\e[1;34m>>>\e[0m \e[1;31mphoenix miner details @ \e[0m\e[1;32mhttps://bitcointalk.org/?topic=6458.0\e[0m"
  echo -e ""
} 
