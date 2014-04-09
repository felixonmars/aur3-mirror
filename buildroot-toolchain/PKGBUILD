# Maintainer: Eric Toombs <ewtoombs@uwaterloo.ca>
# Optionally, change pkgname to something like mips-uclibc-toolchain, 
# reflecting the actual architecture you choose during the graphical config 
# part.
pkgname='buildroot-toolchain'
pkgver='2014.02'
pkgrel='2'
pkgdesc='A custom cross-compiler toolchain built by buildroot.'
arch=('i686' 'x86_64')
url='http://buildroot.uclibc.org/'
license=('GPL2')
makedepends=('cpio' 'bc')
source=("http://buildroot.uclibc.org/downloads/buildroot-$pkgver.tar.gz"
    'config' 'buildroot.sh' 'buildroot.csh')
# Generate with makepkg -g.
md5sums=('8d30803d27cd88fb27ec87b003a4de37'
         '40f6c55c3913a252664bb7f851861a0b'
         '8c9002c21832b45b0aa55f90b53a3d55'
         'f6603117f5e5b809ad79d87ca51985d0')
# External build flags totally mess up everything. Also, generally, don't 
# screw around with the files at all during packaging, since things will 
# break.
options=('!buildflags' '!strip' 'staticlibs' 'libtool')

build() {
	cd "$srcdir/buildroot-$pkgver"
    # Start with the provided .config, which has had a lot of stuff removed 
    # that is useless for just a toolchain, like busybox.
    cp "$srcdir/config" '.config'
    make menuconfig
    make
}

package() {
    # Show commands.
    set -x
    # Install the host tools, including the cross-compiler toolchain. Merging 
    # the host root, output/host, with the system root, /, is impossible 
    # because of multiple file collisions. They could be fixed, but that 
    # introduces all kinds of maintenance problems if and when buildroot 
    # decides to change the location of something. It is far easier just to 
    # give it its own root in /opt until buildroot is able to generate a host 
    # root that doesn't collide, if indeed they have such a goal.
    mkdir -p "$pkgdir/opt"
    cp -pr "$srcdir/buildroot-$pkgver/output/host/usr" "$pkgdir/opt/buildroot"
    # Install the scripts that add to PATH.
    _pd="$pkgdir/etc/profile.d/"
    mkdir -p "$_pd"
    install -m 755 "$srcdir/buildroot.sh" "$_pd"
    install -m 755 "$srcdir/buildroot.csh" "$_pd"
    unset _pd
    # Hide commands again.
    set +x
}
