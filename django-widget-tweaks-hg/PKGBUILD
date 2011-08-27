# Maintainer: Taylor Hedberg <t@tmh.cc>
pkgname=django-widget-tweaks-hg
pkgver=10
pkgrel=1
pkgdesc="Tweak Django form field rendering in templates, not in Python-level form definitions"
arch=(any)
url='http://pypi.python.org/pypi/django-widget-tweaks'
license=(MIT)
depends=(python2 django)
makedepends=('mercurial')

_hgroot="https://bitbucket.org/kmike"
_hgrepo="django-widget-tweaks"

build() {

  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  python2 setup.py install --root=$pkgdir

}
