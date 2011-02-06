# Contributor: fnord0 < fnord0 AT riseup DOT net >

pkgname=middler-svn
_pkgname=middler
pkgver=169
pkgrel=1
pkgdesc=("a Man in the Middle tool to demonstrate protocol middling attacks")
arch=('any')
url=("http://code.google.com/p/middler/")
license=('GPL2')
depends=('python' 'dsniff' 'python-netfilter')
#optdepends=('scapy: alternate method to generate ARP spoofing packets via scapy'
#	    'pypcap: required for scapy ARP spoofing method'
#	    'readline: required for scapy ARP spoofing method'
#	    'python-beautifulsoup: required for scapy ARP spoofing method'
#	    'libdnet: required for scapy ARP spoofing method'
#	    'metasploit: to use TheMiddler metasploit framework plugin'
#	    'beef: to use TheMiddler BeEF plugin')
options=(!emptydirs)
_svntrunk="http://middler.googlecode.com/svn/trunk/"
provides=('middler')

build() {
	  if [ -d ${srcdir}/.svn ]; then
	    msg 'Updating...'
	    svn up ${srcdir}
	  else
	    msg 'Checking out...'
	    svn co ${_svntrunk} ${srcdir}
	  fi
	  mkdir -p ${pkgdir}/usr/{bin,src} || return 1
	  cd ${pkgdir}/usr/src
          svn export ${srcdir} ${_pkgname} || return 1

  cd ${pkgdir}/usr/src/${_pkgname}
  	# archlinux fixes
	grep -rl python * | xargs sed -i 's|python|python2|g' || return 1
  # continue the build
  python2 setup.py install --root=${pkgdir}/ --optimize=1 || return 1

  #create startup app
  echo "#!/bin/sh" > ${pkgdir}/usr/bin/${_pkgname}
  echo "cd /usr/src/middler" >> ${pkgdir}/usr/bin/${_pkgname}
  echo "python2 ./middler.py \"\$@\"" >> ${pkgdir}/usr/bin/${_pkgname}
  echo "cd -" >> ${pkgdir}/usr/bin/${_pkgname}
  chmod +x ${pkgdir}/usr/bin/${_pkgname}
}
# vim:syntax=sh
