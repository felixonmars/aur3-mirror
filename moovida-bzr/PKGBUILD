# Contributor:  Jon Kristian Nilsen <jokr.nilsen@gmail.com>

pkgname=moovida-bzr
pkgver=1615
pkgrel=1
pkgdesc="The Moovida GUI framework."
url="http://moovida.com/"
arch=('i686' 'x86_64')
license=('GPL')

depends=('python' 'libdvdcss' 'gstreamer0.10-python'  'pigment-svn' \
    'python-pigment-svn' 'gstreamer0.10-bad' 'gnome-python-extras' 'pil' \
    'python-pysqlite-legacy' 'python-cssutils' 'twisted-web2' \
    'ttf-liberation' 'pygobject' 'pygtk' 'pycairo' 'setuptools' \
    'python-simplejson' 'pyopenssl' 'dbus-python' 'pyxdg')

optdepends=(
  'xdg-user-dirs: for user default multimedia directories support, alternatively'
  'python-gdata: for YouTube video streaming website support'
  'gstreamer0.10-ugly-plugins: some optional plugins'
  'gstreamer0.10-ffmpeg: for ffmpeg'
  'lirc: for LIRC support'
  'python-daap: for DAAP support'
  'libgpod: for iPod support'
  'coherence: for uPnP support')

makedepends=('bzr' 'setuptools')
conflicts=('elisa' 'elisa-bzr')
options=('!libtool' '!makeflags')
provides=('moovida-bzr')

_bzrtrunk=lp:moovida
_bzrmod=moovida

build() {
    cd ${srcdir}
  
    msg "Connecting to the server...."
  
    bzr branch ${_bzrtrunk} -q -r ${pkgver}
  
    msg "BZR checkout done or server timeout"
    msg "Starting make..."
  
    [ -d ./${_bzrmod}-build ] && rm -rf ./${_bzrmod}-build
    cp -r ./${_bzrmod} ./${_bzrmod}-build

    cd ./${_bzrmod}-build/elisa-core

    export PYTHONPATH=$PWD/elisa-core:$PWD/elisa-plugins:$PYTHONPATH
    python setup.py install --prefix=/usr --root=$startdir/pkg || return 1

    rm -rf ${srcdir}/${_bzrmod}-build
}

# vim:syntax=sh
