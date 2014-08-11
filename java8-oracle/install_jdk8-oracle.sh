this_java='java-8-oracle'

update_desktop() {
  echo 'Updating desktop MIME database'
  update-desktop-database -q

  echo 'Updating MIME database'
  update-mime-database /usr/share/mime >/dev/null

  echo 'Updating icon cache'
  xdg-icon-resource forceupdate &>/dev/null
  xdg-icon-resource forceupdate --theme HighContrast &>/dev/null || true
  xdg-icon-resource forceupdate --theme HighContrastInverse &>/dev/null || true
  xdg-icon-resource forceupdate --theme LowContrast &>/dev/null || true
}

post_install() {
  default=$(/usr/bin/archlinux-java get)
  if [ -z "${default}" ]; then
    /usr/bin/archlinux-java set ${this_java}
  elif [ "${default/\/jre}" = "${this_java/\/jre}" ]; then
    /usr/bin/archlinux-java fix
  else
    echo "Default Java environment is already set to '${default}'"
    echo "To set '${this_java}' as default, consider using:"
    echo "  archlinux-java set '${this_java}'"
  fi

  update_desktop
}

post_upgrade() {
  default=$(/usr/bin/archlinux-java get)
  if [ -z "${default}" ]; then
    /usr/bin/archlinux-java set ${this_java}
  elif [ "${default/\/jre}" = "${this_java/\/jre}" ]; then
    /usr/bin/archlinux-java fix
  fi

  update_desktop
}

pre_remove() {
  default=$(/usr/bin/archlinux-java get)
  if [ "${default/\/jre}" = "${this_java/\/jre}" ]; then
    /usr/bin/archlinux-java set ${this_java}/jre
  fi

  update_desktop
}
