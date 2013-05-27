# Maintainer: Chris Fordham <chris.fordham@rightscale.com>

pkgname=rightscale-deb
pkgver=5.8.12
pkgrel=6
epoch=
pkgdesc="RightScale RightLink cloud instance agent."
arch=('x86_64')
url="http://rightscale.com/"
license=('RightScale')
groups=()
depends=(bash dnsutils lsb-release sudo openssh curl)
makedepends=(binutils util-linux patch)
checkdepends=()
optdepends=()
provides=()
conflicts=(rightscale)
replaces=()
backup=()
options=()
install=rightscale.install
changelog=
source=(
  http://mirror.rightscale.com/rightscale_rightlink/5.8.12/ubuntu/rightscale_5.8.12-ubuntu_12.04-amd64.deb
  post_install.sh.patch
  rightscale_functions.patch
  system_configurator.rb.patch
  rightscale.service
  rightlink.service
  rightlink_reload.bash
  rightlink_start.bash
  rightlink_stop.bash
  rightscale_start.bash
  rightscale_stop.bash
)
noextract=()
md5sums=('872fd32ec762a1c4cb45b49321341c18'
         '33c019f13ef06608ea727e9481145b68'
         '7b30cc847f0371f46f6d036a267b1238'
         '50744b86d5d0f8c644bc297ccf6ab8bd'
         '8d22c7e33d0850c5f782f261df66f395'
         '0aaa1851d19703f91e11445c82f6a145'
         'c2f32c2e113a3bf69e1649d8bee45293'
         'b750959cd870079592117f2362ca193e'
         'fbec345f6bc5f2eede92efc74cecbc4b'
         '20208eaede1cd7df425fa3496d53c96b'
         '634fef216a508f99608afe7ed7b2f9fb')        # generate with 'makepkg -g'

prepare() {
  cd "$srcdir"
  
  msg "Extracting RightScale RightLink debian binary package..."
  ar x "$srcdir/rightscale_5.8.12-ubuntu_12.04-amd64.deb"
  
  msg "Extracting data.tar.gz..."
  tar zxf "$srcdir/data.tar.gz"
  
  #msg "Extracting control.tar.gz..."
  #tar zxf "$srcdir/control.tar.gz"
  
  msg "Applying patches for Arch Linux compat..."
  patch -p0 < "$startdir/post_install.sh.patch"
  patch -p0 < "$startdir/rightscale_functions.patch"
  patch -p0 < "$startdir/system_configurator.rb.patch"

  msg 'Adding additional service control scripts...'
  mkdir -p "$srcdir/opt/rightscale/bin"
  cp "$startdir/rightlink_reload.bash" "$srcdir/opt/rightscale/bin/rightlink_reload"
  cp "$startdir/rightlink_start.bash" "$srcdir/opt/rightscale/bin/rightlink_start"
  cp "$startdir/rightlink_stop.bash" "$srcdir/opt/rightscale/bin/rightlink_stop"
  cp "$startdir/rightscale_start.bash" "$srcdir/opt/rightscale/bin/rightscale_start"
  cp "$startdir/rightscale_stop.bash" "$srcdir/opt/rightscale/bin/rightscale_stop"
  
  msg "Adding systemd service configurations..."
  mkdir -p "$srcdir/lib/systemd/system"
  mkdir -p "$srcdir/etc/systemd/system"
  cp "$startdir/rightscale.service" "$srcdir/lib/systemd/system/rightscale.service"
  cp "$startdir/rightlink.service" "$srcdir/lib/systemd/system/rightlink.service" 
}

build() {
  msg "Adding empty directory, /var/spool/cloud to source."
  mkdir -p "$srcdir/var/spool/cloud"
  msg "Adding empty directory, /etc/rightscale.d to source."
  mkdir -p "$srcdir/etc/rightscale.d"
  msg "Setting ec2 as default cloud (this should not be needed!)"
  echo ec2 > "$srcdir/etc/rightscale.d/cloud"
}

check() {
  [ -e "$srcdir/etc" ]
  [ -e "$srcdir/opt/rightscale" ]
  [ -e "$srcdir/var" ]
}

package() {
  msg 'Moving /etc into package.'
  mv "$srcdir/etc" "$pkgdir/"
  msg 'Moving /lib into package.'
  mv "$srcdir/lib" "$pkgdir/"
  msg 'Moving /opt into package.'
  mv "$srcdir/opt" "$pkgdir/"
  msg 'Moving /var into package.'
  mv "$srcdir/var" "$pkgdir/"
}

# vim:set ts=2 sw=2 et: