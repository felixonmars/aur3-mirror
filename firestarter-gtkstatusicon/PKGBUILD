# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# Maintainer: Ska <skatiger@gmail.com>
# http://github.com/fukawi2/aur-packages

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=firestarter-gtkstatusicon
pkgver=1.0.3
pkgrel=101
_basename=firestarter
pkgdesc="GUI fron-end for iptables"
arch=('i686' 'x86_64')
license=('GPLv2')
depends=('iptables' 'gtk2' 'libgnome' 'libgnomeui' 'libglade' 'pango' 'gksu' 'perl-xml-parser')
makedepends=('patch')
url="http://www.fs-security.com/"
conflicts=('firestarter')
install="${_basename}.install"
source=("http://downloads.sourceforge.net/firestarter/$_basename-$pkgver.tar.gz"
        'rc.firestarter'
        '18_fix_memleak.patch'
        '20-net-tools-ifconfig-format-change.patch'
        'events-log-fix.patch'
        'menu-toolbar-icons-fix.patch'
        'firestarter-gtkstatusicon.patch')
md5sums=('f46860a9e16dac4b693bd05f16370b03'
         '76ece068fa966c70b0764ec9e644edf5'
         'b31efd1caf430d979e26abb2618a3659'
         '7bcd40b3690e3833078ea31a8a9935f1'
         'acd91fefe00edb41dd38fcc91567707f'
         'ea9cd9b92939c554b26ccdfe735a2d90'
         'c656553aab6a312d1a1e9b4cfc5e9a36')

build() {
  cd $srcdir/$_basename-$pkgver
  
  # Apply patches to fix things
  # Transparent tray icon (from Ubuntu launchpad)
#  patch -Np1 -i "$srcdir/12_firestarter_transparent_icon.patch"
  # fix GUI crashes on newer Gnome libs (from Ubuntu launchpad)
  patch -Np1 -i "$srcdir/18_fix_memleak.patch"
  # patch to use the new 'ifconfig' from net-tools (thanks to Joeny Ang)
  patch -Np1 -i "$srcdir/20-net-tools-ifconfig-format-change.patch"
  
  # Replace kernel.log with iptables.log
  patch -Np1 -i ../events-log-fix.patch
  
  # menu-toolbar-icons-fix.patch: fixed a couple menu and toolbar icons to follow GTK theme
  patch -Np1 -i ../menu-toolbar-icons-fix.patch

  # firestarter-gtkstatusicon.patch: use gtkstatusicon replace eggtrayicon
  patch -Np1 -i ../firestarter-gtkstatusicon.patch
  
  # Configure, Build and Install to $pkgdir
  #configure 
  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var
  
  make
}

package() {
  cd $srcdir/$_basename-$pkgver

  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${pkgdir} install
  
  # Create default empty ruleset and fix permissions
  mkdir ${pkgdir}/etc/firestarter/outbound/
  touch ${pkgdir}/etc/firestarter/outbound/allow-service
  chown -R root:root ${pkgdir}/etc/firestarter/

  # Install rc.init script
  install -D -m755 ${srcdir}/rc.firestarter ${pkgdir}/etc/rc.d/firestarter
  
  # Fix the desktop launcher to run with root permission using gksudo.
  sed -i "s|Exec=|TryExec=gksu\n\0gksu |" \
    ${pkgdir}/usr/share/gnome/apps/Internet/firestarter.desktop
  
  # Move the .desktop file to a standard location
  install -Dm644 $pkgdir/usr/share/gnome/apps/Internet/${_basename}.desktop $pkgdir/usr/share/applications/${_basename}.desktop
  rm -rf $pkgdir/usr/share/gnome
  
  # Merge Schema files to /usr/share/gconf so the .install file
  # can update the database at install time.
  mkdir -p ${pkgdir}/usr/share/gconf/schemas
  gconf-merge-schema ${pkgdir}/usr/share/gconf/schemas/${_basename}.schemas \
    ${srcdir}/${_basename}-${pkgver}/*.schemas
  rm -Rf ${pkgdir}/etc/gconf
}

# vim:set ts=2 sw=2 et:
