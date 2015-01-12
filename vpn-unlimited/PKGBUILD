# Maintainer: Alex March <alex.march.dev@gmail.com>

pkgname=vpn-unlimited
pkgver=2.4.0
pkgrel=2
pkgdesc="VPN client for the VPN Unlimited service"
arch=('x86_64')
url="https://www.vpnunlimitedapp.com/downloadlinux"
license=('custom')
options=('emptydirs')
depends=('qt4' 'libssh2' 'libcurl-compat' 'pkcs11-helper')
source=("http://apt.simplexsolutionsinc.com/repository/pool/main/v/vpn-unlimited/${pkgname}_${pkgver}_amd64.deb"
        "vpn-unlimited-daemon.service")
md5sums=('0d14a75000af104c88247f5915dfad40'
         '7c3269456d352df8d676c722058b5067')

package() {
  # Unpack the vendor package
  cd "${srcdir}"
  tar -zxf data.tar.gz
  mv ${srcdir}/usr/sbin/* "${srcdir}/usr/bin"
  rm -rf "${srcdir}/usr/sbin/"
  cp -dpr "${srcdir}/usr" "${pkgdir}"

  install -Dm0644 "${pkgdir}/usr/share/doc/vpn-unlimited/copyright" \
    "${pkgdir}/usr/share/licenses/${pkgname}/copyright"

  # Create a custom script that forces the older libcurl
  launch_script
  


  # Change script permissions
  chmod 0755 "${pkgdir}/usr/bin/vpnu"

  # Alter the desktop file to launch our script instead
  sed -i 's/Exec=vpn-unlimited/Exec=vpnu/g' "${pkgdir}/usr/share/applications/vpn-unlimited.desktop"

  # Add our custom systemd unit
  install -Dm0644 "${srcdir}/vpn-unlimited-daemon.service" "${pkgdir}/usr/lib/systemd/system/vpn-unlimited-daemon.service"

  # Save this original file
  cp -p "${srcdir}/etc/init.d/vpn-unlimited-daemon" "${pkgdir}/usr/share/doc/vpn-unlimited/"
}

launch_script(){
cat > "${pkgdir}/usr/bin/vpnu" <<- EOF
#!/bin/sh

PID=\$(pidof vpn-unlimited-daemon)

if [[ \$EUID -ne 0 ]]; then
   echo "Must be root to run VPN daemon" 1>&2
   exit 1
else
   if [ -z \$PID ]; then
      vpn-unlimited-daemon &
      sleep 2
   fi

   LD_PRELOAD=libcurl.so.3 vpn-unlimited	
fi
EOF
}