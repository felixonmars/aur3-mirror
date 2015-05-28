# Maintainer: John Frankenhauser <fuzzyfuzz@gmail.com>

pkgname=ntopng-git
pkgver=1.99
pkgrel=1
pkgdesc='The next generation version of the original ntop, a network traffic probe that shows the network usage. This is the git version.'
arch=('x86_64' 'i686')
url='http://www.ntop.org/'
license=('GPL3')
depends=('redis' 'git' 'libxml2' 'geoip' 'libpcap' 'libnet' 'lua' 'zeromq' 'gd'
         'gdbm' 'pcre' 'rrdtool' 'psutils')
_gitroot=('git://github.com/ntop/ntopng')
_gitname=('ntopng')
_nDPIroot=('git://github.com/ntop/nDPI')
source=('ntopng.service')
md5sums=('9414980c9f45dd68bd56bd6e21d43d67')

build() {

  cd ${srcdir}

  ## Git checkout
  if [ -d ${srcdir}/${_gitname} ] ; then
    msg "Git checkout: Updating existing tree"
    cd ${_gitname} && git pull origin
    msg "Git checkout: Tree has been updated"
  else
    msg "Git checkout: Retreiving sources"
    git clone ${_gitroot}
  fi
  msg "Checkout completed"

  cd ${srcdir}/${_gitname}
  msg "ntopng autogen.sh"
  /bin/sh autogen.sh
  msg "ntopng configure"
  /bin/sh configure

  ## Build nDPI. There's probably a cleaner way to do this...
  cd ..
  if [ -d nDPI ] ; then
    msg "nDPI already checked out"
  else
    msg "Check out nDPI"
    git clone ${_nDPIroot}
  fi
  cd nDPI
  msg "nDPI Autogen.sh"
  /bin/sh autogen.sh
  msg "nDPI configure"
  /bin/sh configure
  msg "nDPI make"
  make
  cd ${srcdir}/${_gitname}

  msg "ntopng => make geoip"
  make geoip

  msg "ntopng make"
  make
}

package() {
  cd "${srcdir}/${_gitname}"

  # Base directories.
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/ntopng"
  install -dm755 "${pkgdir}/usr/share/man/man8"
  install -dm755 "${pkgdir}/usr/lib/systemd/system"

  # Bin.
  install -m755 ntopng "${pkgdir}/usr/share/ntopng"

  # Man
  install -m755 ntopng.8 "${pkgdir}/usr/share/man/man8"

  # Docs.
  cp --no-preserve=ownership -R httpdocs scripts "${pkgdir}/usr/share/ntopng"

  # Systemd service.
  install -m644 "${srcdir}/ntopng.service" "${pkgdir}/usr/lib/systemd/system"

  cat > "${pkgdir}/usr/bin/ntopng" <<EOF
#!/bin/sh
cd /usr/share/ntopng
./ntopng "\$@"
EOF
  chmod +x "${pkgdir}/usr/bin/ntopng"
}
