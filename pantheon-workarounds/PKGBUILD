# Maintainer: Que Quotion <quequotion@bugmenot.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>

pkgname=pantheon-workarounds
pkgver=2
pkgrel=2
pkgdesc='Workarounds for modular and minimal Pantheon Desktop Environments'
arch=('i686' 'x86_64')
url='https://launchpad.net/gala'
license=('GPL3')
depends=('gconf' gnome-{keyring,settings-daemon{,-compat},session}
         'polkit-gnome' 'xdg-user-dirs-gtk')
makedepends=('bzr' 'gnome-common' 'intltool')
conflicts=(gala{,-bzr} pantheon-session{,-bzr})
install='gala.install'
source=("pantheon-session::bzr+lp:~elementary-os/elementaryos/pantheon-xsession-settings"
        'pantheon-session.sh'
        'pantheon-schema.patch'
        'gnome-fallback-media-keys-helper-pantheon.desktop')
sha512sums=('SKIP'
            'b2630c31724675c247b7017eea0862c76ec80a9f46691b65bc7f76702a9cacda46d9350d3bddc05ee21ded154f4d8ab277d536439152972dca0764f28e62cb38'
            'c17ff9b6eb001b03d4eecd68fef1fbed9c90dfec0fb61140a639bd4743ffac7941095b5cef3b3d1e10cbb7602a17f7edaa9ebb7fce81e564e0950263dd2ead4a'
            'b01a18bb7829eb7a48b72c90bdf5aa5913c24247426e0bfc509cba22f49d2d8c9eb301e1937b70f3f7f01a873c987e0bdea6dd5f24f8d900b952188fa5635d39')
prepare() {
  #Take only what we need to fix runtime depencencies (should be fixed upstream in slingshot-launcher, {super-,}wingpanel, etc)
  bzr cat lp:gala/data/org.pantheon.desktop.gala.gschema.xml.in.in > "${srcdir}"/org.pantheon.desktop.gala.gschema.xml
  cd "${srcdir}"
  patch -N < pantheon-schema.patch

  export pkgvergala="$(printf "r%s" "$(bzr revno lp:gala)")"

  cd "${srcdir}"/pantheon-session

  export pkgverpantheonsession="$(printf "r%s" "$(bzr revno)")"

  sed 's/policykit-1/polkit/' -i autostart/polkit-gnome-authentication-agent-1-pantheon.desktop
  sed 's|gnome-session --session=pantheon|/usr/bin/pantheon-session|' -i debian/pantheon.desktop

  # TODO: sort and tweak pantheon-session's settings

  # This space reserved for pantheon-default-settings-bzr
}

provides=(gala{,-bzr}="${pkgvergala}" pantheon-session{,-bzr}="${pkgverpantheonsession}")

package() {

  cd "${srcdir}"/
  install -Dm644 "${srcdir}"/org.pantheon.desktop.gala.gschema.xml \
  "${pkgdir}"/usr/share/glib-2.0/schemas/org.pantheon.desktop.gala.gschema.xml

  cd "${srcdir}"/pantheon-session

  mkdir -p "${pkgdir}"/{etc/xdg,usr/share/pantheon}
  cp -dr --no-preserve='ownership' autostart "${pkgdir}/etc/xdg/"
  cp -dr --no-preserve='ownership' gconf "${pkgdir}/usr/share/GConf"
  cp -dr --no-preserve='ownership' unity-greeter "${pkgdir}/usr/share/"
  cp -dr --no-preserve='ownership' applications "${pkgdir}/usr/share/pantheon/"

  install -Dm644 "${srcdir}"/gnome-fallback-media-keys-helper-pantheon.desktop \
  "${pkgdir}"/etc/xdg/autostart/gnome-fallback-media-keys-helper-pantheon.desktop

  # This space reserved for pantheon-default-settings-bzr

  find "${pkgdir}" -type d -exec chmod 755 {} +
  find "${pkgdir}" -type f -exec chmod 644 {} +

# gnome-session workaround
  install -Dm755 "${srcdir}"/pantheon-session.sh "${pkgdir}"/usr/bin/pantheon-session

}

