#Contributor: Franz Rogar <franzrogar at gmail dot com>
pkgname=renpy64
pkgver=6.10.2
pkgrel=3
pkgdesc="A free and cross-platform engine that helps you use words, pictures, and sounds to tell stories with the computer."
arch=('x86_64')
url="http://www.renpy.org"
license=('MIT')
depends=('java-runtime' 'zenity')
makedepens=('hashlib', 'gtk2')
install=renpy64.install
source=('http://www.renpy.org/dl/6.10.2/renpy-6.10.2-sdk.tar.bz2'
        'http://www.renpy.org/dl/lgpl/renpy-deps-6.10.1.tar.bz2'
        'http://www.renpy.org/w/images/8/86/scite-renpy-20090803.zip'
        'http://prdownloads.sourceforge.net/scintilla/scite211.tgz'
        'http://bazaar.launchpad.net/%7Erenpytom/renpy/main/download/920/253%40a20cb6e2-ff0c-0410-a951-e6c088e16c52%3Arenpy%252Ftrunk%3Arenpy%252Fdisplay%252Fscale.py/scale.py'
        'Renpy-build.patch'
        'Renpy-build_python.patch'
        'Renpy-distribute-x86_64.patch'
        'Renpy-python-x86_64.patch'
        'renpy64.desktop'
        'renpy_logo.png'
        'Renpy64-build.sh')
noextract=('renpy-6.10.2-sdk.tar.bz2'
        'renpy-deps-6.10.1.tar.bz2'
        'scite-renpy-20090803.zip'
        'scite211.tgz')
md5sums=('287f9c3e30247f6f11f45f4ebf9928f2'
         '345cf2d6791ac58d5a55deac6122a0ba'
         '417be4131524cf62c779e4faa1570745'
         '129aad231c9618aaa2c2e41226db2327'
         'b02cc7add8df1d897bbec71cf10bad0e'
         '0b93813ea4c6e3bbfae0f73945957cb3'
         'd7d0d7b33aa9754a3dbfa83ab6c482cb'
         '7527d382126088a76bfd85d384e28470'
         'ddccefa64138621e29d707edb681d7f6'
         '28afd50fbc9718124515c96f97f5541f'
         'edd126b1ac240a72477806bc78e86f47'
         'dcd5fa0ab5cade27e14c215bc0e62546')

build() {
  rm -Rf /tmp/renpy64
  mkdir -p /tmp/renpy64
  cp -rf *.patch *.desktop *.py *.png *.sh *.tgz *.zip *.bz2 ${srcdir}/../ChangeLog /tmp/renpy64
  chmod +x /tmp/renpy64/Renpy64-build.sh
  echo -e "
 == WARNING!! VERY IMPORTANT INFORMATION ==
Package created by this PKGBUILD is a DUMMY package.
DO NOT INSTALL IT.

To build the real one, go to /tmp/renpy64 and run
Renpy64-build.sh script to build it.

This is done this way because a problem with fakeroot
and global variables in makepkg.
"
}
