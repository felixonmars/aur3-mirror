# Contributor: fnord0 < fnord0 AT riseup DOT net >

pkgname=fasttrack
pkgver=4.0.1
pkgrel=5
pkgdesc='Automated Penetration Testing'
arch=('i686' 'x86_64')
url=https://www.trustedsec.com/
license=('BSD')
depends=('metasploit' 'subversion' 'python2' 'nmap' 'setuptools' 'freetds' 'python2-pexpect' 'tcl' 'sqlite3' 'ruby-sqlite3' 'python-clientform' 'proftpd' 'python2-beautifulsoup3' 'pymssql' 'pymills' 'winexe')
optdepends=('psyco2-svn: for increased speeds (i686 only)')
_svntrunk=http://svn.secmaniac.com/fasttrack
install=fasttrack.install

build() {
	  if [ -d ${srcdir}/.svn ]; then
	    msg 'Updating...'
	    svn up ${srcdir}
	  else
	    msg 'Checking out...'
	    svn co ${_svntrunk} ${srcdir}
	  fi
	  mkdir -p ${pkgdir}/usr/{bin,src} || return 1
	  install -d ${pkgdir}/usr/share/licenses/fasttrack || return 1
	  cd ${pkgdir}/usr/src
          svn export ${srcdir} ${pkgname} || return 1
	  cd ${pkgname}
	  #check if metasploit-svn or metasploit stable is installed (metasploit-svn takes presidence)
	  #apply archlinux metasploit home directory to fasttrack_config
	  if [ -d /usr/src/metasploit ]; then
	     sed -i 's|/pentest/exploits/framework3|/usr/src/metasploit|g' ./bin/config/config || return 1
	  else
	     sed -i 's|/pentest/exploits/framework3|/opt/metasploit|g' ./bin/config/config || return 1
	  fi
	  echo -e ""
	  echo -e "\e[1;34m>>>\e[0m \e[1;31march linux users\e[0m"
	  echo -e "\e[1;34m>>>\e[0m \e[1;31manswer '\e[0m\e[1;34mno\e[0m\e[1;31m' to the install question about fasttrack dependency resolving\e[0m"
	  python2 setup.py install --root=${pkgdir}/ --optimize=1 || return 1
          install -Dm755 ${startdir}/${pkgname} ${pkgdir}/usr/bin/${pkgname} || return 1
	  cd ${pkgdir}/usr/src/${pkgname}/readme
	  cp -pR LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/ || return 1
}
# vim:syntax=sh
