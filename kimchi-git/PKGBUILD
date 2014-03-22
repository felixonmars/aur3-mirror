# Maintainer: Ethan Zonca <ethanzonca@ethanzonca.com>
pkgname=kimchi-git
gitname=kimchi
pkgver=0
pkgrel=2
conflicts=('kimchi')

pkgdesc="HTML5 management for KVM"

arch=('i686' 'x86_64')

url="https://github.com/kimchi-project/kimchi"

license=('LGPL2.1' 'APACHE')

depends=('python2-cherrypy'
  'python2-cheetah'
  'libvirt-python'
  'python2-imaging'
  'pypam2-bzr'
  'python2-m2crypto'
  'python2-jsonschema'
  'qemu'
  'python2-psutil'
  'python2-ethtool'
  'python2-ipaddr'
  'python2-lxml'
  'open-iscsi'
  'lvm2'
  'python2-lxml'
  'pyparted'
)

makedepends=('git')
.
# User files that should be saved. They are kept as Pacnew and Pacsave Files
backup=('etc/kimchi/kimchi.conf')

source=("git+git://github.com/kimchi-project/kimchi.git"
 "python2.patch"
 "quiet.patch"
 "kimchid.service"
)

md5sums=('SKIP' 
 'bcb0d12d4049878581193fd2ac6224e5'
 '487c1e611c397f50c61a7933cef58ffb'
 '9ce825405752b19ad4004abe23bc4c04'
)

build() {
  cd "$srcdir/${gitname}"
  msg "Patching for python2"
  patch -p1 -i ../python2.patch
  msg "Patching for quieter logs"
  patch -p1 -i ../quiet.patch
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var PYTHON=/usr/bin/python2
  make
}

package() {
  cd "$srcdir/${gitname}"
  make DESTDIR=$pkgdir install
  # Systemd units
  install -Dm0644 ../kimchid.service "${pkgdir}/usr/lib/systemd/system/kimchid.service"
}

pkgver() {
  cd "$srcdir/repo"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
