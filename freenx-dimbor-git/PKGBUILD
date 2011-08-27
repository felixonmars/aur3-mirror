# Contributor: oldbay <old_bay@mail.ru>

pkgname=freenx-dimbor-git
pkgver=0.7.4
pkgrel=3e5c7e7
pkgdesc="adapted version of the server from etersoft, branch git repository of dimbor, more details on http://unixforum.org/index.php?showforum=89"
arch=('i686' 'x86_64')
url="http://git.etersoft.ru/people/dimbor/packages"
license=('GPL')
depends=('nxserver' 'gnu-netcat' 'openssh' 'expect' 'xorg-xauth' 'xorg-apps' 'xorg-fonts-misc' 'coreutils' 'xdialog')
makedepends=('make' 'imake')
install=freenx.install
source=('arch.diff' 'nxloadconfig.diff' 'nxnode.diff')
md5sums=('26e65316f69772746d1e7b9e99c60b43'
         'a485efe7cc8f2884ac16709e0c3c31a2'
         '628acfed3e2e28262e174984ec5852bc')

build() {
  
  cd $srcdir
  #cp -a $startdir/freenx-server-git.clone/freenx-server $srcdir
  git clone $url/freenx-server.git

  cd "$srcdir/freenx-server"
  git checkout -b build 3e5c7e726bd1c20e0a6bebe6d001ea18accbf0cf
  
  cd "$srcdir/freenx-server/freenx-server"
  patch -Np0 -i ${srcdir}/arch.diff || return 1
  patch -Np0 -i ${srcdir}/nxloadconfig.diff || return 1
  patch -Np0 -i ${srcdir}/nxnode.diff || return 1
  
  sed -i -e 's,/usr/bin/nxdialog,/opt/NX/bin/nxdialog,g' nxacl.app
  
  sed -i -e 's,/usr/bin/nxclient,/opt/NX/bin/nxclient,g' nxdialog
  sed -i -e 's,/usr/X11R6/bin/xmessage,/usr/bin/xmessage,g' nxdialog
  
  sed -i -e 's|AGENT_EXTRA_OPTIONS_X="-nolisten tcp -dpi 96"|AGENT_EXTRA_OPTIONS_X="-co /usr/share/X11/rgb -fp /usr/share/fonts/misc,/usr/share/fonts/75dpi,/usr/share/fonts/100dpi,/usr/share/fonts/TTF,/usr/share/fonts/Type1 -xkbdir /usr/share/X11/xkb"|g' nxloadconfig
  sed -i -e 's,libXrender.so.1,libXrender.so.1.2.2:$APPLICATION_LIBRARY_PATH/libXcompsh.so.3:$APPLICATION_LIBRARY_PATH/libXcompshad.so.3,g' nxloadconfig
  
  sed -i -e 's,netcat,nc,g' nxloadconfig
  sed -i -e 's,/etc/nxserver,/opt/NX/etc,g' nxloadconfig
  sed -i -e 's,authorized_keys2,authorized_keys,g' nxloadconfig
  sed -i -e 's,/usr/X11R6/bin/xauth,/usr/bin/xauth,g' nxloadconfig
  
  sed -i -e 's,/usr/NX/share/client.id_dsa.key,/opt/NX/share/client.id_dsa.key,g' nxloadconfig
  sed -i -e 's,/usr/NX/bin/nxserver,/opt/NX/bin/nxserver,g' nxloadconfig
  sed -i -e 's,/usr/NX/home/nx,/opt/NX/home/nx,g' nxloadconfig

  sed -i -e 's,/etc/nxserver,/opt/NX/etc,g' nxnode
  sed -i -e 's,/usr/lib/freenx-server,/opt/NX/lib/freenx-server,g' nxnode
  
  sed -i -e 's,AUTOMATIC="no",AUTOMATIC="yes",g' nxsetup
  sed -i -e 's,/etc/init.d/ssh,/etc/rc.d/sshd,g' nxsetup
  
  make || return 1
  make DESTDIR=${pkgdir} install
  
  cp -a $srcdir/freenx-server/freenx-server/conf/node.conf ${pkgdir}/opt/NX/etc/node.conf
  cp -a -f $srcdir/freenx-server/freenx-server/conf/conf.d ${pkgdir}/opt/NX/etc/node.conf.d
  cp -a $srcdir/freenx-server/freenx-server/data/Xkbmap ${pkgdir}/opt/NX/etc/Xkbmap
  cp -a $srcdir/freenx-server/freenx-server/data/Xsession ${pkgdir}/opt/NX/etc/Xsession
  cp -a $srcdir/freenx-server/freenx-server/data/fixkeyboard ${pkgdir}/opt/NX/etc/fixkeyboard
  
  sed -i -e 's|#ENABLE_SLAVE_MODE="1"|ENABLE_SLAVE_MODE="0"|g' ${pkgdir}/opt/NX/etc/node.conf.d/01-auth.conf
  
  sed -i -e 's,/usr/NX/share/client.id_dsa.key,/opt/NX/share/client.id_dsa.key,g' ${pkgdir}/opt/NX/etc/node.conf.d/04-forwarding.conf
  sed -i -e 's,/usr/NX/bin/nxserver,/opt/NX/bin/nxserver,g' ${pkgdir}/opt/NX/etc/node.conf.d/04-forwarding.conf
  sed -i -e 's,/usr/NX/home/nx,/opt/NX/home/nx,g' ${pkgdir}/opt/NX/etc/node.conf.d/04-forwarding.conf

  echo '' >>${pkgdir}/opt/NX/etc/node.conf.d/07-misc.conf
  echo '# Time to sleep before calling function node_start_monitor in nxnode' >>${pkgdir}/opt/NX/etc/node.conf.d/07-misc.conf
  echo '#NODE_START_MONITOR_WAIT_TIMEOUT="2"' >>${pkgdir}/opt/NX/etc/node.conf.d/07-misc.conf
 
  sed -i -e 's|#COMMAND_SMBMOUNT_CIFS=/sbin/mount.cifs|COMMAND_SMBMOUNT_CIFS="sudo /sbin/mount.cifs"|g' ${pkgdir}/opt/NX/etc/node.conf.d/06-path.conf
  sed -i -e 's|#COMMAND_SMBUMOUNT_CIFS=/sbin/umount.cifs|COMMAND_SMBUMOUNT_CIFS="sudo /sbin/umount.cifs"|g' ${pkgdir}/opt/NX/etc/node.conf.d/06-path.conf

  sed -i -e 's|#ENABLE_KDE_CUPS="1"|ENABLE_KDE_CUPS="0"|g' ${pkgdir}/opt/NX/etc/node.conf.d/09-cups.conf

  sed -i -e 's|#ENABLE_SHARE_MULTIMOUNT="0"|ENABLE_SHARE_MULTIMOUNT="1"|g' ${pkgdir}/opt/NX/etc/node.conf.d/10-samba.conf
  sed -i -e 's|#SAMBA_MOUNT_SHARE_PROTOCOL="both"|SAMBA_MOUNT_SHARE_PROTOCOL="cifs"|g' ${pkgdir}/opt/NX/etc/node.conf.d/10-samba.conf
 
  mkdir -m700 -p $startdir/pkg/opt/NX/home/nx
  mkdir -m750 -p $startdir/pkg/opt/NX/var/db
  
  mkdir -m750 -p $startdir/pkg/etc/sudoers.d
  cp -a $srcdir/freenx-server/sudoers.conf ${pkgdir}/etc/sudoers.d/sudoers.conf

}
