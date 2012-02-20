# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Bernardo Barros <bernardobarros@gmail.com>
# Contributor: Ray Rashif <schivmeister@gmail.com>

_name=lv2core
pkgname=$_name-svn
pkgver=560
pkgrel=1
pkgdesc="A standard for plugins and matching host applications, mainly targeted at audio processing and generation."
arch=('i686' 'x86_64')
url="http://lv2plug.in/"
license=('custom:ISC')
makedepends=('subversion' 'rdflib' 'libsndfile' 'gtk2')
optdepends=('libsndfile: lv2-eg-sampler extension'
            'gtk2: lv2-eg-sampler extension')
provides=("$_name=6.0"
          'lv2-atom' 'lv2-contexts' 'lv2-cv-port' 'lv2-data-access' 'lv2-dynmanifest' 'lv2-eg-amp'
          'lv2-eg-sampler' 'lv2-event' 'lv2-host-info' 'lv2-instance-access' 'lv2-log' 'lv2-message'
          'lv2-midi' 'lv2-osc' 'lv2-parameter' 'lv2-port-groups' 'lv2-port-props' 'lv2-presets' 'lv2-pui'
          'lv2-reference' 'lv2-resize-port' 'lv2-state' 'lv2-string-port' 'lv2-time' 'lv2-ui' 'lv2-ui-resize'
          'lv2-units' 'lv2-urid' 'lv2-uri-map')
conflicts=("$_name"
          'lv2-atom' 'lv2-contexts' 'lv2-cv-port' 'lv2-data-access' 'lv2-dynmanifest' 'lv2-eg-amp'
          'lv2-eg-sampler' 'lv2-event' 'lv2-host-info' 'lv2-instance-access' 'lv2-log' 'lv2-message'
          'lv2-midi' 'lv2-osc' 'lv2-parameter' 'lv2-port-groups' 'lv2-port-props' 'lv2-presets' 'lv2-pui'
          'lv2-reference' 'lv2-resize-port' 'lv2-state' 'lv2-string-port' 'lv2-time' 'lv2-ui' 'lv2-ui-resize'
          'lv2-units' 'lv2-urid' 'lv2-uri-map')

_svntrunk=http://lv2plug.in/repo/trunk
_svnmod=$_name

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD
  #

  python2 waf configure --prefix=/usr --experimental
  python2 waf build
}

package() {
  cd "$srcdir/$_svnmod-build"

  python2 waf install --destdir="$pkgdir/"

  # license
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  find . -name $_name.ttl -exec head -n16 {} > \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE" \;
}
