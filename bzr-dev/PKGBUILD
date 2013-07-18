# Maintainer: Neil Santos <nsantos16+aur@gmail.com>

pkgname=bzr-dev
pkgver=6579
pkgrel=1
pkgdesc='A decentralized revision control system (development series)'
arch=('i686' 'x86_64')
url='http://www.bazaar-vcs.org/'
license=('GPL')
depends=('python2' 'pyrex')
makedepends=('bzr')
optdepends=('python2-paramiko: SSH support')
provides=('bzr=$pkgver')
conflicts=('bzr')

_bzrtrunk='lp:bzr'
_bzrmod='bzr'

pkgver() {
  bzr revno "$_bzrtrunk"
}

prepare() {
  cd $srcdir
  msg "Connecting to Launchpad..."

  if [[ -d $_bzrmod/.bzr ]]; then
    (cd $_bzrmod && bzr update -v && cd ..)
    msg "Local checkout updated or server timeout"
  else
    bzr co --lightweight -v $_bzrtrunk $_bzrmod
    msg "Checkout done or server timeout"
  fi
}

build() {
  cp -urT $_bzrmod/ ${_bzrmod}-build
  cd ${_bzrmod}-build

  sed -i 's|man/man1|share/man/man1|' setup.py
  sed -i 's|/usr/bin/env python|/usr/bin/env python2|' \
    bzrlib/{plugins/bash_completion/bashcomp.py,tests/ssl_certs/create_ssls.py,patiencediff.py,_patiencediff_py.py}
  python2 setup.py build
}

package() {
  cd ${_bzrmod}-build

  msg "Starting setup.py..."
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1

  # bash-completion
  install -D -m644 contrib/bash/bzr \
    "${pkgdir}/usr/share/bash-completion/completions/bzr"
}
