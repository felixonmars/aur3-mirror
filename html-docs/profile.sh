# /etc/profile.d/html-dtd.sh

if [ -f "/usr/share/doc/html/HTML4.cat" ]; then
  case "${SGML_CATALOG_FILES}" in
    /usr/share/doc/html/HTML4.cat)
      ;;
    /usr/share/doc/html/HTML4.cat:*)
      ;;
    *:/usr/share/doc/html/HTML4.cat)
      ;;
    *:/usr/share/doc/html/HTML4.cat:*)
      ;;
    *)
      SGML_CATALOG_FILES="${SGML_CATALOG_FILES:-}${SGML_CATALOG_FILES:+:}/usr/share/doc/html/HTML4.cat"
      export SGML_CATALOG_FILES
      ;;
  esac
fi

# /etc/profile.d/html-dtd.sh ends here.
