# Maintainer: Yue Liu < yue DOT liu AT mail DOT com >

pkgname=lighter-git
pkgver=20130818
pkgrel=1
pkgdesc="Script to automatically control Macbook Air (2012) screen and keyboard backlight brightness using data from the built in light sensor."
url="https://github.com/Janhouse/lighter"
arch=('any')
license=(custom)
depends=('perl' 'perl-io-async')
makedepends=('git')
install="lighter.install"

_gitroot="https://github.com/Janhouse/lighter.git"
_gitname="lighter"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server ..."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  cd "$srcdir/"
  cat <<-'EOF' > ./lighter.service
[Unit]
Description=Control Macbook Air (2012) screen and keyboard backlight brightness using bulti-in light senser
After=systemd-udevd.service

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/usr/sbin/lighter

[Install]
WantedBy=multi-user.target
EOF
}

package() {
        cd $srcdir/
        install -D -m 0755 $_gitname/lighter.pl "$pkgdir/usr/sbin/lighter"
        install -D -m 0644 lighter.service "$pkgdir/usr/lib/systemd/system/lighter.service"
}
