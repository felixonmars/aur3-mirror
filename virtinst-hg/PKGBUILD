# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Jonathan Wiersma <arch aur at jonw dot org>
# Contributor: Xupeng Yun <recordus@gmail.com>

pkgname=virtinst-hg
pkgver=1179
pkgrel=1
pkgdesc="A command line tool which provides an easy way to provision operating systems into virtual machines."
depends=('python' 'libvirt' 'virtviewer' 'urlgrabber')
makedepends=('mercurial')
url="http://virt-manager.et.redhat.com/"
arch=('i686' 'x86_64')
provides=('virtinst=0.500.2')
conflicts=('virtinst')
license=('GPL')
source=()

_hgroot="http://hg.fedorahosted.org/hg"
_hgrepo="python-virtinst"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u || return 1
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo || return 1
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  # BUILD HERE
  python ./setup.py build || return 1
  python ./setup.py install --root=$pkgdir || return 1
}
