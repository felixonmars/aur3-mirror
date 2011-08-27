# Maintainer: H.Gökhan Sarı <th0th@returnfalse.net>
# Contributor: Victor Noel
pkgname=tunnelmanager-bzr
pkgver=65
pkgrel=1
pkgdesc="Tunnel Manager allows users to easily manage a configurable list of SSH tunnels and their required keys."
arch=('any')
url="https://launchpad.net/tunnelmanager"
license=('GPL2')
depends=('python2' 'pygtk' 'iproute2')
makedepends=('bzr')
provides=('tunnelmanager')

_bzrtrunk="https://launchpad.net/tunnelmanager/trunk"
_bzrmod="tunnelmanager"

build() {
cd "$srcdir"
msg "Connecting to Bazaar server...."

if [ -d $_bzrmod ] ; then
cd ${_bzrmod} && bzr --no-plugins pull ${_bzrtrunk} -r ${pkgver}
msg "The local files are updated."
else
bzr --no-plugins branch ${_bzrtrunk} ${_bzrmod} -q -r ${pkgver}
fi

msg "Bazaar checkout done or server timeout"
msg "Starting make..."

rm -rf "$srcdir/$_bzrmod-build"
cp -r "$srcdir/$_bzrmod" "$srcdir/$_bzrmod-build"
cd "$srcdir/$_bzrmod-build"

# fix default ip command
sed -i 's|/bin/ip|/usr/sbin/ip|' source/TunnelManager/Controller.py
}

package() {
cd "$srcdir/$_bzrmod-build/source/"
python2 setup.py install --root="$pkgdir/" --optimize=1
} 
