# Contributor: fnord0 <fnord0 AT riseup DOT net>

pkgname=inguma-hg
pkgver=28
pkgrel=2
pkgdesc="Free penetration testing and vulnerability research toolkit (Mercurial)"
arch=('any')
url="http://code.google.com/p/inguma/"
license=('GPL2')
depends=('python2' 'impacket' 'python-paramiko' 'python2-pysnmp' 'scapy' 'pycrypto' 'oracle-xe' 'python-pybluez' 'pygtk' 'graphviz' 'python-imaging' 'gtksourceview2')
optdepends=('cx_oracle: Inguma Oracle modules support requires cx_Oracle'
	    'oracle-xe: Inguma Oracle modules support requires a working Oracle XE install')
makedepends=('mercurial')
provides=('inguma')

_hgroot="https://inguma.googlecode.com/hg/"
_hgrepo="inguma"

build() {
  cd "$srcdir"
  msg "Connecting to Inguma's Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo
  fi

  msg "Mercurial checkout of Inguma code done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  mkdir -p $pkgdir/usr/{bin,src} || return 1
}

package() {
  cp -r "$srcdir/$_hgrepo" "$pkgdir/usr/src/$_hgrepo"
  grep -rl python ${pkgdir}/usr/src/${_hgrepo}/ | xargs sed -i 's|python|python2|g' || return 1

  #create startup app
  echo "#!/bin/bash" > ${pkgdir}/usr/bin/${_hgrepo}
  echo "if [ \"\$1\"  = \"-h\" ] || [ \"\$1\" = \"--help\" ]; then" >> ${pkgdir}/usr/bin/${_hgrepo}
  echo "echo -e \"\"" >> ${pkgdir}/usr/bin/${_hgrepo}
  echo "echo -e \".::[ \e[1;31mInguma - open source penetration testing vulnerability research toolkit\e[0m ]::.\"" >> ${pkgdir}/usr/bin/${_hgrepo}
  echo "echo -e \"\e[1;31mUsage:\e[0m \e[1;34msudo /usr/bin/inguma\e[0m \e[1;31m[\e[0m\e[1;36m-g\e[0m\e[1;31m|\e[0m\e[0m\e[1;36m-h\e[0m\e[1;31m]\e[0m\"" >> ${pkgdir}/usr/bin/${_hgrepo}
  echo "echo -e \"\"" >> ${pkgdir}/usr/bin/${_hgrepo}
  echo "echo -e \"  COMMAND LINE ARGUMENTS\"" >> ${pkgdir}/usr/bin/${_hgrepo}
  echo "echo -e \"   \e[1;36m(DEFAULT/NONE)\e[0m  => Inguma CLI/command line interface\"" >> ${pkgdir}/usr/bin/${_hgrepo}
  echo "echo -e \"        \e[1;34m-g\e[0m         => Inguma GUI/graphical user interface\"" >> ${pkgdir}/usr/bin/${_hgrepo}
  echo "echo -e \"        \e[1;34m-h\e[0m         => Show this help dialogue\"" >> ${pkgdir}/usr/bin/${_hgrepo}
  echo "echo -e \"\"" >> ${pkgdir}/usr/bin/${_hgrepo}
  echo "elif [ \"\$1\" = \"-g\" ]; then" >> ${pkgdir}/usr/bin/${_hgrepo}
  echo "cd /usr/src/inguma" >> ${pkgdir}/usr/bin/${_hgrepo}
  echo "./ginguma.py \"\$@\"" >> ${pkgdir}/usr/bin/${_hgrepo}
  echo "cd -" >> ${pkgdir}/usr/bin/${_hgrepo}
  echo "else" >> ${pkgdir}/usr/bin/${_hgrepo}
  echo "cd /usr/src/inguma" >> ${pkgdir}/usr/bin/${_hgrepo}
  echo "./inguma.py \"\$@\"" >> ${pkgdir}/usr/bin/${_hgrepo}
  echo "cd -" >> ${pkgdir}/usr/bin/${_hgrepo}
  echo "fi" >> ${pkgdir}/usr/bin/${_hgrepo}
  chmod +x ${pkgdir}/usr/bin/${_hgrepo}

  #user notification
  echo -e ""
  echo -e "\e[1;31m[\e[0m\e[1;34m*\e[0m\e[1;31m]\e[0m \e[1;31mrun '\e[0m\e[1;34m/usr/bin/inguma -h\e[0m\e[1;31m' for an explanation of Inguma startup options\e[0m"
  echo -e "\e[1;34m>>>\e[0m \e[1;31mInguma homepage @ \e[0m\e[1;32mhttp://code.google.com/p/inguma\e[0m"
  echo -e ""
}
