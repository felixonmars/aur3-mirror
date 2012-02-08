# Maintainer: Pawel 'l0ner' Soltys <pwslts@gmail.com>
# Contributor: Calvin Morrison <mutantturkey@gmail.com>

pkgname='trinity-kdebase'
pkgver=3513
pkgrel=7
arch=('i686' 'x86_64')
url='http://www.trinitydesktop.org'
license=('GPL')
groups=('trinity-base')
pkgdesc="Trinity Desktop Enviroment base components"
depends=('trinity-kdelibs' 'trinity-dbus-tqt' 'hal'
         'libxtst' 'libraw1394')
         #'xorg-server' 'xorg-xset' 'xorg-xsetroot' 'xorg-xprop' 'xorg-xmessage' 'xorg-xinit' 
makedepends=('pkgconfig' 'cmake' 'autoconf' 'imake' 'xorg-bdftopcf' 'smbclient' 
             'libxkbfile')
confilicts=('kdemod3-kdebase')
options=('libtool')
optdepends=('desktop-file-utils: Command line utilities for working with desktop entries'
            'pciutils: PCI bus configuration space access library and tools'
            'xscreensaver: Screen saver and locker for the X Window System'
            'xorg-fonts-75dpi: X.org 75dpi fonts collection'
            'samba: file sharing over SMB')
install='trinity-kdebase.install'
source=('http://mirror.ets.kth.se/trinity/releases/3.5.13/kdebase-3.5.13.tar.gz' 
        'patches.tar.bz2'
        'xsession.patch'
        'arch-kdeshutdown.png'
        'kdm-default-face.png'
        'agent-shutdown.sh'
        'agent-startup.sh'
        'kdm-trinity' 
        'trinity.desktop')
md5sums=('d1f7e1f94eeb46b981fe1ba144179840'
         '327e4d68bd1fc4d29bdb273e81f90415'
         '895f5d7351aa73ba1f57b0ad27081d69'
         'bb3004513d703d6b72ce70aa240af3a3'
         'e6afdd7ca60c4c59b851135785347e75'
         '18e8d01124b19f7df2937c06e177bf7f'
         'c963ef6e37c9051119972a58c67f05fb'
         '376d85d213cf3c04cb0912e5cccd68bd'
         '1418e45fea5a9738544cbd264c36373b')

build() {
   cd $srcdir/kdebase

   msg "Setting PATH, CMAKE and Trinity Environment variables"
   # Source the QT and TDE profile
   [ "$QTDIR" = "" ] && . /etc/profile.d/qt3.sh 
   [ "$TDEDIR" = "" ] && . /etc/profile.d/trinity.sh

   #export CMAKE_PREFIX_PATH=${QTDIR}:${TDEDIR}
   #export CMAKE_INCLUDE_PATH=${TDEDIR}/include/dbus-1-tqt/:${TDEDIR}/include/dbus-1.0/:${TDEDIR}/include:${TDEDIR}/include/libkrandr
   #export LD_LIBRARY_PATH=${TDEDIR}/lib:${TDEDIR}/lib/trinity:${QTDIR}/lib:$LD_LIBRARY_PATH
   #export PKG_CONFIG_PATH=${TDEDIR}/lib/pkgconfig:${QTDIR}/lib/pkgconfig:$PKG_CONFIG_PATH

   msg "Patching..."
   for patch in $srcdir/patches/*.patch; do
      _p=`basename $patch`
      msg "Applying patch $_p.."
      patch -Np0 -i $patch
   done

   #Compatibility with kde3 and kde4
   #sed -ie 's/applications-merged/tde-applications-merged/g' applnk/CMakeLists.txt

   msg "Creating out-of-source build directory: ${srcdir}/build"
   mkdir -p ../build
   cd ../build

   msg "Starting cmake..."
   cmake ${srcdir}/kdebase \
      -DCMAKE_INSTALL_PREFIX=${TDEDIR} \
      -DSYSCONF_INSTALL_DIR=/etc \
      -DWITH_XFIXES=ON \
      -DWITH_XCOMPOSITE=ON \
      -DWITH_XCURSOR=ON \
      -DWITH_XRANDR=ON \
      -DWITH_XRENDER=ON \
      -DWITH_XDAMAGE=ON \
      -DWITH_SHADOW=ON \
      -DWITH_XDMCP=ON \
      -DWITH_XINERAMA=ON \
      -DWITH_XEXT=ON \
      -DWITH_PAM=ON \
      -DWITH_HAL=ON \
      -DWITH_ARTS=ON \
      -DWITH_SASL=ON \
      -DWITH_OPENEXR=ON \
      -DWITH_SAMBA=ON \
      -DWITH_LIBUSB=ON \
      -DWITH_LDAP=ON \
      -DWITH_LIBRAW1394=ON \
      -DWITH_I8K=ON \
      -DBUILD_ALL=ON 
   make

}

package() {
   msg "Packaging - $pkgname-$pkgver"
   cd $srcdir/build
   make DESTDIR="$pkgdir" install

   # install X11 session file
   install -d -m755 ${pkgdir}/etc/X11/sessions
   install -m755 ${srcdir}/trinity.desktop ${pkgdir}/etc/X11/sessions/trinity.desktop
   
   # update the Xsession file, this resolves problem with kdm dropping back
   # to the login screen
   patch -N ${pkgdir}${TDEDIR}/share/config/kdm/Xsession < ${srcdir}/xsession.patch
   
   # install kdm rc.d script. We need this to start kdm from rc.d
   install -D -m755 ${srcdir}/kdm-trinity "${pkgdir}"/etc/rc.d/kdm-trinity	

   # Add image for default user avatar. This removes kdm complains about missing
   # default avatar from kdm.log
   install -D -m 644 $srcdir/kdm-default-face.png ${pkgdir}$TDEDIR/share/apps/kdm/faces/.default.face.icon
   install -D -m 644 $srcdir/kdm-default-face.png ${pkgdir}$TDEDIR/share/apps/kdm/pics/users/arch-kdm.png

   # create the starttrinity link
   # do we need this? wouldn't be better to rename startkde script
   # to starttrinity? Well, whathever. 
   ln -sf $TDEDIR/bin/startkde ${pkgdir}$TDEDIR/bin/starttrinity

   # install mkpamserv script, so we can auto-generate pam.d configs in post_install()
   install -D -m755 ${srcdir}/kdebase/mkpamserv ${pkgdir}${TDEDIR}/bin/mkpamserv

   # dbus config file. I don't know if we need this, since directory listed
   # in the config file doens't exist. Maybe this should be provided by dbus bindings?
   # No, after riconsidering I'm not gonna provide it unless it's required.

   # Install nice arch logo to use in the shutdown dialog
   install -D -m 644 $srcdir/arch-kdeshutdown.png ${pkgdir}$TDEDIR/share/apps/ksmserver/pics/shutdownkonq.png

   # add startup/shutdown agents for ssh and gpg-agent
   install -m644 -D $srcdir/agent-startup.sh ${pkgdir}$TDEDIR/env/agent-startup.sh
   install -m755 -D $srcdir/agent-shutdown.sh ${pkgdir}$TDEDIR/shutdown/agent-shutdown.sh

   # fix kde icons for gnome by creating symlinks
   mkdir -p ${pkgdir}$TDEDIR/share/icons/gnome/{128x128,64x64,32x32,16x16,48x48,22x22,scalable}
   mkdir -p ${pkgdir}$TDEDIR/share/icons/crystalsvg/{128x128/apps,64x64/apps,32x32/apps,16x16/apps,48x48/apps,22x22/apps,scalable/apps}
   cd ${pkgdir}$TDEDIR/share/icons/gnome/
   for i in *; do
      cd $i
      ln -sf ../../crystalsvg/$i/apps/ apps
      cd ..
   done


}
