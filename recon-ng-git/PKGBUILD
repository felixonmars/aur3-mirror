# Maintainer: tuftedocelot@fastmail.fm
# Submitter: Mauro Andreolini <mauro.andreolini@unimore.it>
_pkgname=recon-ng
pkgname=${_pkgname}-git
pkgver=758
pkgrel=1
pkgdesc="A full-featured Web Reconnaisance framework written in Python"
arch=('any')
url="https://bitbucket.org/LaNMaSteR53/recon-ng/overview"
license=('GPL3')
depends=('python2' 'python2-dnspython' 'python2-httplib2' 'python2-oauth2' 'sqlite')
makedepends=('git' 'patch')
source=("fix-python2-invocation.patch" "git+https://bitbucket.org/LaNMaSteR53/recon-ng.git")
md5sums=('c320e88ca87ffdd8363f56990da77e1a'
         'SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git rev-list --count HEAD
}

build() {
  cd ${srcdir}/${_pkgname}
  patch -Np1 -i ../fix-python2-invocation.patch || return 1
}

package(){
  cd ${srcdir}
  mkdir -p ${pkgdir}/opt/${_pkgname}
  cp -dpr --no-preserve=ownership ${_pkgname}/{core,data,libs,modules,README.md,recon-ng,VERSION,recon-cli,recon-rpc} ${pkgdir}/opt/${_pkgname}
  find ${pkgdir} -name .git -exec rm -rf '{}' \;

  install -d -m755 "$pkgdir/usr/bin" 
  
  cat >> "$pkgdir/usr/bin/recon-ng" <<EOF
#!/bin/sh 
cd /opt/recon-ng
python2 ./recon-ng
EOF
  chmod +x "$pkgdir/usr/bin/recon-ng"

  cat >> "$pkgdir/usr/bin/recon-cli" <<EOF
#!/bin/sh
cd /opt/recon-ng
python2 ./recon-cli
EOF
  chmod +x "$pkgdir/usr/bin/recon-cli"

  cat >> "$pkgdir/usr/bin/recon-rpc" <<EOF
#!/bin/sh
cd /opt/recon-ng
python2 ./recon-rpc
EOF
  chmod +x "$pkgdir/usr/bin/recon-rpc"
}

# vim:set ts=2 sw=2 et:
